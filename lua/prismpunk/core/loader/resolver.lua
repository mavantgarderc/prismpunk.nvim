--- PrismPunk Theme Resolver
--- Handles theme module resolution and discovery
local M = {}

local config = require("prismpunk.config")

local module_cache = {}

local KNOWN_PARENTS = {
  ["lantern-corps"] = "dc",
  ["justice-league"] = "dc",
  ["injustice-league"] = "dc",
  ["bat-family"] = "dc",
  ["arkham-asylum"] = "dc",
  ["league-of-assassins"] = "dc",
  ["crime-syndicate"] = "dc",
  ["apokolips"] = "dc",
  ["new-genesis"] = "dc",
  ["super-family"] = "dc",
  ["watchmen"] = "dc",
  ["emotional-entities"] = "dc",
  ["ultraviolet"] = "dc",
}

local DISCOVERY_PARENTS = { "dc", "marvel" }

local function parse_two_part_theme(category, name)
  local variants = {}

  local parent = KNOWN_PARENTS[category]
  if parent then
    local universe = parent .. "/" .. category
    table.insert(variants, { universe = universe, name = name })
    return { universe = universe, name = name, variants = variants }
  end

  table.insert(variants, { universe = category, name = name })

  for _, parent_name in ipairs(DISCOVERY_PARENTS) do
    table.insert(variants, { universe = parent_name .. "/" .. category, name = name })
  end

  return { universe = category, name = name, variants = variants }
end

function M.parse_theme_spec(theme_spec)
  if not theme_spec or theme_spec == "" then return { universe = nil, name = nil, variants = {} } end

  if type(theme_spec) == "string" then
    local parts = vim.split(theme_spec, "/")

    if #parts == 3 then
      local universe = parts[1] .. "/" .. parts[2]
      local name = parts[3]
      return { universe = universe, name = name, variants = { { universe = universe, name = name } } }
    elseif #parts == 2 then
      return parse_two_part_theme(parts[1], parts[2])
    else
      return { universe = nil, name = theme_spec, variants = {} }
    end
  elseif type(theme_spec) == "table" then
    return {
      universe = theme_spec.universe,
      name = theme_spec.name or theme_spec[1],
      opts = theme_spec.opts or {},
      variants = {},
    }
  else
    error(string.format("[prismpunk] Invalid theme_spec type: %s (expected string or table)", type(theme_spec)))
  end
end

function M.resolve_theme_file(module_path)
  local file_path = module_path:gsub("%.", "/") .. ".lua"

  local searchpath = package.searchpath(module_path, package.path)
  if searchpath then return searchpath end

  local full_paths = {
    vim.fn.getcwd() .. "/lua/" .. file_path,
    vim.fn.stdpath("config") .. "/lua/" .. file_path,
  }

  for _, path in ipairs(full_paths) do
    if vim.fn.filereadable(path) == 1 then
      return path
    end
  end

  return nil
end

function M.resolve_theme_module(spec)
  local cache_key = (spec.universe or "") .. "/" .. spec.name
  if module_cache[cache_key] then
    return module_cache[cache_key].path, module_cache[cache_key].module
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
      module_cache[cache_key] = {
        path = module_path,
        module = mod,
      }
      return module_path, mod
    end
  end

  local tried_paths = table.concat(tries, "\n  - ")
  return nil, nil, string.format(
    "[prismpunk] Could not resolve theme: %s\nTried:\n  - %s",
    spec.universe and (spec.universe .. "/" .. spec.name) or spec.name,
    tried_paths
  )
end

function M.clear_module_cache()
  module_cache = {}
end

local themes_cache = nil
local themes_cache_time = 0
local CACHE_TTL = 30

local function find_themes_dir()
  local searchpath = package.searchpath("prismpunk.loader", package.path)
  if searchpath then
    local loader_path = searchpath:gsub("/loader%.lua$", "")
    local themes_path = loader_path .. "/themes"
    if vim.fn.isdirectory(themes_path) == 1 then
      return themes_path
    end
  end

  local rtp = vim.opt.rtp:get()
  for _, path in ipairs(rtp) do
    local themes_paths = {
      path .. "/prismpunk/themes",
      path .. "/lua/prismpunk/themes",
    }
    for _, themes_path in ipairs(themes_paths) do
      if vim.fn.isdirectory(themes_path) == 1 then
        return themes_path
      end
    end
  end

  local data_path = vim.fn.stdpath("data")
  local lazy_base = data_path .. "/lazy"
  
  if vim.fn.isdirectory(lazy_base) == 1 then
    local subdirs = vim.fn.glob(lazy_base .. "/*", false, true) or {}
    for _, subdir in ipairs(subdirs) do
      if vim.fn.isdirectory(subdir) == 1 then
        local themes_paths = {
          subdir .. "/lua/prismpunk/themes",
          subdir .. "/themes",
        }
        for _, themes_path in ipairs(themes_paths) do
          if vim.fn.isdirectory(themes_path) == 1 then
            return themes_path
          end
        end
      end
    end
  end

  local search_dirs = {
    data_path .. "/site/pack/*/start/*/lua/prismpunk/themes",
    data_path .. "/site/pack/*/opt/*/lua/prismpunk/themes",
    data_path .. "/site/lua/prismpunk/themes",
  }

  for _, pattern in ipairs(search_dirs) do
    local matches = vim.fn.glob(pattern, false, true) or {}
    for _, match in ipairs(matches) do
      if vim.fn.isdirectory(match) == 1 then
        return match
      end
    end
  end

  local paths = { 
    "./lua/prismpunk/themes", 
    "../lua/prismpunk/themes",
    vim.fn.getcwd() .. "/lua/prismpunk/themes"
  }
  for _, dir in ipairs(paths) do
    if vim.fn.isdirectory(dir) == 1 then
      return dir
    end
  end

  return nil
end

local function get_fallback_themes()
  return {
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
end

function M.list_themes()
  local current_time = os.time(os.date("*t"))
  if themes_cache and (current_time - themes_cache_time) < CACHE_TTL then return themes_cache end

  local themes = {}
  local themes_dir = find_themes_dir()

  if not themes_dir then
    vim.schedule(function()
      vim.notify("[prismpunk] Using fallback theme list - themes_dir not found", vim.log.levels.WARN)
    end)

    for _, theme in ipairs(get_fallback_themes()) do
      local parsed = M.parse_theme_spec(theme)
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

  local function scan_dir(dir, prefix)
    prefix = prefix or ""
    local entries = vim.fn.readdir(dir)

    for _, name in ipairs(entries) do
      local full_path = dir .. "/" .. name
      if vim.fn.isdirectory(full_path) == 1 then
        scan_dir(full_path, prefix .. name .. "/")
      elseif name:match("%.lua$") then
        local theme_name = name:gsub("%.lua$", "")
        table.insert(themes, prefix .. theme_name)
      end
    end
  end

  scan_dir(themes_dir)

  themes_cache = themes
  themes_cache_time = current_time
  return themes
end

function M.clear_themes_cache()
  themes_cache = nil
  themes_cache_time = 0
end

function M.get_theme_info(theme_name)
  local parsed = M.parse_theme_spec(theme_name)
  if not parsed.name then return nil end

  local theme
  local tries = {}

  if parsed.variants and #parsed.variants > 0 then
    for _, variant in ipairs(parsed.variants) do
      if variant.universe and variant.universe ~= "" then
        local uni = variant.universe:gsub("/", ".")
        table.insert(tries, "prismpunk.themes." .. uni .. "." .. variant.name)
      end
    end
  end

  if parsed.universe and parsed.universe ~= "" then
    local uni = parsed.universe:gsub("/", ".")
    table.insert(tries, "prismpunk.themes." .. uni .. "." .. parsed.name)
  end
  table.insert(tries, "prismpunk.themes." .. parsed.name)

  for _, path in ipairs(tries) do
    local ok, mod = pcall(require, path)
    if ok and type(mod) == "table" then
      theme = mod
      break
    end
  end

  if not theme then return nil end

  return {
    name = theme.name or parsed.name,
    author = theme.author or "Unknown",
    description = theme.description or "No description",
    universe = parsed.universe,
    base16 = theme.base16 or {},
    palette = theme.palette or {},
    module = theme,
  }
end

return M
