--- Validation and generation helpers
local M = {}

local validate = require("prismpunk.core.validate")
local schema = require("prismpunk.utils.schema")

M.definitions = schema.BASE16_DEFINITIONS

function M.validate(colors)
  if type(colors) ~= "table" then return false, "colors must be a table" end

  for _, key in ipairs(schema.BASE16_KEYS) do
    if not colors[key] then
      return false, string.format("missing required key: %s", key)
    end

    if type(colors[key]) ~= "string" then
      return false, string.format("%s must be string, got %s", key, type(colors[key]))
    end

    local valid, _, err = validate.validate_hex(colors[key], key)
    if not valid then
      return false, string.format("%s: %s", key, err)
    end
  end

  return true
end

function M.generate(opts)
  opts = opts or {}

  local bg = opts.bg or "#000000"
  local fg = opts.fg or "#ffffff"

  local bg_valid, bg_norm = validate.validate_hex(bg, "bg")
  if not bg_valid then bg_norm = "#000000" end

  local fg_valid, fg_norm = validate.validate_hex(fg, "fg")
  if not fg_valid then fg_norm = "#ffffff" end

  return {
    base00 = bg_norm,
    base01 = opts.base01 or M.lighten(bg_norm, 0.1),
    base02 = opts.base02 or M.lighten(bg_norm, 0.2),
    base03 = opts.base03 or M.lighten(bg_norm, 0.3),
    base04 = opts.base04 or M.darken(fg_norm, 0.3),
    base05 = fg_norm,
    base06 = opts.base06 or M.lighten(fg_norm, 0.1),
    base07 = opts.base07 or M.lighten(fg_norm, 0.2),
    base08 = opts.base08 or opts.red or "#ff0000",
    base09 = opts.base09 or opts.orange or "#ff8800",
    base0A = opts.base0A or opts.yellow or "#ffff00",
    base0B = opts.base0B or opts.green or "#00ff00",
    base0C = opts.base0C or opts.cyan or "#00ffff",
    base0D = opts.base0D or opts.blue or "#0000ff",
    base0E = opts.base0E or opts.magenta or "#ff00ff",
    base0F = opts.base0F or opts.brown or "#884400",
  }
end

function M.lighten(hex, factor)
  local color_utils = require("prismpunk.utils.color")
  return color_utils.brighten(hex, factor)
end

function M.darken(hex, factor)
  local color_utils = require("prismpunk.utils.color")
  return color_utils.darken(hex, factor)
end

function M.print(colors, name)
  name = name or "Base16 Colors"
  print("\n" .. name .. ":")
  print(string.rep("=", 40))

  for i = 0, 15 do
    local key = string.format("base%02X", i)
    local color = colors[key]
    if color then print(string.format("  %s: %s - %s", key, color, M.definitions[key] or "")) end
  end
  print(string.rep("=", 40) .. "\n")
end

function M.to_ansi(colors)
  local function hex_to_ansi(hex)
    local normalized, _ = validate.normalize_hex(hex)
    local r = tonumber(normalized:sub(2, 3), 16)
    local g = tonumber(normalized:sub(4, 5), 16)
    local b = tonumber(normalized:sub(6, 7), 16)
    return string.format("\27[38;2;%d;%d;%dm", r, g, b)
  end

  local ansi = {}
  for i = 0, 15 do
    local key = string.format("base%02X", i)
    ansi[key] = hex_to_ansi(colors[key] or "#000000")
  end
  ansi.reset = "\27[0m"

  return ansi
end

function M.quick_theme(name, bg, fg, accent)
  return {
    name = name,
    base16 = M.generate({ bg = bg, fg = fg, base08 = accent }),
    palette = { bg = bg, fg = fg, accent = accent },
    get = function(_opts, plt)
      return {
        ui = { bg = plt.bg, fg = plt.fg },
        syn = { keyword = plt.accent },
      }
    end,
  }
end

M.examples = {
  gruvbox_dark = {
    base00 = "#282828",
    base01 = "#3c3836",
    base02 = "#504945",
    base03 = "#665c54",
    base04 = "#bdae93",
    base05 = "#ebdbb2",
    base06 = "#ebdbb2",
    base07 = "#fbf1c7",
    base08 = "#fb4934",
    base09 = "#fe8019",
    base0A = "#fabd2f",
    base0B = "#b8bb26",
    base0C = "#8ec07c",
    base0D = "#83a598",
    base0E = "#d3869b",
    base0F = "#d65d0e",
  },
}

return M
