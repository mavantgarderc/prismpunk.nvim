--- PrismPunk palette management
--- Handles palette loading, caching, and validation
local M = {}

local config = require("prismpunk.config")

--- In-memory palette cache
local palette_cache = {}

--- Cache statistics
local cache_stats = {
  hits = 0,
  misses = 0,
}

--- Get cache statistics
--- @return table { hits = number, misses = number }
function M.get_cache_stats() return vim.tbl_extend("force", {}, cache_stats) end

--- Compute cache key for palette
--- @param universe string|nil
--- @param name string
--- @param overrides table|nil
--- @return string
local function palette_cache_key(universe, name, overrides)
  local key_parts = {
    universe or "default",
    name,
    vim.inspect(overrides or {}),
  }
  return vim.fn.sha256(table.concat(key_parts, "::"))
end

--- Get disk cache path for palette
--- @param cache_key string
--- @return string
local function get_disk_cache_path(cache_key)
  local cache_dir = vim.fn.stdpath("cache") .. "/prismpunk/palettes"
  vim.fn.mkdir(cache_dir, "p")
  return cache_dir .. "/" .. cache_key .. ".lua"
end

--- Load palette from disk cache
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

--- Save palette to disk cache
--- @param cache_key string
--- @param palette table
local function save_to_disk_cache(cache_key, palette)
  if not config.options.cache.persist_to_disk then return end

  local cache_path = get_disk_cache_path(cache_key)

  local ok, serialized = pcall(function() return "return " .. vim.inspect(palette) end)

  if not ok then return end

  local file = io.open(cache_path, "w")
  if file then
    file:write(serialized)
    file:close()
  end
end

--- Get file modification time
--- @param path string
--- @return number|nil mtime (seconds since epoch)
local function get_mtime(path)
  local stat = vim.loop.fs_stat(path)
  if stat then return stat.mtime.sec end
  return nil
end

--- Resolve palette module path
--- @param universe string|nil
--- @param name string
--- @return string|nil, string|nil module_path, file_path
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
  end

  return nil, nil
end

--- Load palette module
--- @param universe string|nil
--- @param name string
--- @return table
local function load_palette_module(universe, name)
  local module_path, file_path = resolve_palette_module(universe, name)

  if not module_path then
    error(string.format("[prismpunk] Could not find palette: %s/%s", universe or "?", name or "?"))
  end

  -- Clear module cache to ensure fresh load
  package.loaded[module_path] = nil

  local ok, palette = pcall(require, module_path)
  if not ok then error(string.format("[prismpunk] Failed to load palette %s: %s", module_path, tostring(palette))) end

  if type(palette) == "function" then palette = palette() end

  if type(palette) ~= "table" then
    error(string.format("[prismpunk] Palette %s must return a table, got %s", module_path, type(palette)))
  end

  return palette, file_path
end

--- Normalize palette (ensure all required fields exist)
--- @param palette_spec table
--- @return table
local function normalize_palette(palette_spec)
  local normalized = vim.tbl_deep_extend("force", {}, palette_spec or {})

  -- Validate that palette has color keys
  local has_colors = false
  for _, v in pairs(normalized) do
    if type(v) == "string" and v:match("^#%x+$") then
      has_colors = true
      break
    end
  end

  if not has_colors then
    vim.notify("[prismpunk] Warning: Palette appears to have no color definitions", vim.log.levels.WARN)
  end

  return normalized
end

--- Create or retrieve cached palette
--- @param universe string|nil
--- @param name string
--- @param overrides table|nil
--- @return table palette
function M.create_palette(universe, name, overrides)
  local cache_key = palette_cache_key(universe, name, overrides)

  -- Check in-memory cache
  if config.options.cache.enable and palette_cache[cache_key] then
    cache_stats.hits = cache_stats.hits + 1
    return palette_cache[cache_key]
  end

  cache_stats.misses = cache_stats.misses + 1

  -- Check disk cache with mtime validation
  local disk_cached = load_from_disk_cache(cache_key)
  if disk_cached then
    local _, file_path = resolve_palette_module(universe, name)
    if file_path then
      local palette_mtime = get_mtime(file_path)
      local cache_path = get_disk_cache_path(cache_key)
      local cache_mtime = get_mtime(cache_path)

      -- Use disk cache if it's newer than source file
      if cache_mtime and palette_mtime and cache_mtime >= palette_mtime then
        if config.options.cache.enable then palette_cache[cache_key] = disk_cached end
        return disk_cached
      end
    else
      -- No file path (installed plugin), trust disk cache
      if config.options.cache.enable then palette_cache[cache_key] = disk_cached end
      return disk_cached
    end
  end

  -- Load fresh palette
  local raw_palette = load_palette_module(universe, name)
  local normalized = normalize_palette(raw_palette)

  -- Apply overrides
  if overrides and next(overrides) then normalized = vim.tbl_deep_extend("force", {}, normalized, overrides) end

  -- Cache results
  if config.options.cache.enable then
    palette_cache[cache_key] = normalized
    save_to_disk_cache(cache_key, normalized)
  end

  return normalized
end

--- Clear palette cache
function M.clear_cache()
  palette_cache = {}
  cache_stats.hits = 0
  cache_stats.misses = 0

  -- Clear disk cache
  if config.options.cache.persist_to_disk then
    local cache_dir = vim.fn.stdpath("cache") .. "/prismpunk/palettes"
    if vim.fn.isdirectory(cache_dir) == 1 then vim.fn.delete(cache_dir, "rf") end
  end
end

-- Export for testing
M._cache = palette_cache
M._stats = cache_stats

return M
