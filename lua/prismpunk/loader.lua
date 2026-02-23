--- PrismPunk loader - main entry point for theme loading
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

function M.load(theme_spec, opts)
  return pipeline.execute(theme_spec, opts)
end

function M.list_themes()
  return resolver.list_themes()
end

function M.get_allowed_theme_list()
  local allowed = config.get_allowed_themes()
  if #allowed == 0 then return M.list_themes() end

  local all_themes = M.list_themes()
  local result = {}

  for _, allowed_item in ipairs(allowed) do
    local is_universe = false
    for _, theme in ipairs(all_themes) do
      if theme:find("^" .. allowed_item .. "/") then
        table.insert(result, theme)
        is_universe = true
      end
    end

    if not is_universe then
      table.insert(result, allowed_item)
    end
  end

  return result
end

function M.get_theme_info(theme_name)
  local info = resolver.get_theme_info(theme_name)
  if not info then return nil end

  local parsed = resolver.parse_theme_spec(theme_name)
  local palette_table

  if info.module and info.module.palette then
    local palette_universe = parsed.universe or (info.module.palette and info.module.palette.universe)
    local palette_name = (info.module.palette and info.module.palette.name) or parsed.name
    
    local palette = require("prismpunk.palette")
    local ok, result = pcall(palette.create_palette, palette_universe, palette_name, info.module.palette and info.module.palette.overrides)
    if ok then
      palette_table = result
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

function M.clear_theme_cache()
  resolver.clear_themes_cache()
end

M._resolver = resolver
M._pipeline = pipeline

return M
