--- PrismPunk highlights coordinator
--- Applies highlight groups to Neovim
local M = {}

--- Safely set highlight group
--- @param ns number Namespace (0 for global)
--- @param group string Highlight group name
--- @param opts table Highlight options
local function safe_nvim_set_hl(ns, group, opts)
  if not opts or type(opts) ~= "table" then return end

  local safe_opts = {}
  for k, v in pairs(opts) do
    if v ~= nil then
      if k == "fg" or k == "bg" or k == "sp" then
        if type(v) == "string" and v ~= "" and v ~= "none" then
          safe_opts[k] = v
        elseif type(v) == "number" then
          safe_opts[k] = v
        end
      else
        safe_opts[k] = v
      end
    end
  end

  if next(safe_opts) ~= nil then return vim.api.nvim_set_hl(ns, group, safe_opts) end
end

--- Set highlight (convenience wrapper)
--- @param group string
--- @param opts table
local function hl(group, opts) safe_nvim_set_hl(0, group, opts) end

M.safe_hl = safe_nvim_set_hl
M.hl = hl

--- Deep-merge multiple tables (force strategy).
--- Later tables override earlier ones.
--- Nil or non-table values are ignored.
--- @param ... table
--- @return table
local function merge(...)
  local result = {}
  for _, tbl in ipairs({ ... }) do
    if type(tbl) == "table" and next(tbl) ~= nil then result = vim.tbl_extend("force", result, tbl) end
  end
  return result
end

M.merge = merge

--- Safely get a nested style table from styles by path.
--- Returns {} if any part of the path is missing or not a table.
--- @param styles table|nil
--- @param path string|string[]
--- @param fallback table|nil
--- @return table
local function get_style(styles, path, fallback)
  if type(path) == "string" then path = { path } end

  local cur = styles or {}
  for _, key in ipairs(path or {}) do
    if type(cur) ~= "table" then
      cur = nil
      break
    end
    cur = cur[key]
    if cur == nil then break end
  end

  if type(cur) == "table" then return cur end
  return fallback or {}
end

M.get_style = get_style

--- Internal notification wrapper
--- @param level integer
--- @param msg string
--- @param ... any
local function notify(level, msg, ...)
  if select("#", ...) > 0 then msg = string.format(msg, ...) end

  if vim.notify then
    pcall(vim.notify, msg, level)
  else
    -- Fallback for very old environments
    print(msg)
  end
end

--- Standardized warning
--- @param msg string
--- @param ... any
function M.warn(msg, ...) notify(vim.log.levels.WARN, "[prismpunk] " .. msg, ...) end

--- Standardized error (notification only, does NOT throw)
--- @param msg string
--- @param ... any
function M.error(msg, ...) notify(vim.log.levels.ERROR, "[prismpunk] " .. msg, ...) end

--- Standardized info
--- @param msg string
--- @param ... any
function M.info(msg, ...) notify(vim.log.levels.INFO, "[prismpunk] " .. msg, ...) end

--- Normalize theme structure
--- Converts theme module or result into standardized color structure
--- @param theme table Theme module or result from theme.get()
--- @param config table Configuration
--- @return table Normalized colors
function M.normalize_theme(theme, config)
  -- If theme has a .get function, it's a module - call it
  if type(theme.get) == "function" then
    local ok, result = pcall(theme.get, config, theme.palette)
    if not ok then
      M.error("theme.get() failed: %s", tostring(result))
      error(string.format("[prismpunk] theme.get() failed: %s", tostring(result)))
    end
    theme = result
  end

  -- Validate theme structure
  if not theme or type(theme) ~= "table" then
    M.error("Theme must be a table")
    error("[prismpunk] Theme must be a table")
  end

  -- Handle semantic structure (legacy support)
  if theme.semantic then
    local semantic = theme.semantic
    return {
      modes = theme.modes,
      ui = semantic.ui or semantic,
      accent = theme.accent,
      rainbow = theme.rainbow,
      syn = semantic.syn or semantic,
      vcs = semantic.vcs or semantic.git,
      git = semantic.vcs or semantic.git,
      diff = semantic.diff or semantic,
      diag = semantic.diag or semantic,
      term = theme.term,
      treesitter = theme.treesitter,
      lsp = theme.lsp,
      is_complex = true,
    }
  end

  -- Modern structure - preserve all keys
  if theme.syn and theme.ui then
    return {
      modes = theme.modes,
      ui = theme.ui,
      accent = theme.accent,
      rainbow = theme.rainbow,
      syn = theme.syn,
      vcs = theme.vcs,
      git = theme.vcs or theme.git,
      diff = theme.diff,
      diag = theme.diag,
      term = theme.term,
      treesitter = theme.treesitter,
      lsp = theme.lsp,
      is_complex = true,
    }
  end

  -- Invalid structure
  local keys = {}
  if type(theme) == "table" then keys = vim.tbl_keys(theme) end
  local msg = string.format("Theme missing required structure (syn, ui, diag). Found keys: %s", vim.inspect(keys))
  M.error(msg)
  error("[prismpunk] " .. msg)
end

--- Apply highlights to Neovim
--- @param theme table Theme result from theme.get()
--- @param config table Configuration
function M.apply(theme, config)
  -- Normalize theme structure
  local colors = M.normalize_theme(theme, config)

  if not colors.syn then
    M.error("Normalized theme missing colors.syn")
    error("[prismpunk] Normalized theme missing colors.syn")
  end

  -- Ensure config has proper structure
  local opts = config
  if type(config.options) == "table" then opts = config.options end

  -- Load highlight modules in order
  local modules = {
    "editor",
    "syntax",
    "treesitter",
    "lsp",
    "diagnostic",
    "git",
  }

  for _, module_name in ipairs(modules) do
    local module_path = "prismpunk.core.highlights." .. module_name
    local ok, module = pcall(require, module_path)

    if ok and type(module.apply) == "function" then
      local apply_ok, err = pcall(module.apply, colors, opts)
      if not apply_ok then
        M.error("Highlight module %s failed: %s", module_name, tostring(err))
        error(string.format("[prismpunk] Critical highlight module failed: %s", module_name))
      end
    else
      M.error("Failed to load highlight module: %s", module_name)
      error(string.format("[prismpunk] Critical highlight module missing: %s", module_name))
    end
  end

  -- Load plugin highlights
  local plugin_ok, plugins = pcall(require, "prismpunk.core.highlights.plugins")
  if plugin_ok and type(plugins.apply) == "function" then
    local apply_ok, err = pcall(plugins.apply, colors, opts)
    if not apply_ok then
      M.error("Plugin highlights failed: %s", tostring(err))
      error("[prismpunk] Plugin highlights failed")
    end
  else
    M.warn("Failed to load plugin highlights")
  end

  -- Apply global overrides (check both config and opts for overrides)
  local overrides = opts.overrides or config.overrides
  if overrides and overrides.highlights then
    for group, highlight_opts in pairs(overrides.highlights) do
      hl(group, highlight_opts)
    end
  end

  -- Apply per-theme overrides
  local theme_name = opts.theme or config.theme
  if overrides and overrides.themes and theme_name then
    local theme_overrides = overrides.themes[theme_name]
    if theme_overrides then
      for group, highlight_opts in pairs(theme_overrides) do
        hl(group, highlight_opts)
      end
    end
  end
end

return M
