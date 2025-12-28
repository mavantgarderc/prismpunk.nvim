--- PrismPunk loader - orchestrates theme loading
--- Central coordinator for palette, theme, highlights, and terminals
local M = {}

local config = require("prismpunk.config")
local palette = require("prismpunk.palette")
local highlights = require("prismpunk.core.highlights")
local terminals = require("prismpunk.core.terminals")

local module_cache = {
  themes = {},
  highlights = {},
}

local highlight_cache = {}

local loaded_theme = nil

local cache_stats = {
  hits = 0,
  misses = 0,
}

--- Debug profiling helper
--- @param label string
--- @param start_ns integer|nil
local function debug_profile(label, start_ns)
  local debug_cfg = config.options.debug or {}
  if not debug_cfg.profile_startup or not start_ns then return end

  local elapsed_ms = (vim.loop.hrtime() - start_ns) / 1e6
  vim.notify(string.format("[prismpunk] %s: %.2fms", label, elapsed_ms), vim.log.levels.INFO)
end

--- @return table
function M.get_cache_stats()
  local palette_stats = palette.get_cache_stats()
  return {
    palette_hits = palette_stats.hits,
    palette_misses = palette_stats.misses,
    highlight_hits = cache_stats.hits,
    highlight_misses = cache_stats.misses,
  }
end

--- Get disk cache path for highlights
--- @param cache_key string
--- @return string
local function get_disk_cache_path(cache_key)
  local cache_dir = vim.fn.stdpath("cache") .. "/prismpunk/highlights"
  vim.fn.mkdir(cache_dir, "p")
  return cache_dir .. "/" .. cache_key .. ".lua"
end

--- Load highlights from disk cache
--- @param cache_key string
--- @return table|nil
local function load_from_disk_cache(cache_key)
  if not config.options.cache.persist_to_disk then return nil end

  local cache_path = get_disk_cache_path(cache_key)

  if vim.fn.filereadable(cache_path) == 0 then return nil end

  local ok, cached_data = pcall(dofile, cache_path)
  if ok and type(cached_data) == "table" then return cached_data end

  return nil
end

--- Save highlights to disk cache
--- @param cache_key string
--- @param theme_data table
local function save_to_disk_cache(cache_key, theme_data)
  if not config.options.cache.persist_to_disk then return end

  local cache_path = get_disk_cache_path(cache_key)

  local ok, serialized = pcall(function() return "return " .. vim.inspect(theme_data) end)

  if not ok then return end

  local file = io.open(cache_path, "w")
  if file then
    file:write(serialized)
    file:close()
  end
end

--- Get file modification time
--- @param path string
--- @return number|nil
local function get_mtime(path)
  local stat = vim.loop.fs_stat(path)
  if stat then return stat.mtime.sec end
  return nil
end

--- Resolve theme module path with multiple format attempts
--- @param spec table Normalized theme spec with variants
--- @return string, table module_path, theme_module
local function resolve_theme_module(spec)
  local cache_key = (spec.universe or "") .. "/" .. spec.name
  if module_cache.themes[cache_key] then
    return module_cache.themes[cache_key].path, module_cache.themes[cache_key].module
  end

  local tries = {}

  if spec.variants and #spec.variants > 0 then
    for _, variant in ipairs(spec.variants) do
      if variant.universe and variant.universe ~= "" then
        local universe_dotted = variant.universe:gsub("/", ".")
        table.insert(tries, string.format("prismpunk.themes.%s.%s", universe_dotted, variant.name))
      end
    end
  end

  if spec.universe and spec.universe ~= "" then
    local universe_dotted = spec.universe:gsub("/", ".")
    table.insert(tries, string.format("prismpunk.themes.%s.%s", universe_dotted, spec.name))
  end
  table.insert(tries, string.format("prismpunk.themes.%s", spec.name))

  for _, module_path in ipairs(tries) do
    local ok, mod = pcall(require, module_path)
    if ok and type(mod) == "table" and type(mod.get) == "function" then
      module_cache.themes[cache_key] = {
        path = module_path,
        module = mod,
      }
      return module_path, mod
    end
  end

  local tried_paths = table.concat(tries, "\n  - ")
  error(
    string.format(
      "[prismpunk] Could not resolve theme: %s\nTried:\n  - %s",
      spec.universe and (spec.universe .. "/" .. spec.name) or spec.name,
      tried_paths
    )
  )
end

--- Compute highlight cache key (MORE STABLE)
--- @param theme_path string
--- @param palette_table table
--- @param opts table
--- @return string
local function highlight_cache_key(theme_path, palette_table, opts)
  local cache_opts = {
    gutter = opts.gutter,
    styles = opts.styles,
    validate_contrast = opts.validate_contrast,
  }

  local key_parts = {
    theme_path,
    vim.fn.sha256(vim.inspect(palette_table)),
    vim.fn.sha256(vim.inspect(cache_opts)),
  }
  return vim.fn.sha256(table.concat(key_parts, "||"))
end

--- Apply terminal configurations (both Neovim and external emulators)
--- @param theme_module table
--- @param palette_table table
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

--- Validate contrast (opt-in feature)
--- @param theme table
local function validate_contrast(theme)
  if not config.options.validate_contrast then return end

  if not theme.ui or not theme.ui.fg or not theme.ui.bg then return end

  local utils = require("prismpunk.utils.color")

  local ok, contrast = pcall(function()
    local fg_lum = utils.get_luminance(theme.ui.fg)
    local bg_lum = utils.get_luminance(theme.ui.bg)
    return utils.calculate_contrast(fg_lum, bg_lum)
  end)

  if ok and contrast then
    if contrast < 4.5 then
      vim.notify(
        string.format("[prismpunk] Warning: Low contrast ratio %.2f:1 (WCAG AA requires 4.5:1)", contrast),
        vim.log.levels.WARN
      )
    end
  end
end

function M.clear_cache()
  highlight_cache = {}
  cache_stats.hits = 0
  cache_stats.misses = 0

  palette.clear_cache()

  if config.options.cache.persist_to_disk then
    local cache_dir = vim.fn.stdpath("cache") .. "/prismpunk/highlights"
    if vim.fn.isdirectory(cache_dir) == 1 then vim.fn.delete(cache_dir, "rf") end
  end
end

--- Load and apply a theme
--- @param theme_spec string|table Theme specification
--- @param opts table Options { force_reload = boolean, skip_if_loaded = boolean }
--- @return boolean success
--- @return table|string theme_or_error
function M.load(theme_spec, opts)
  opts = opts or {}

  local ok, parsed = pcall(config.parse_theme, theme_spec or config.options.theme)
  if not ok then return false, string.format("[prismpunk] Invalid theme spec: %s", tostring(parsed)) end

  if not parsed.name then return false, "[prismpunk] No theme specified" end

  local theme_key = (parsed.universe or "") .. "/" .. parsed.name
  if opts.skip_if_loaded and loaded_theme == theme_key then return true, { _cached = true } end

  local theme_path, theme_module
  ok, theme_path, theme_module = pcall(resolve_theme_module, parsed)
  if not ok then return false, tostring(theme_path) end

  if type(theme_module) ~= "table" or type(theme_module.get) ~= "function" then
    return false, string.format("[prismpunk] Theme module missing required 'get' function: %s", theme_path)
  end

  local palette_universe = parsed.universe or (theme_module.palette and theme_module.palette.universe) or nil
  local palette_name = (theme_module.palette and theme_module.palette.name) or parsed.name

  if opts.force_reload then palette.clear_cache() end

  local palette_table
  do
    local start_ns = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil
    ok, palette_table = pcall(
      palette.create_palette,
      palette_universe,
      palette_name,
      theme_module.palette and theme_module.palette.overrides
    )
    debug_profile("Create palette", start_ns)
  end

  if not ok then return false, string.format("[prismpunk] Failed to load palette: %s", tostring(palette_table)) end

  local cache_key = highlight_cache_key(theme_path, palette_table, config.options)

  if config.options.cache.enable and not opts.force_reload then
    if highlight_cache[cache_key] then
      cache_stats.hits = cache_stats.hits + 1
      local cached = highlight_cache[cache_key]

      local start_ns = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil

      highlights.apply(cached.theme, config.options)
      apply_terminals(theme_module, palette_table)

      debug_profile("Apply from in-memory cache", start_ns)
      loaded_theme = theme_key

      return true, cached.theme
    end

    local disk_cached = load_from_disk_cache(cache_key)
    if disk_cached then
      local file_path = theme_path:gsub("%.", "/") .. ".lua"
      local full_paths = {
        vim.fn.getcwd() .. "/lua/" .. file_path,
        vim.fn.stdpath("config") .. "/lua/" .. file_path,
      }

      local theme_mtime = nil
      for _, path in ipairs(full_paths) do
        if vim.fn.filereadable(path) == 1 then
          theme_mtime = get_mtime(path)
          break
        end
      end

      local cache_path = get_disk_cache_path(cache_key)
      local cache_mtime = get_mtime(cache_path)

      if not theme_mtime or (cache_mtime and cache_mtime >= theme_mtime) then
        cache_stats.hits = cache_stats.hits + 1
        highlight_cache[cache_key] = disk_cached

        local start_ns = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil

        highlights.apply(disk_cached.theme, config.options)
        apply_terminals(theme_module, palette_table)

        debug_profile("Apply from disk cache", start_ns)
        loaded_theme = theme_key

        return true, disk_cached.theme
      end
    end
  end

  cache_stats.misses = cache_stats.misses + 1

  local start_ns_full = (config.options.debug and config.options.debug.profile_startup) and vim.loop.hrtime() or nil
  local theme_result
  ok, theme_result = pcall(theme_module.get, config.options, palette_table)

  if not ok then return false, string.format("[prismpunk] theme.get() failed: %s", tostring(theme_result)) end

  if type(theme_result) ~= "table" then
    return false, string.format("[prismpunk] theme.get() must return table, got %s", type(theme_result))
  end

  if not theme_result.ui or not theme_result.syn then
    vim.notify(
      string.format("[prismpunk] Warning: Theme %s may be missing required structure (ui, syn)", theme_key),
      vim.log.levels.WARN
    )
  end

  validate_contrast(theme_result)

  local normalized
  ok, normalized = pcall(highlights.normalize_theme, theme_result, config.options)

  if not ok then return false, string.format("[prismpunk] Failed to normalize theme: %s", tostring(normalized)) end

  if config.options.cache.enable then
    local cache_data = {
      theme = theme_result,
      normalized = normalized,
    }
    highlight_cache[cache_key] = cache_data
    save_to_disk_cache(cache_key, cache_data)
  end

  ok, err = pcall(highlights.apply, theme_result, config.options) --luacheck: ignore
  if not ok then -- luachec: ignore
    return false, string.format("[prismpunk] Failed to apply highlights: %s", tostring(err)) -- luacheck: ignore
  end

  apply_terminals(theme_module, palette_table)

  debug_profile("Cold load (theme.get + normalize + highlights + terminals)", start_ns_full)
  loaded_theme = theme_key

  return true, theme_result
end

-- Cache for theme listing to improve performance
local themes_cache = nil
local themes_cache_time = 0
local CACHE_TTL = 30

--- Discover and list all available themes
--- @return table List of theme names in "universe/theme" format
function M.list_themes()
  ---@diagnostic disable-next-line: param-type-mismatch
  local current_time = os.time(os.date("*t"))
  if themes_cache and (current_time - themes_cache_time) < CACHE_TTL then return themes_cache end

  local themes = {}

  local themes_dir = vim.fn.stdpath("data") .. "/site/lua/prismpunk/themes" --luacheck: ignore

  local current_dir = debug.getinfo(1).source:match("@?(.*/)") or "."
  local current_themes_dir = current_dir:gsub("/lua/prismpunk/loader%.lua$", "") .. "/lua/prismpunk/themes"

  local possible_dirs = {
    current_themes_dir,
    vim.fn.stdpath("data") .. "/site/pack/*/start/*/lua/prismpunk/themes",
    vim.fn.stdpath("data") .. "/site/lua/prismpunk/themes",
  }

  local themes_dir = nil --luacheck: ignore
  for _, dir in ipairs(possible_dirs) do
    if vim.fn.isdirectory(dir) == 1 then
      themes_dir = dir
      break
    end
  end

  if not themes_dir then
    local fallback_themes = {
      "kanagawa/paper-edo",
      "kanagawa/paper-dawn",
      "kanagawa/paper-dragon",
      "dc/lantern-corps/phantom-corrupted",
      "dc/lantern-corps/green",
      "dc/lantern-corps/red",
      "tmnt/leonardo",
      "tmnt/raphael",
      "tmnt/donatello",
      "tmnt/michelangelo",
      "justice-league/superman",
      "justice-league/batman",
      "justice-league/wonder-woman",
      "injustice-league/joker",
      "injustice-league/sinestro",
    }

    for _, theme in ipairs(fallback_themes) do
      local parsed = require("prismpunk.config").parse_theme(theme)
      local theme_path
      if parsed.universe then
        theme_path = "prismpunk.themes." .. parsed.universe:gsub("/", ".") .. "." .. parsed.name
      else
        theme_path = "prismpunk.themes." .. parsed.name
      end

      local ok, _ = pcall(require, theme_path)
      if ok then table.insert(themes, theme) end
    end

    themes_cache = themes
    themes_cache_time = current_time
    return themes
  end

  local universes = vim.fn.readdir(themes_dir)

  for _, universe in ipairs(universes) do
    local universe_path = themes_dir .. "/" .. universe

    if vim.fn.isdirectory(universe_path) == 1 then
      local theme_files = vim.fn.readdir(universe_path)

      for _, file in ipairs(theme_files) do
        if file:match("%.lua$") then
          local theme_name = file:gsub("%.lua$", "")
          table.insert(themes, universe .. "/" .. theme_name)
        end
      end
    end
  end

  themes_cache = themes
  themes_cache_time = current_time
  return themes
end

--- Clear the theme listing cache
function M.clear_theme_cache()
  themes_cache = nil
  themes_cache_time = 0
end

M._highlight_cache = highlight_cache
M._cache_stats = cache_stats

return M
