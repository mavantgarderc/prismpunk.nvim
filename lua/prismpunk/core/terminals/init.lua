local M = {}

local punkpalette = require("prismpunk.palette")
local punkconf = require("prismpunk.config")

local ghostty = require("prismpunk.core.terminals.ghostty")
local alacritty = require("prismpunk.core.terminals.alacritty")
local kitty = require("prismpunk.core.terminals.kitty")

-- Apply colors to Neovim's built-in terminal
M.apply = function(theme)
  local c = theme.colors or theme

  -- luacheck: push ignore
  vim.g.terminal_color_0 = c.base00
  vim.g.terminal_color_1 = c.base08
  vim.g.terminal_color_2 = c.base0B
  vim.g.terminal_color_3 = c.base0A
  vim.g.terminal_color_4 = c.base0D
  vim.g.terminal_color_5 = c.base0E
  vim.g.terminal_color_6 = c.base0C
  vim.g.terminal_color_7 = c.base05
  vim.g.terminal_color_8 = c.base03
  vim.g.terminal_color_9 = c.base08
  vim.g.terminal_color_10 = c.base0B
  vim.g.terminal_color_11 = c.base0A
  vim.g.terminal_color_12 = c.base0D
  vim.g.terminal_color_13 = c.base0E
  vim.g.terminal_color_14 = c.base0C
  vim.g.terminal_color_15 = c.base07
  vim.g.terminal_color_background = c.base00
  vim.g.terminal_color_foreground = c.base05
  -- luacheck: pop
end

-- Export to external terminal emulators (Ghostty, Alacritty, Kitty)
M.auto_export = function(theme, config)
  if not config.terminals.enabled then return end

  local emulators = config.terminals.emulator
  if type(emulators) == "string" then emulators = { emulators } end

  for _, emulator in ipairs(emulators) do
    local conf = config.terminals[emulator]
    if conf and conf.enabled then
      if emulator == "ghostty" then
        ghostty.export_and_reload(theme, conf)
      elseif emulator == "alacritty" then
        alacritty.export_and_reload(theme, conf)
      elseif emulator == "kitty" then
        kitty.export_and_reload(theme, conf)
      end
    end
  end
end

-- Optional: preview terminal config content for a theme
M.preview = function(theme_name, terminal_name)
  terminal_name = terminal_name

  if terminal_name == "ghostty" then
    return ghostty.export(theme_name)
  elseif terminal_name == "alacritty" then
    return alacritty.export(theme_name)
  elseif terminal_name == "kitty" then
    return kitty.export(theme_name)
  else
    vim.notify(string.format("[prismpunk] Unknown terminal: %s", terminal_name), vim.log.levels.WARN)
    return nil
  end
end

M.export_ghostty = ghostty.export
M.save_ghostty = ghostty.save

M.export_alacritty = alacritty.export
M.save_alacritty = alacritty.save

M.export_kitty = kitty.export
M.save_kitty = kitty.save

M.get_palette = function(theme_name)
  local parsed = punkconf.parse_theme(theme_name)
  local universe = parsed.universe
  local name = parsed.name

  local theme_path
  if universe then
    theme_path = "prismpunk.themes." .. universe:gsub("/", ".") .. "." .. name
  else
    theme_path = "prismpunk.themes." .. name
  end

  local ok, spec = pcall(require, theme_path)
  if not ok then return nil end

  local palette_table
  if universe then
    palette_table = punkpalette.create_palette(universe, name, spec.palette and spec.palette.overrides)
  else
    palette_table = punkpalette.create_palette(nil, name, spec.palette and spec.palette.overrides)
  end

  local theme_result
  if type(spec.get) == "function" then
    local ok_theme, result = pcall(spec.get, {}, palette_table)
    if ok_theme then
      theme_result = result
    else
      return nil
    end
  else
    theme_result = spec
  end

  return {
    base16 = spec.base16 or {},
    palette = palette_table,
    semantic = theme_result,
    metadata = {
      name = spec.name or theme_name,
      author = spec.author or "Unknown",
      description = spec.description or "No description",
    },
  }
end

M.print_palette = function(theme_name)
  local p = M.get_palette(theme_name)
  if not p then
    vim.notify("Failed to load theme: " .. theme_name, vim.log.levels.ERROR)
    return
  end

  print("=== " .. p.metadata.name .. " ===\n")

  if p.palette and next(p.palette) then
    print("--- Rich Palette ---")
    for name, color in pairs(p.palette) do
      print(string.format("%-20s %s", name, color))
    end
    print("")
  end

  print("--- Base16 Colors ---")
  for i = 0, 15 do
    local key = i == 0 and "base00" or string.format("base%02X", i)
    if p.base16[key] then print(string.format("%-8s %s", key, p.base16[key])) end
  end
end

return M
