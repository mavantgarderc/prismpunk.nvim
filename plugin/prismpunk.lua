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

local DEFAULT_THEME = "kanagawa/paper-edo"

local function get_current_theme(arg)
  if arg and arg ~= "" then return arg end

  local config = get_config()
  return config.theme or DEFAULT_THEME
end

vim.api.nvim_create_user_command("PrismExportGhostty", function(opts)
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
    if ok and loader.get_allowed_theme_list then return loader.get_allowed_theme_list() end
    if ok and loader.list_themes then return loader.list_themes() end
    return {}
  end,
  desc = "Export current theme to Ghostty config",
})

vim.api.nvim_create_user_command("PrismPrintPalette", function(opts)
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
    if ok and loader.get_allowed_theme_list then return loader.get_allowed_theme_list() end
    if ok and loader.list_themes then return loader.list_themes() end
    return {}
  end,
  desc = "Print theme color palette",
})

vim.api.nvim_create_user_command("PrismReload", function()
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
  desc = "Clear cache and reload PrismPunk theme",
})

vim.api.nvim_create_user_command("PrismListThemes", function()
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
  desc = "List all available PrismPunk themes",
})

-- Add command to show current theme
vim.api.nvim_create_user_command("PrismCurrentTheme", function()
  local config_ok, config = pcall(require, "prismpunk.config")
  if not config_ok then
    vim.notify("[prismpunk] Failed to load config module", vim.log.levels.ERROR)
    return
  end

  local current_theme = config.options and config.options.theme or "Not set"
  vim.notify("[prismpunk] Current theme: " .. current_theme, vim.log.levels.INFO)
end, {
  desc = "Show current PrismPunk theme",
})

-- Add PrismInfo command
vim.api.nvim_create_user_command("PrismInfo", function(opts)
  local theme_name = opts.args and opts.args ~= "" and opts.args or nil

  if not theme_name then
    local config_ok, cfg = pcall(require, "prismpunk.config")
    if config_ok and cfg.options then
      theme_name = cfg.options.theme
    end
  end

  if not theme_name then
    vim.notify("[prismpunk] No theme specified and no default theme set", vim.log.levels.WARN)
    return
  end

  -- Convert dashes to slashes for compatibility (universe/name format)
  theme_name = theme_name:gsub("-", "/", 1)

  local loader_ok, loader = pcall(require, "prismpunk.loader")
  if not loader_ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  local info = loader.get_theme_info(theme_name)
  if not info then
    vim.notify("[prismpunk] Theme not found: " .. theme_name, vim.log.levels.ERROR)
    return
  end

  local lines = {
    "=== " .. info.name .. " ===",
    "Author: " .. info.author,
    "Universe: " .. (info.universe or "none"),
    "",
    info.description,
    "",
    "--- Base16 Colors ---",
  }

  for i = 0, 15 do
    local key = i == 0 and "base00" or string.format("base%02X", i)
    if info.base16[key] then
      table.insert(lines, string.format("%-8s %s", key, info.base16[key]))
    end
  end

  if info.palette and next(info.palette) then
    table.insert(lines, "")
    table.insert(lines, "--- Rich Palette ---")
    for name, color in pairs(info.palette) do
      table.insert(lines, string.format("%-20s %s", name, color))
    end
  end

  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
end, {
  nargs = "?",
  desc = "Show theme information",
})

-- Add PrismRandom command
vim.api.nvim_create_user_command("PrismRandom", function(opts)
  local loader_ok, loader = pcall(require, "prismpunk.loader")
  if not loader_ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  local themes = loader.get_allowed_theme_list()
  if #themes == 0 then
    themes = loader.list_themes()
  end

  if #themes == 0 then
    vim.notify("[prismpunk] No themes available", vim.log.levels.ERROR)
    return
  end

  local universe_filter = opts.args and opts.args ~= "" and opts.args or nil
  if universe_filter then
    -- Convert dashes to slashes for compatibility (universe/name format)
    universe_filter = universe_filter:gsub("-", "/", 1)
    local filtered = {}
    local prefix = universe_filter .. "/"
    for _, t in ipairs(themes) do
      if t:sub(1, #prefix) == prefix then
        table.insert(filtered, t)
      end
    end
    if #filtered > 0 then themes = filtered end
  end

  local random_index = math.random(1, #themes)
  local random_theme = themes[random_index]

  local prismpunk_ok, prismpunk = pcall(require, "prismpunk")
  if prismpunk_ok then
    local success, err = prismpunk.load(random_theme)
    if success then
      vim.notify("[prismpunk] Loaded random theme: " .. random_theme, vim.log.levels.INFO)
    else
      vim.notify("[prismpunk] Failed to load theme: " .. tostring(err), vim.log.levels.ERROR)
    end
  end
end, {
  nargs = "?",
  desc = "Load a random theme",
})
