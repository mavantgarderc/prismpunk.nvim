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

local loaded_theme = nil

local cache_stats = {
  hits = 0,
  misses = 0,
}

local function debug_profile(label, start_ns)
  local debug_cfg = config.options.debug or {}
  if not debug_cfg.profile_startup or not start_ns then return end

  local elapsed_ms = (vim.loop.hrtime() - start_ns) / 1e6
  vim.notify(string.format("[prismpunk] %s: %.2fms", label, elapsed_ms), vim.log.levels.DEBUG)
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

local function highlight_cache_key(scheme_path, palette_table, opts)
  local cache_opts = {
    gutter = opts.gutter,
    styles = opts.styles,
    validate_contrast = opts.validate_contrast and opts.validate_contrast.enable,
  }

  local key_parts = {
    scheme_path,
    cache.hash(palette_table),
    cache.hash(cache_opts),
  }
  return cache.hash(key_parts)
end

local function apply_terminals(scheme_module, palette_table)
  if not scheme_module.base16 then
    vim.notify("[prismpunk] Scheme missing base16 colors - skipping terminal export", vim.log.levels.WARN)
    return
  end

  vim.schedule(function()
    local success, err = pcall(terminals.apply, { colors = scheme_module.base16 })
    if not success then
      vim.notify(string.format("[prismpunk] Terminal apply warning: %s", tostring(err)), vim.log.levels.WARN)
    end

    local scheme_for_export = {
      name = scheme_module.name,
      colors = scheme_module.base16,
      palette = palette_table,
    }
    terminals.auto_export(scheme_for_export, config.options)
  end)
end

local function run_validation(scheme_result)
  local validate_on_load = config.options.validate_on_load
  if validate_on_load == false then return end

  local validate_contrast_enabled = config.options.validate_contrast
    and config.options.validate_contrast.enable

  local result = validate.validate(scheme_result, {
    validate_colors = true,
    validate_schema = true,
    validate_contrast = validate_contrast_enabled,
    contrast_level = config.options.validate_contrast and config.options.validate_contrast.level,
  })

  for _, err in ipairs(result.errors) do
    vim.notify("[prismpunk] Scheme validation error: " .. err, vim.log.levels.ERROR)
  end

  local report_level = vim.log.levels.INFO
  if config.options.validate_contrast and config.options.validate_contrast.report_level then
    report_level = vim.log.levels[config.options.validate_contrast.report_level:upper()] or vim.log.levels.INFO
  end

  for _, warn in ipairs(result.warnings) do
    vim.notify("[prismpunk] Scheme validation: " .. warn, report_level)
  end
end

function M.clear_cache()
  highlight_cache:clear()
  cache_stats.hits = 0
  cache_stats.misses = 0
  loaded_theme = nil
  palette.clear_cache()
  resolver.clear_module_cache()
end

local function try_load_from_cache(cache_key, scheme_module, palette_table, scheme_path)
  local cached, source = highlight_cache:get(cache_key)
  if not cached then return nil end
  
  cache_stats.hits = cache_stats.hits + 1

  if source == "disk" then
    local file_path = resolver.resolve_scheme_file(scheme_path or "")
    local scheme_mtime = file_path and cache.get_mtime(file_path) or nil
    if scheme_mtime and not highlight_cache:validate_disk_cache(cache_key, scheme_mtime) then
      return nil
    end
  end

  local start_ns = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil

  highlights.apply(cached.theme, config.options)
  apply_terminals(scheme_module, palette_table)

  debug_profile("Apply from " .. source .. " cache", start_ns)

  return cached.theme
end

function M.execute(scheme_spec, opts)
  opts = opts or {}

  local spec_to_use = scheme_spec or config.options.scheme
  if not spec_to_use and config.options.theme then
    spec_to_use = config.options.theme
  end

  local parsed = resolver.parse_scheme_spec(spec_to_use)
  if not parsed.name then 
    return false, "[prismpunk] No scheme specified" 
  end

  local scheme_key = (parsed.universe or "") .. "/" .. parsed.name
  if opts.skip_if_loaded and loaded_theme == scheme_key then 
    return true, { _cached = true } 
  end

  local scheme_path, scheme_module, resolve_err = resolver.resolve_scheme_module(parsed)
  if not scheme_module then
    return false, resolve_err or "[prismpunk] Could not resolve scheme module"
  end

  if type(scheme_module.get) ~= "function" then
    return false, string.format("[prismpunk] Scheme module missing required 'get' function: %s", scheme_path)
  end

  if not config.is_scheme_allowed(scheme_spec) then
    vim.notify("[prismpunk] Scheme not in configured schemes list: " .. tostring(scheme_spec), vim.log.levels.WARN)
  end

  local palette_table
  if scheme_module.palette and type(scheme_module.palette) == "table" and scheme_module.palette.bg_darkest then
    palette_table = scheme_module.palette
    if opts.force_reload then palette.clear_cache() end
  else
    local palette_universe = parsed.universe or (scheme_module.palette and scheme_module.palette.universe)
    local palette_name = (scheme_module.palette and scheme_module.palette.name) or parsed.name

    if opts.force_reload then palette.clear_cache() end

    local start_ns = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil
    local ok, result = pcall(
      palette.create_palette,
      palette_universe,
      palette_name,
      scheme_module.palette and scheme_module.palette.overrides
    )
    debug_profile("Create palette", start_ns)
    
    if not ok then 
      return false, string.format("[prismpunk] Failed to load palette: %s", tostring(result))
    end
    palette_table = result
  end

  local cache_key = highlight_cache_key(scheme_path, palette_table, config.options)

  if config.options.cache.enable and not opts.force_reload then
    local cached_scheme = try_load_from_cache(cache_key, scheme_module, palette_table, scheme_path)
    if cached_scheme then
      loaded_theme = scheme_key
      return true, cached_scheme
    end
  end

  cache_stats.misses = cache_stats.misses + 1

  local start_ns_full = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil
  
  local ok, scheme_result = pcall(scheme_module.get, config.options, palette_table)
  if not ok then 
    return false, string.format("[prismpunk] scheme.get() failed: %s", tostring(scheme_result))
  end

  if type(scheme_result) ~= "table" then
    return false, string.format("[prismpunk] scheme.get() must return table, got %s", type(scheme_result))
  end

  if not scheme_result.ui or not scheme_result.syn then
    vim.notify(
      string.format("[prismpunk] Warning: Scheme %s may be missing required structure (ui, syn)", scheme_key),
      vim.log.levels.WARN
    )
  end

  run_validation(scheme_result)

  local normalized
  ok, normalized = pcall(highlights.normalize_theme, scheme_result, config.options)
  if not ok then 
    return false, string.format("[prismpunk] Failed to normalize scheme: %s", tostring(normalized))
  end

  if config.options.cache.enable then
    highlight_cache:set(cache_key, {
      theme = scheme_result,
      normalized = normalized,
      theme_path = scheme_path,
    })
  end

  ok, err = pcall(highlights.apply, scheme_result, config.options)
  if not ok then
    return false, string.format("[prismpunk] Failed to apply highlights: %s", tostring(err))
  end

  apply_terminals(scheme_module, palette_table)

  debug_profile("Cold load (scheme.get + normalize + highlights + terminals)", start_ns_full)
  loaded_theme = scheme_key

  return true, scheme_result
end

M._highlight_cache = highlight_cache
M._cache_stats = cache_stats

return M
