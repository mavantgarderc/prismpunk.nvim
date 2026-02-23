--- Color manipulation utilities
--- Pure functions for color transformations
local M = {}

local hsluv = require("prismpunk.utils.hsluv")

local STRICT_HEX_PATTERN = "^#%x%x%x%x%x%x$"

local function _is_string_hex(s)
  return type(s) == "string" and s:match(STRICT_HEX_PATTERN) ~= nil
end

local function _normalize_hex(hex, context)
  context = context or "color"
  if type(hex) ~= "string" then
    vim.notify(string.format("[prismpunk] %s: expected hex string, got %s (value: %s), using fallback #000000", context, type(hex), tostring(hex)), vim.log.levels.ERROR)
    return "#000000"
  end

  local original = hex
  hex = hex:gsub("%s+", "")

  if hex:sub(1, 1) ~= "#" then hex = "#" .. hex end

  if #hex == 4 then
    local r = hex:sub(2, 2)
    local g = hex:sub(3, 3)
    local b = hex:sub(4, 4)
    hex = "#" .. r .. r .. g .. g .. b .. b
  end

  if not hex:match(STRICT_HEX_PATTERN) then
    vim.notify(string.format("[prismpunk] %s: invalid hex '%s', using fallback #000000", context, original), vim.log.levels.ERROR)
    return "#000000"
  end

  return hex:upper()
end

local function _validate_computed_hex(hex, operation)
  if not hex:match(STRICT_HEX_PATTERN) then
    vim.notify(string.format("[prismpunk] %s produced invalid hex '%s', reverting to #000000", operation, hex), vim.log.levels.ERROR)
    return "#000000"
  end
  return hex:upper()
end

local function _safe_hex_to_rgb(hex)
  hex = _normalize_hex(hex, "hex_to_rgb")
  local ok, rgb = pcall(hsluv.hex_to_rgb, hex)
  if not ok or type(rgb) ~= "table" then return { 0, 0, 0 } end
  return rgb
end

local function _safe_hex_to_hsluv(hex)
  hex = _normalize_hex(hex, "hex_to_hsluv")
  local ok, h = pcall(hsluv.hex_to_hsluv, hex)
  if not ok or type(h) ~= "table" then return { 0, 0, 0 } end
  return h
end

local function _clamp(v, minv, maxv)
  if v < minv then
    return minv
  elseif v > maxv then
    return maxv
  end
  return v
end

--- Create a color object with chainable methods
--- @param hex string Hex color
--- @return table Color object with methods
--- @usage local c = color("#ff0000"):brighten(0.2):to_hex()
function M.new(hex)
  hex = _normalize_hex(hex, "color.new")

  local obj = {
    hex = hex,
    rgb = _safe_hex_to_rgb(hex),
    hsluv = _safe_hex_to_hsluv(hex),
  }

  --- Brighten color by factor
  --- @param factor number 0.0 to 1.0 (0 = no change, 1 = max brightness)
  --- @return table self
  function obj:brighten(factor)
    factor = tonumber(factor) or 0
    factor = _clamp(factor, -1, 1)
    local h = { self.hsluv[1], self.hsluv[2], self.hsluv[3] }
    h[3] = _clamp(h[3] + (factor * 100), 0, 100)
    self.hsluv = h
    self.rgb = hsluv.hsluv_to_rgb(h)
    self.hex = _validate_computed_hex(hsluv.hsluv_to_hex(h), "brighten")
    return self
  end

  --- Darken color by factor
  --- @param factor number 0.0 to 1.0
  --- @return table self
  function obj:darken(factor)
    factor = tonumber(factor) or 0
    factor = _clamp(factor, 0, 1)
    return self:brighten(-factor)
  end

  --- Adjust saturation
  --- @param factor number -1.0 to 1.0
  --- @return table self
  function obj:saturate(factor)
    factor = tonumber(factor) or 0
    factor = _clamp(factor, -1, 1)
    local h = { self.hsluv[1], self.hsluv[2], self.hsluv[3] }
    h[2] = _clamp(h[2] + (factor * 100), 0, 100)
    self.hsluv = h
    self.rgb = hsluv.hsluv_to_rgb(h)
    self.hex = _validate_computed_hex(hsluv.hsluv_to_hex(h), "saturate")
    return self
  end

  --- Rotate hue
  --- @param degrees number -360 to 360
  --- @return table self
  function obj:rotate(degrees)
    degrees = tonumber(degrees) or 0
    local h = { self.hsluv[1], self.hsluv[2], self.hsluv[3] }
    h[1] = (h[1] + degrees) % 360
    self.hsluv = h
    self.rgb = hsluv.hsluv_to_rgb(h)
    self.hex = _validate_computed_hex(hsluv.hsluv_to_hex(h), "rotate")
    return self
  end

  --- Get hex representation
  --- @return string
  function obj:to_hex() return self.hex end

  --- Get RGB representation
  --- @return table {r, g, b}
  function obj:to_rgb() return self.rgb end

  --- Get HSLuv representation
  --- @return table {h, s, l}
  function obj:to_hsluv() return self.hsluv end

  return obj
end

setmetatable(M, {
  __call = function(_, hex) return M.new(hex) end,
})

--- Convert hex to RGB
--- @param hex string
--- @return table {r, g, b} (0-1 range)
function M.hex_to_rgb(hex) return _safe_hex_to_rgb(hex) end

--- Convert RGB to hex
--- @param rgb table {r, g, b} (0-1 range)
--- @return string
function M.rgb_to_hex(rgb)
  local ok, res = pcall(hsluv.rgb_to_hex, rgb)
  if not ok or type(res) ~= "string" then
    vim.notify("[prismpunk] rgb_to_hex failed, using fallback #000000", vim.log.levels.ERROR)
    return "#000000"
  end
  return _normalize_hex(res, "rgb_to_hex")
end

--- Brighten hex color
--- @param hex string
--- @param factor number 0.0 to 1.0
--- @return string
function M.brighten(hex, factor) return M.new(hex):brighten(factor):to_hex() end

--- Darken hex color
--- @param hex string
--- @param factor number 0.0 to 1.0
--- @return string
function M.darken(hex, factor) return M.new(hex):darken(factor):to_hex() end

--- Blend two colors
--- @param hex1 string
--- @param hex2 string
--- @param alpha number 0.0 to 1.0 (0 = hex1, 1 = hex2)
--- @return string
function M.blend(hex1, hex2, alpha)
  alpha = tonumber(alpha) or 0.5
  alpha = _clamp(alpha, 0, 1)

  local rgb1 = M.hex_to_rgb(hex1)
  local rgb2 = M.hex_to_rgb(hex2)

  local blended = {
    rgb1[1] * (1 - alpha) + rgb2[1] * alpha,
    rgb1[2] * (1 - alpha) + rgb2[2] * alpha,
    rgb1[3] * (1 - alpha) + rgb2[3] * alpha,
  }

  return M.rgb_to_hex(blended)
end

--- Calculate relative luminance (WCAG formula)
--- @param hex string
--- @return number 0.0 to 1.0
function M.get_luminance(hex)
  local rgb = M.hex_to_rgb(hex)

  local function adjust(c)
    if c <= 0.03928 then
      return c / 12.92
    else
      return ((c + 0.055) / 1.055) ^ 2.4
    end
  end

  local r = adjust(rgb[1] or 0)
  local g = adjust(rgb[2] or 0)
  local b = adjust(rgb[3] or 0)

  return 0.2126 * r + 0.7152 * g + 0.0722 * b
end

--- Calculate contrast ratio between two colors
--- @param lum1 number Luminance of first color
--- @param lum2 number Luminance of second color
--- @return number Contrast ratio (1.0 to 21.0)
function M.calculate_contrast(lum1, lum2)
  lum1 = tonumber(lum1) or 0
  lum2 = tonumber(lum2) or 0
  local lighter = math.max(lum1, lum2)
  local darker = math.min(lum1, lum2)
  return (lighter + 0.05) / (darker + 0.05)
end

local function _term_hex(plt, key, fallback)
  local v = plt and plt[key] or nil
  if not _is_string_hex(v or "") then return fallback end
  return v:upper()
end

--- Generate terminal color table from palette
--- @param plt table Palette or base16-ish table
--- @return table Terminal colors
function M.term_from_palette(plt)
  plt = plt or {}

  local black = _term_hex(plt, "base00", plt.bg_darkest or "#000000")
  local red = _term_hex(plt, "base08", plt.red or "#ff0000")
  local green = _term_hex(plt, "base0B", plt.green or "#00ff00")
  local yellow = _term_hex(plt, "base0A", plt.yellow or "#ffff00")
  local blue = _term_hex(plt, "base0D", plt.blue or "#0000ff")
  local magenta = _term_hex(plt, "base0E", plt.magenta or "#ff00ff")
  local cyan = _term_hex(plt, "base0C", plt.cyan or "#00ffff")
  local white = _term_hex(plt, "base05", plt.fg or "#ffffff")

  return {
    black = black,
    red = red,
    green = green,
    yellow = yellow,
    blue = blue,
    magenta = magenta,
    cyan = cyan,
    white = white,

    black_bright = M.brighten(black, 0.6),
    red_bright = M.brighten(red, 0.15),
    green_bright = M.brighten(green, 0.1),
    yellow_bright = M.brighten(yellow, 0.15),
    blue_bright = M.brighten(blue, 0.2),
    magenta_bright = M.brighten(magenta, 0.15),
    cyan_bright = M.brighten(cyan, 0.1),
    white_bright = M.brighten(white, 0.15),
  }
end

M.STRICT_HEX_PATTERN = STRICT_HEX_PATTERN

return M
