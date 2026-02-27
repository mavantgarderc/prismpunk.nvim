--- PrismPunk Scheme Resolver
--- Handles scheme module resolution and discovery
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

local function has_subdirectory_variant(universe, name)
  if not universe or universe == "" then return false end
  if not name or not name:match("%-") then return false end

  local prefix = name:match("^([%w]+)%-")
  if not prefix then return false end

  local subdir_path = string.format("lua/prismpunk/schemes/%s/%s", universe, prefix)
  local check_paths = {
    vim.fn.getcwd() .. "/" .. subdir_path,
    vim.fn.stdpath("config") .. "/lua/prismpunk/schemes/" .. universe .. "/" .. prefix,
  }

  for _, path in ipairs(check_paths) do
    if vim.fn.isdirectory(path) == 1 then
      return true, prefix
    end
  end

  return false, nil
end

local function get_subdirectory_tries(universe, name)
  local tries = {}
  if not universe or universe == "" or not name or not name:match("%-") then
    return tries
  end

  local prefix, suffix = name:match("^([%w]+)%-(.+)$")
  if not prefix or not suffix then return tries end

  local subdir_path = string.format("lua/prismpunk/schemes/%s/%s", universe, prefix)
  local check_paths = {
    vim.fn.getcwd() .. "/" .. subdir_path,
    vim.fn.stdpath("config") .. "/lua/prismpunk/schemes/" .. universe .. "/" .. prefix,
  }

  local has_subdir = false
  for _, path in ipairs(check_paths) do
    if vim.fn.isdirectory(path) == 1 then
      has_subdir = true
      break
    end
  end

  if not has_subdir then return tries end

  local universe_dotted = universe:gsub("/", ".")
  table.insert(tries, string.format("prismpunk.schemes.%s.%s.%s", universe_dotted, prefix, suffix))
  table.insert(tries, string.format("prismpunk.themes.%s.%s.%s", universe_dotted, prefix, suffix))

  return tries
end

local function parse_two_part_scheme(category, name)
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

function M.parse_scheme_spec(scheme_spec)
  if not scheme_spec or scheme_spec == "" then return { universe = nil, name = nil, variants = {} } end

  if type(scheme_spec) == "string" then
    local parts = vim.split(scheme_spec, "/")

    if #parts == 3 then
      local universe = parts[1] .. "/" .. parts[2]
      local name = parts[3]
      return { universe = universe, name = name, variants = { { universe = universe, name = name } } }
    elseif #parts == 2 then
      return parse_two_part_scheme(parts[1], parts[2])
    else
      return { universe = nil, name = scheme_spec, variants = {} }
    end
  elseif type(scheme_spec) == "table" then
    return {
      universe = scheme_spec.universe,
      name = scheme_spec.name or scheme_spec[1],
      opts = scheme_spec.opts or {},
      variants = {},
    }
  else
    error(string.format("[prismpunk] Invalid scheme_spec type: %s (expected string or table)", type(scheme_spec)))
  end
end

M.parse_theme_spec = M.parse_scheme_spec

function M.resolve_scheme_file(module_path)
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

M.resolve_theme_file = M.resolve_scheme_file

function M.resolve_scheme_module(spec)
  local cache_key = (spec.universe or "") .. "/" .. spec.name
  if module_cache[cache_key] then
    return module_cache[cache_key].path, module_cache[cache_key].module
  end

  local tries = {}

  local subdir_tries = get_subdirectory_tries(spec.universe, spec.name)
  for _, try in ipairs(subdir_tries) do
    table.insert(tries, try)
  end

  if spec.variants and #spec.variants > 0 then
    for _, variant in ipairs(spec.variants) do
      if variant.universe and variant.universe ~= "" then
        local universe_dotted = variant.universe:gsub("/", ".")
        table.insert(tries, string.format("prismpunk.schemes.%s.%s", universe_dotted, variant.name))
      end
    end
  end

  if spec.universe and spec.universe ~= "" then
    local universe_dotted = spec.universe:gsub("/", ".")
    table.insert(tries, string.format("prismpunk.schemes.%s.%s", universe_dotted, spec.name))
  end
  table.insert(tries, string.format("prismpunk.schemes.%s", spec.name))

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
    "[prismpunk] Could not resolve scheme: %s\nTried:\n  - %s",
    spec.universe and (spec.universe .. "/" .. spec.name) or spec.name,
    tried_paths
  )
end

M.resolve_theme_module = M.resolve_scheme_module

function M.clear_module_cache()
  module_cache = {}
end

local schemes_cache = nil
local schemes_cache_time = 0
local CACHE_TTL = 30

local function find_schemes_dir()
  local searchpath = package.searchpath("prismpunk.loader", package.path)
  if searchpath then
    local loader_path = searchpath:gsub("/loader%.lua$", "")
    local schemes_path = loader_path .. "/schemes"
    if vim.fn.isdirectory(schemes_path) == 1 then
      return schemes_path
    end
    local themes_path = loader_path .. "/themes"
    if vim.fn.isdirectory(themes_path) == 1 then
      return themes_path
    end
  end

  local rtp = vim.opt.rtp:get()
  for _, path in ipairs(rtp) do
    local schemes_paths = {
      path .. "/prismpunk/schemes",
      path .. "/lua/prismpunk/schemes",
      path .. "/prismpunk/themes",
      path .. "/lua/prismpunk/themes",
    }
    for _, schemes_path in ipairs(schemes_paths) do
      if vim.fn.isdirectory(schemes_path) == 1 then
        return schemes_path
      end
    end
  end

  local data_path = vim.fn.stdpath("data")
  local lazy_base = data_path .. "/lazy"
  
  if vim.fn.isdirectory(lazy_base) == 1 then
    local subdirs = vim.fn.glob(lazy_base .. "/*", false, true) or {}
    for _, subdir in ipairs(subdirs) do
      if vim.fn.isdirectory(subdir) == 1 then
        local schemes_paths = {
          subdir .. "/lua/prismpunk/schemes",
          subdir .. "/schemes",
          subdir .. "/lua/prismpunk/themes",
          subdir .. "/themes",
        }
        for _, schemes_path in ipairs(schemes_paths) do
          if vim.fn.isdirectory(schemes_path) == 1 then
            return schemes_path
          end
        end
      end
    end
  end

  local search_dirs = {
    data_path .. "/site/pack/*/start/*/lua/prismpunk/schemes",
    data_path .. "/site/pack/*/opt/*/lua/prismpunk/schemes",
    data_path .. "/site/lua/prismpunk/schemes",
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
    "./lua/prismpunk/schemes",
    "../lua/prismpunk/schemes",
    vim.fn.getcwd() .. "/lua/prismpunk/schemes",
    "./lua/prismpunk/themes",
    "../lua/prismpunk/themes",
    vim.fn.getcwd() .. "/lua/prismpunk/themes",
  }
  for _, dir in ipairs(paths) do
    if vim.fn.isdirectory(dir) == 1 then
      return dir
    end
  end

  return nil
end

local function get_fallback_schemes()
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

function M.list_schemes()
  local current_time = os.time(os.date("*t"))
  if schemes_cache and (current_time - schemes_cache_time) < CACHE_TTL then return schemes_cache end

  local schemes = {}
  local schemes_dir = find_schemes_dir()

  if not schemes_dir then
    vim.schedule(function()
      vim.notify("[prismpunk] Using fallback scheme list - schemes_dir not found", vim.log.levels.WARN)
    end)

    for _, scheme in ipairs(get_fallback_schemes()) do
      local parsed = M.parse_scheme_spec(scheme)
      local scheme_path
      if parsed.universe then
        scheme_path = "prismpunk.schemes." .. parsed.universe:gsub("/", ".") .. "." .. parsed.name
      else
        scheme_path = "prismpunk.schemes." .. parsed.name
      end

      local ok, _ = pcall(require, scheme_path)
      if ok then table.insert(schemes, scheme) end
    end

    schemes_cache = schemes
    schemes_cache_time = current_time
    return schemes
  end

  local function scan_dir(dir, prefix)
    prefix = prefix or ""
    local entries = vim.fn.readdir(dir)

    for _, name in ipairs(entries) do
      local full_path = dir .. "/" .. name
      if vim.fn.isdirectory(full_path) == 1 then
        scan_dir(full_path, prefix .. name .. "/")
      elseif name:match("%.lua$") then
        if name ~= "init.lua" then
          local scheme_name = name:gsub("%.lua$", "")
          table.insert(schemes, prefix .. scheme_name)
        end
      end
    end
  end

  scan_dir(schemes_dir)

  schemes_cache = schemes
  schemes_cache_time = current_time
  return schemes
end

M.list_themes = M.list_schemes

function M.clear_schemes_cache()
  schemes_cache = nil
  schemes_cache_time = 0
end

M.clear_themes_cache = M.clear_schemes_cache

function M.get_scheme_info(scheme_name)
  local parsed = M.parse_scheme_spec(scheme_name)
  if not parsed.name then return nil end

  local scheme
  local tries = {}

  local subdir_tries = get_subdirectory_tries(parsed.universe, parsed.name)
  for _, try in ipairs(subdir_tries) do
    table.insert(tries, try)
  end

  if parsed.variants and #parsed.variants > 0 then
    for _, variant in ipairs(parsed.variants) do
      if variant.universe and variant.universe ~= "" then
        local uni = variant.universe:gsub("/", ".")
        table.insert(tries, "prismpunk.schemes." .. uni .. "." .. variant.name)
      end
    end
  end

  if parsed.universe and parsed.universe ~= "" then
    local uni = parsed.universe:gsub("/", ".")
    table.insert(tries, "prismpunk.schemes." .. uni .. "." .. parsed.name)
  end
  table.insert(tries, "prismpunk.schemes." .. parsed.name)

  for _, path in ipairs(tries) do
    local ok, mod = pcall(require, path)
    if ok and type(mod) == "table" then
      scheme = mod
      break
    end
  end

  if not scheme then return nil end

  return {
    name = scheme.name or parsed.name,
    author = scheme.author or "Unknown",
    description = scheme.description or "No description",
    universe = parsed.universe,
    base16 = scheme.base16 or {},
    palette = scheme.palette or {},
    module = scheme,
  }
end

M.get_theme_info = M.get_scheme_info

return M
