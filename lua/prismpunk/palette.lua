--- PrismPunk palette management
--- Handles palette loading, caching, and validation
local M = {}

local config = require("prismpunk.config")
local validate = require("prismpunk.core.validate")
local schema = require("prismpunk.utils.schema")
local cache = require("prismpunk.core.cache")

local palette_cache = cache.new({
  namespace = "palettes",
  enable_disk = true,
})

local function palette_cache_key(universe, name, overrides)
  local key_parts = {
    universe or "default",
    name,
    vim.inspect(overrides or {}),
  }
  return cache.hash(key_parts)
end

local function resolve_palette_module(universe, name)
  local tries = {}

  if universe and universe ~= "" then table.insert(tries, string.format("prismpunk.palettes.%s.%s", universe, name)) end
  table.insert(tries, string.format("prismpunk.palettes.%s", name))

  for _, module_path in ipairs(tries) do
    local searchpath = package.searchpath(module_path, package.path)
    if searchpath then return module_path, searchpath end

    local file_path = module_path:gsub("%.", "/") .. ".lua"
    local full_paths = {
      vim.fn.getcwd() .. "/lua/" .. file_path,
      vim.fn.stdpath("config") .. "/lua/" .. file_path,
    }

    for _, full_path in ipairs(full_paths) do
      if vim.fn.filereadable(full_path) == 1 then return module_path, full_path end
    end

    local ok = pcall(require, module_path)
    if ok then return module_path, nil end
  end

  return nil, nil
end

local function load_palette_module(universe, name)
  local module_path, file_path = resolve_palette_module(universe, name)

  if not module_path then
    error(string.format("[prismpunk] Could not find palette: %s/%s", universe or "?", name or "?"))
  end

  package.loaded[module_path] = nil

  local ok, palette = pcall(require, module_path)
  if not ok then error(string.format("[prismpunk] Failed to load palette %s: %s", module_path, tostring(palette))) end

  if type(palette) == "function" then palette = palette() end

  if type(palette) ~= "table" then
    error(string.format("[prismpunk] Palette %s must return a table, got %s", module_path, type(palette)))
  end

  return palette, file_path, module_path
end

local function normalize_palette(palette_spec, context)
  context = context or "palette"
  local normalized = vim.tbl_deep_extend("force", {}, palette_spec or {})

  local color_result = validate.validate_color_table(normalized, context)
  if not color_result.valid then
    for _, err in ipairs(color_result.errors) do
      vim.notify("[prismpunk] Palette color error: " .. err, vim.log.levels.ERROR)
    end
    for key, fixed in pairs(color_result.fixed) do
      normalized[key] = fixed
    end
  end

  for _, warn in ipairs(color_result.warnings) do
    vim.notify("[prismpunk] Palette: " .. warn, vim.log.levels.WARN)
  end

  local schema_result = validate.validate_palette_schema(normalized)
  if not schema_result.valid then
    for _, err in ipairs(schema_result.errors) do
      vim.notify("[prismpunk] Palette schema error: " .. err, vim.log.levels.ERROR)
    end
  end

  for _, warn in ipairs(schema_result.warnings) do
    vim.notify("[prismpunk] Palette: " .. warn, vim.log.levels.WARN)
  end

  return normalized, color_result, schema_result
end

function M.create_palette(universe, name, overrides)
  local cache_key = palette_cache_key(universe, name, overrides)

  if config.options.cache.enable then
    local cached, source = palette_cache:get(cache_key)
    if cached then
      if source == "disk" then
        local _, file_path = resolve_palette_module(universe, name)
        if file_path then
          local source_mtime = cache.get_mtime(file_path)
          if palette_cache:validate_disk_cache(cache_key, source_mtime) then
            return cached
          end
        else
          return cached
        end
      else
        return cached
      end
    end
  end

  local raw_palette, file_path, module_path = load_palette_module(universe, name)
  local context = module_path or string.format("%s/%s", universe or "default", name)
  local normalized = normalize_palette(raw_palette, context)

  if overrides and next(overrides) then
    normalized = vim.tbl_deep_extend("force", {}, normalized, overrides)
    local override_result = validate.validate_color_table(overrides, context .. ".overrides")
    if not override_result.valid then
      for _, err in ipairs(override_result.errors) do
        vim.notify("[prismpunk] Palette override error: " .. err, vim.log.levels.ERROR)
      end
    end
  end

  if config.options.cache.enable then
    palette_cache:set(cache_key, normalized)
  end

  return normalized
end

function M.get_cache_stats()
  return palette_cache:stats_snapshot()
end

function M.clear_cache()
  palette_cache:clear()
end

function M.create_theme(spec)
  if spec.base16 then
    return {
      name = spec.name,
      colors = spec.base16,
      palette = spec.palette or {},
      theme = spec.get and spec.get({}, spec.palette or {}) or {},
    }
  end
  return spec
end

M._cache = palette_cache

return M
