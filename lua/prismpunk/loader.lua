--- PrismPunk loader - main entry point for scheme loading
--- Delegates to resolver and pipeline modules
local M = {}

local config = require("prismpunk.config")
local resolver = require("prismpunk.core.loader.resolver")
local pipeline = require("prismpunk.core.loader.pipeline")

function M.get_cache_stats()
  return pipeline.get_cache_stats()
end

function M.clear_cache()
  pipeline.clear_cache()
  vim.notify("[prismpunk] All caches cleared", vim.log.levels.INFO)
end

function M.load(scheme_spec, opts)
  return pipeline.execute(scheme_spec, opts or {})
end

function M.list_schemes()
  return resolver.list_schemes()
end

function M.get_allowed_scheme_list()
  local allowed = config.get_allowed_themes()
  if #allowed == 0 then return M.list_schemes() end

  local all_schemes = M.list_schemes()
  local result = {}

  for _, allowed_item in ipairs(allowed) do
    local is_universe = false
    for _, scheme in ipairs(all_schemes) do
      if scheme:find("^" .. allowed_item .. "/") then
        table.insert(result, scheme)
        is_universe = true
      end
    end

    if not is_universe then
      table.insert(result, allowed_item)
    end
  end

  return result
end

function M.get_scheme_info(scheme_name)
  local info = resolver.get_scheme_info(scheme_name)
  if not info then return nil end

  local parsed = resolver.parse_scheme_spec(scheme_name)
  local palette_table

  if info.module and info.module.palette then
    local palette_universe = parsed.universe or (info.module.palette and info.module.palette.universe)
    local palette_name = (info.module.palette and info.module.palette.name) or parsed.name
    
    local palette = require("prismpunk.palette")
    local ok, result = pcall(palette.create_palette, palette_universe, palette_name, info.module.palette and info.module.palette.overrides)
    if ok then
      palette_table = result
    else
      palette_table = info.module.palette
    end
  end

  return {
    name = info.name,
    author = info.author,
    description = info.description,
    universe = info.universe,
    base16 = info.base16,
    palette = palette_table or {},
  }
end

function M.clear_scheme_cache()
  resolver.clear_schemes_cache()
end

M.list_themes = M.list_schemes
M.get_theme_info = M.get_scheme_info
M.get_allowed_theme_list = M.get_allowed_scheme_list
M.clear_theme_cache = M.clear_scheme_cache

M._resolver = resolver
M._pipeline = pipeline

return M
