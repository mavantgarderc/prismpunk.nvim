--- PrismPunk Theme Loading Pipeline
--- Orchestrates palette creation, theme generation, and highlight application
local M = {}

local config = require("prismpunk.config")
local palette = require("prismpunk.palette")
local highlights = require("prismpunk.core.highlights")
local terminals = require("prismpunk.core.terminals")
local validate = require("prismpunk.core.validate")
local cache = require("prismpunk.core.cache")
local resolver = require("prismpunk.core.loader.resolver")

local highlight_cache = cache.new({
  namespace = "highlights",
  enable_disk = true,
})

local cache_stats = {
  hits = 0,
  misses = 0,
}

local loaded_theme = nil

local function debug_profile(label, start_ns)
  local debug_cfg = config.options.debug or {}
  if not debug_cfg.profile_startup or not start_ns then return end

  local elapsed_ms = (vim.loop.hrtime() - start_ns) / 1e6
  vim.notify(string.format("[prismpunk] %s: %.2fms", label, elapsed_ms), vim.log.levels.DEBUG)
end

local function highlight_cache_key(theme_path, palette_table, opts)
  local cache_opts = {
    gutter = opts.gutter,
    styles = opts.styles,
    validate_contrast = opts.validate_contrast and opts.validate_contrast.enable,
  }

  local key_parts = {
    theme_path,
    cache.hash(palette_table),
    cache.hash(cache_opts),
  }
  return cache.hash(key_parts)
end

local function apply_terminals(theme_module, palette_table)
  if not theme_module.base16 then
    vim.notify("[prismpunk] Theme missing base16 colors - skipping terminal export", vim.log.levels.WARN)
    return
  end

  vim.schedule(function()
    local success, err = pcall(terminals.apply, { colors = theme_module.base16 })
    if not success then
      vim.notify(string.format("[prismpunk] Terminal apply warning: %s", tostring(err)), vim.log.levels.WARN)
    end

    local theme_for_export = {
      name = theme_module.name,
      colors = theme_module.base16,
      palette = palette_table,
    }
    terminals.auto_export(theme_for_export, config.options)
  end)
end

local function run_validation(theme_result)
  local validate_on_load = config.options.validate_on_load
  if validate_on_load == false then return end

  local validate_contrast_enabled = config.options.validate_contrast
    and config.options.validate_contrast.enable

  local result = validate.validate(theme_result, {
    validate_colors = true,
    validate_schema = true,
    validate_contrast = validate_contrast_enabled,
    contrast_level = config.options.validate_contrast and config.options.validate_contrast.level,
  })

  for _, err in ipairs(result.errors) do
    vim.notify("[prismpunk] Theme validation error: " .. err, vim.log.levels.ERROR)
  end

  local report_level = vim.log.levels.INFO
  if config.options.validate_contrast and config.options.validate_contrast.report_level then
    report_level = vim.log.levels[config.options.validate_contrast.report_level:upper()] or vim.log.levels.INFO
  end

  for _, warn in ipairs(result.warnings) do
    vim.notify("[prismpunk] Theme validation: " .. warn, report_level)
  end
end

local function validate_theme(theme_result)
  local validate_on_load = config.options.validate_on_load
  if validate_on_load == nil or validate_on_load then
    local color_result = validate.check_color_formats(theme_result)
    if not color_result.valid then
      for _, err in ipairs(color_result.errors) do
        vim.notify("[prismpunk] Theme color error: " .. err, vim.log.levels.ERROR)
      end
    end

    local schema_result = validate.check_theme_color_schema(theme_result)
    if not schema_result.valid then
      for _, err in ipairs(schema_result.errors) do
        vim.notify("[prismpunk] Theme schema error: " .. err, vim.log.levels.ERROR)
      end
    end
  end
end

local function validate_contrast(theme)
  local validate_opts = config.options.validate_contrast
  if not validate_opts or not validate_opts.enable then return end

  if not theme.ui or not theme.ui.fg or not theme.ui.bg then return end

  local level = validate_opts.level or "aa"
  local report_level = validate_opts.report_level or "info"

  local ok, contrast_result = pcall(function()
    return validate.check_wcag_contrast(theme, { level = level })
  end)

  if ok and contrast_result and not contrast_result.passed then
    local level_num = vim.log.levels[report_level:upper()] or vim.log.levels.INFO

    for _, err in ipairs(contrast_result.errors or {}) do
      vim.notify(string.format("[prismpunk] Contrast: %s", err), level_num)
    end
    for _, warn in ipairs(contrast_result.warnings or {}) do
      vim.notify(string.format("[prismpunk] Contrast: %s", warn), level_num)
    end
  end
end

function M.get_cache_stats()
  local palette_stats = palette.get_cache_stats()
  return {
    palette_hits = palette_stats.hits,
    palette_misses = palette_stats.misses,
    highlight_hits = cache_stats.hits,
    highlight_misses = cache_stats.misses,
  }
end

function M.clear_cache()
  highlight_cache:clear()
  cache_stats.hits = 0
  cache_stats.misses = 0
  loaded_theme = nil
  palette.clear_cache()
  resolver.clear_module_cache()
end

local function try_load_from_cache(cache_key, theme_module, palette_table, theme_path)
  local cached, source = highlight_cache:get(cache_key)
  if not cached then return nil end
  
  cache_stats.hits = cache_stats.hits + 1

  if source == "disk" then
    local file_path = resolver.resolve_theme_file(theme_path or "")
    local theme_mtime = file_path and cache.get_mtime(file_path) or nil
    if theme_mtime and not highlight_cache:validate_disk_cache(cache_key, theme_mtime) then
      return nil
    end
  end

  local start_ns = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil

  highlights.apply(cached.theme, config.options)
  apply_terminals(theme_module, palette_table)

  debug_profile("Apply from " .. source .. " cache", start_ns)

  return cached.theme
end

function M.execute(theme_spec, opts)
  opts = opts or {}

  local parsed = resolver.parse_theme_spec(theme_spec or config.options.theme)
  if not parsed.name then 
    return false, "[prismpunk] No theme specified" 
  end

  local theme_key = (parsed.universe or "") .. "/" .. parsed.name
  if opts.skip_if_loaded and loaded_theme == theme_key then 
    return true, { _cached = true } 
  end

  local theme_path, theme_module, resolve_err = resolver.resolve_theme_module(parsed)
  if not theme_module then
    return false, resolve_err or "[prismpunk] Could not resolve theme module"
  end

  if type(theme_module.get) ~= "function" then
    return false, string.format("[prismpunk] Theme module missing required 'get' function: %s", theme_path)
  end

  if not config.is_theme_allowed(theme_spec) then
    vim.notify("[prismpunk] Theme not in configured themes list: " .. tostring(theme_spec), vim.log.levels.WARN)
  end

  local palette_universe = parsed.universe or (theme_module.palette and theme_module.palette.universe)
  local palette_name = (theme_module.palette and theme_module.palette.name) or parsed.name

  if opts.force_reload then palette.clear_cache() end

  local palette_table
  do
    local start_ns = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil
    local ok, result = pcall(
      palette.create_palette,
      palette_universe,
      palette_name,
      theme_module.palette and theme_module.palette.overrides
    )
    debug_profile("Create palette", start_ns)
    
    if not ok then 
      return false, string.format("[prismpunk] Failed to load palette: %s", tostring(result))
    end
    palette_table = result
  end

  local cache_key = highlight_cache_key(theme_path, palette_table, config.options)

  if config.options.cache.enable and not opts.force_reload then
    local cached_theme = try_load_from_cache(cache_key, theme_module, palette_table, theme_path)
    if cached_theme then
      loaded_theme = theme_key
      return true, cached_theme
    end
  end

  cache_stats.misses = cache_stats.misses + 1

  local start_ns_full = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil
  
  local ok, theme_result = pcall(theme_module.get, config.options, palette_table)
  if not ok then 
    return false, string.format("[prismpunk] theme.get() failed: %s", tostring(theme_result))
  end

  if type(theme_result) ~= "table" then
    return false, string.format("[prismpunk] theme.get() must return table, got %s", type(theme_result))
  end

  if not theme_result.ui or not theme_result.syn then
    vim.notify(
      string.format("[prismpunk] Warning: Theme %s may be missing required structure (ui, syn)", theme_key),
      vim.log.levels.WARN
    )
  end

  run_validation(theme_result)

  local normalized
  ok, normalized = pcall(highlights.normalize_theme, theme_result, config.options)
  if not ok then 
    return false, string.format("[prismpunk] Failed to normalize theme: %s", tostring(normalized))
  end

  if config.options.cache.enable then
    highlight_cache:set(cache_key, {
      theme = theme_result,
      normalized = normalized,
      theme_path = theme_path,
    })
  end

  ok, err = pcall(highlights.apply, theme_result, config.options)
  if not ok then
    return false, string.format("[prismpunk] Failed to apply highlights: %s", tostring(err))
  end

  apply_terminals(theme_module, palette_table)

  debug_profile("Cold load (theme.get + normalize + highlights + terminals)", start_ns_full)
  loaded_theme = theme_key

  return true, theme_result
end

M._highlight_cache = highlight_cache
M._cache_stats = cache_stats

return M
