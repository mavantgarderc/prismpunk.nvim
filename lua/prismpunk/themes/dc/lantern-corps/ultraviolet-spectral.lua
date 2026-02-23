local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0A0514",
  bg_darker = "#150A28",
  bg_dark = "#200F3C",
  bg_mid = "#2B1450",
  bg_light = "#361964",
  bg_lighter = "#411E78",
  bg_lightest = "#4C238C",

  fg_lightest = "#F0E6FF",
  fg_light = "#D8C6FF",
  fg_mid = "#8878B8",
  fg_dark = "#685890",

  bg_alt1 = "#120825",
  bg_alt2 = "#070312",
  bg_alt3 = "#1A0D32",
  bg_alt4 = "#0D061C",

  ultravioletBright = "#8A2BE2",
  ultravioletGlow = "#9400D3",
  ultravioletCore = "#4B0082",
  ultravioletDeep = "#30005C",
  ultravioletDark = "#1C0036",

  spectralViolet = "#8B00FF",
  electricIndigo = "#6600FF",
  cosmicPurple = "#9932CC",
  quantumMagenta = "#FF00FF",
  photonPink = "#FF00CC",
  gammaBlue = "#6A0DAD",
  xrayCyan = "#00CCFF",

  invisibleLight = "#DA70D6",
  beyondViolet = "#EE82EE",
  spectralGlow = "#E6E6FA",

  accent_red = "#FF00AA",
  accent_pink = "#FF00FF",
  accent_yellow = "#FF00CC",
  accent_orange = "#FF0088",
  accent_green = "#AA00FF",
  accent_blue = "#6600FF",
  accent_violet = "#8B00FF",
  accent_aqua = "#CC00FF",
}

local M = {}

---@param opts table
---@param plt table
---@return table
---@diagnostic disable-next-line: redefined-local
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.ultravioletCore,
      insert = plt.spectralViolet,
      visual = plt.ultravioletGlow,
      replace = plt.quantumMagenta,
      command = plt.ultravioletBright,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_dark,
      fg_dimmer = plt.bg_alt3,
      fg_dark = plt.bg_alt2,
      fg_reverse = plt.bg_alt1,
      bg_m4 = plt.bg_alt4,
      bg_m3 = plt.bg_alt3,
      bg_m2 = plt.bg_darkest,
      bg_m1 = plt.bg_darker,
      bg_dim = plt.bg_darker,
      bg = plt.bg_darkest,
      bg_p1 = plt.bg_dark,
      bg_p2 = plt.bg_mid,
      bg_gutter = opts.gutter and plt.bg_light or "none",
      bg_cursorline = plt.bg_mid,
      bg_cursorline_alt = plt.bg_light,
      bg_search = plt.ultravioletGlow,
      bg_visual = plt.ultravioletDark,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.ultravioletCore,
      header2 = plt.spectralViolet,
      special = plt.electricIndigo,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.ultravioletCore,
      indent = plt.bg_lighter,
      indent_scope = plt.ultravioletGlow,
      picker = plt.quantumMagenta,
      yank = plt.photonPink,
      mark = plt.spectralViolet,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.ultravioletBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.electricIndigo,
      },
      pmenu = {
        fg = plt.fg_lightest,
        fg_sel = "none",
        fg_border = plt.bg_lighter,
        bg_border = plt.bg_light,
        bg = plt.bg_light,
        bg_sel = plt.bg_lighter,
        bg_sbar = plt.bg_light,
        bg_thumb = plt.bg_lightest,
      },
      float = {
        fg = plt.fg_light,
        bg = plt.bg_mid,
        fg_border = plt.bg_lighter,
        bg_border = plt.bg_mid,
      },
    },

    accent = {
      accent1 = plt.ultravioletCore,
      accent2 = plt.ultravioletBright,
      accent3 = plt.spectralViolet,
      accent4 = plt.fg_mid,
      accent5 = plt.quantumMagenta,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.ultravioletCore,
      rainbow2 = plt.ultravioletBright,
      rainbow3 = plt.spectralViolet,
      rainbow4 = plt.ultravioletGlow,
      rainbow5 = plt.electricIndigo,
      rainbow6 = plt.quantumMagenta,
      rainbow7 = plt.photonPink,
    },

    syn = {
      attribute = plt.accent_yellow,
      comment = plt.fg_dark,
      constant = plt.ultravioletBright,
      deprecated = plt.fg_mid,
      func = plt.spectralViolet,
      identifier = plt.fg_lightest,
      keyword = plt.ultravioletCore,
      method = plt.electricIndigo,
      number = plt.ultravioletGlow,
      operator = plt.quantumMagenta,
      parameter = plt.fg_mid,
      preproc = plt.ultravioletDeep,
      punct = plt.fg_mid,
      regex = plt.accent_yellow,
      statement = plt.ultravioletCore,
      string = plt.accent_green,
      symbol = plt.quantumMagenta,
      type = plt.spectralViolet,
      variable = plt.fg_mid,
      special = plt.accent_yellow,
      special2 = plt.quantumMagenta,
      special3 = plt.ultravioletDeep,
    },

    vcs = {
      added = plt.accent_green,
      removed = plt.quantumMagenta,
      changed = plt.accent_yellow,
    },

    diff = {
      add = plt.accent_green,
      change = plt.accent_yellow,
      delete = plt.quantumMagenta,
      text = plt.ultravioletCore,
    },

    diag = {
      ok = plt.accent_green,
      error = plt.quantumMagenta,
      warning = plt.accent_yellow,
      info = plt.ultravioletCore,
      hint = plt.spectralViolet,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.quantumMagenta,
      green = plt.accent_green,
      yellow = plt.accent_yellow,
      blue = plt.ultravioletCore,
      magenta = plt.accent_pink,
      cyan = plt.spectralViolet,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.quantumMagenta):brighten(0.2):to_hex(),
      green_bright = color(plt.accent_green):brighten(0.1):to_hex(),
      yellow_bright = color(plt.accent_yellow):brighten(0.2):to_hex(),
      blue_bright = color(plt.ultravioletCore):brighten(0.3):to_hex(),
      magenta_bright = color(plt.accent_pink):brighten(0.2):to_hex(),
      cyan_bright = color(plt.spectralViolet):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.ultravioletBright,
      indexed2 = plt.quantumMagenta,
    },
  }
end

return {
  name = "Lantern Corps - Ultraviolet (Spectral)",
  author = "PrismPunk.nvim",
  description = "In blackest day, in brightest night, "
    .. "Beware your fears made into light. "
    .. "Let those who try to stop what's right, "
    .. "Burn like my power, Dawnbreaker's might!",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.quantumMagenta,
    base09 = palette.accent_orange,
    base0A = palette.accent_yellow,
    base0B = palette.accent_green,
    base0C = palette.spectralViolet,
    base0D = palette.ultravioletCore,
    base0E = palette.ultravioletDeep,
    base0F = palette.ultravioletBright,
  },

  palette = palette,

  get = M.get,
}
