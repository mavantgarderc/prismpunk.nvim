-- plugin/prismpunk.lua
if vim.fn.has("nvim-0.10") == 0 then
  vim.notify(
    "[prismpunk] Neovim 0.10+ required. Current version: " .. vim.version().major .. "." .. vim.version().minor,
    vim.log.levels.ERROR
  )
  return
end

local function get_config()
  local ok, prismpunk = pcall(require, "prismpunk.config")
  if ok and prismpunk.options then return prismpunk.options end
  return _G.prismpunk_config or {}
end

local function get_current_theme(arg)
  if arg and arg ~= "" then return arg end

  local config = get_config()
  return config.theme or "kanagawa/paper-edo"
end

vim.api.nvim_create_user_command("PrismpunkExportGhostty", function(opts)
  local theme = get_current_theme(opts.args)

  local ok, terminals = pcall(require, "prismpunk.core.terminals")
  if not ok then
    vim.notify("[prismpunk] Failed to load terminals module", vim.log.levels.ERROR)
    return
  end

  if terminals.save_ghostty then
    terminals.save_ghostty(theme)
  else
    vim.notify("[prismpunk] save_ghostty function not found", vim.log.levels.ERROR)
  end
end, {
  nargs = "?",
  complete = function()
    local ok, loader = pcall(require, "prismpunk.loader")
    if ok and loader.list_themes then return loader.list_themes() end
    return {}
  end,
  desc = "Export current theme to Ghostty config",
})

vim.api.nvim_create_user_command("PrismpunkPrintPalette", function(opts)
  local theme = get_current_theme(opts.args)

  local ok, terminals = pcall(require, "prismpunk.core.terminals")
  if not ok then
    vim.notify("[prismpunk] Failed to load terminals module", vim.log.levels.ERROR)
    return
  end

  if terminals.print_palette then
    terminals.print_palette(theme)
  else
    vim.notify("[prismpunk] print_palette function not found", vim.log.levels.ERROR)
  end
end, {
  nargs = "?",
  complete = function()
    local ok, loader = pcall(require, "prismpunk.loader")
    if ok and loader.list_themes then return loader.list_themes() end
    return {}
  end,
  desc = "Print theme color palette",
})

vim.api.nvim_create_user_command("PrismpunkReload", function()
  local ok, loader = pcall(require, "prismpunk.loader")
  if not ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  loader.clear_cache()

  local config = get_config()
  local prismpunk_ok, prismpunk = pcall(require, "prismpunk")
  if prismpunk_ok and config.theme then
    prismpunk.setup(config)
    vim.notify("[prismpunk] Reloaded theme: " .. config.theme, vim.log.levels.INFO)
  else
    vim.notify("[prismpunk] Failed to reload", vim.log.levels.ERROR)
  end
end, {
  desc = "Clear cache and reload Prismpunk theme",
})

vim.api.nvim_create_user_command("PrismpunkListThemes", function()
  local ok, loader = pcall(require, "prismpunk.loader")
  if not ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  if loader.list_themes then
    local themes = loader.list_themes()
    if #themes > 0 then
      local theme_list = "Available themes:\n" .. table.concat(themes, "\n")
      vim.notify(theme_list, vim.log.levels.INFO)
    else
      vim.notify("[prismpunk] No themes found", vim.log.levels.WARN)
    end
  else
    vim.notify("[prismpunk] list_themes function not found", vim.log.levels.ERROR)
  end
end, {
  desc = "List all available Prismpunk themes",
})

-- Add command to show current theme
vim.api.nvim_create_user_command("PrismpunkCurrentTheme", function()
  local config_ok, config = pcall(require, "prismpunk.config")
  if not config_ok then
    vim.notify("[prismpunk] Failed to load config module", vim.log.levels.ERROR)
    return
  end

  local current_theme = config.options and config.options.theme or "Not set"
  vim.notify("[prismpunk] Current theme: " .. current_theme, vim.log.levels.INFO)
end, {
  desc = "Show current Prismpunk theme",
})

-- Add command to preview a theme without loading it
vim.api.nvim_create_user_command("PrismpunkPreview", function(opts)
  local theme = opts.args
  if not theme or theme == "" then
    vim.notify("[prismpunk] Usage: :PrismpunkPreview <theme_name>", vim.log.levels.WARN)
    return
  end

  local ok, loader = pcall(require, "prismpunk.loader")
  if not ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  local config_ok, config = pcall(require, "prismpunk.config")
  if config_ok and config.options and config.options.theme then
    vim.notify(
      "[prismpunk] Previewing theme: " .. theme .. " (current: " .. config.options.theme .. ")",
      vim.log.levels.INFO
    )
  else
    vim.notify("[prismpunk] Previewing theme: " .. theme, vim.log.levels.INFO)
  end
end, {
  nargs = 1,
  complete = function()
    local ok, loader = pcall(require, "prismpunk.loader")
    if ok and loader.list_themes then return loader.list_themes() end
    return {}
  end,
  desc = "Preview a Prismpunk theme",
})
