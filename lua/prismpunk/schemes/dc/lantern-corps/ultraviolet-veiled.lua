local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0A0710",
  bg_darker = "#140E20",
  bg_dark = "#1E1530",
  bg_mid = "#281C40",
  bg_light = "#322350",
  bg_lighter = "#3C2A60",
  bg_lightest = "#463170",

  fg_lightest = "#D8D0E8",
  fg_light = "#B8B0C8",
  fg_mid = "#787088",
  fg_dark = "#585068",

  bg_alt1 = "#120C1C",
  bg_alt2 = "#080510",
  bg_alt3 = "#1A1228",
  bg_alt4 = "#0E0918",

  veiledBright = "#6A5ACD",
  veiledGlow = "#7B68EE",
  veiledCore = "#483D8B",
  veiledDeep = "#2F2558",
  veiledDark = "#1C1636",

  shroudedViolet = "#9370DB",
  mutedIndigo = "#4B0082",
  shadowPurple = "#8B008B",
  hiddenMagenta = "#8B4789",
  concealedPink = "#C71585",
  obscuredBlue = "#4169E1",
  foggyCyan = "#4682B4",

  mistyLight = "#D8BFD8",
  shroudedGlow = "#E6E6FA",
  hiddenEnergy = "#DDA0DD",

  accent_red = "#B03060",
  accent_pink = "#DB7093",
  accent_yellow = "#DAA520",
  accent_orange = "#CD853F",
  accent_green = "#2E8B57",
  accent_blue = "#4682B4",
  accent_violet = "#9370DB",
  accent_aqua = "#5F9EA0",
}

local M = {}

---@param opts table
---@param plt table
---@return table
---@diagnostic disable-next-line: redefined-local
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.veiledCore,
      insert = plt.shroudedViolet,
      visual = plt.veiledGlow,
      replace = plt.hiddenMagenta,
      command = plt.veiledBright,
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
      bg_search = plt.veiledGlow,
      bg_visual = plt.veiledDark,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.veiledCore,
      header2 = plt.shroudedViolet,
      special = plt.mutedIndigo,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.veiledCore,
      indent = plt.bg_lighter,
      indent_scope = plt.veiledGlow,
      picker = plt.hiddenMagenta,
      yank = plt.concealedPink,
      mark = plt.shroudedViolet,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.veiledBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.mutedIndigo,
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
      accent1 = plt.veiledCore,
      accent2 = plt.veiledBright,
      accent3 = plt.shroudedViolet,
      accent4 = plt.fg_mid,
      accent5 = plt.hiddenMagenta,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.veiledCore,
      rainbow2 = plt.veiledBright,
      rainbow3 = plt.shroudedViolet,
      rainbow4 = plt.veiledGlow,
      rainbow5 = plt.mutedIndigo,
      rainbow6 = plt.hiddenMagenta,
      rainbow7 = plt.concealedPink,
    },

    syn = {
      attribute = plt.accent_yellow,
      comment = plt.fg_dark,
      constant = plt.veiledBright,
      deprecated = plt.fg_mid,
      func = plt.shroudedViolet,
      identifier = plt.fg_lightest,
      keyword = plt.veiledCore,
      method = plt.mutedIndigo,
      number = plt.veiledGlow,
      operator = plt.hiddenMagenta,
      parameter = plt.fg_mid,
      preproc = plt.veiledDeep,
      punct = plt.fg_mid,
      regex = plt.accent_yellow,
      statement = plt.veiledCore,
      string = plt.accent_green,
      symbol = plt.hiddenMagenta,
      type = plt.shroudedViolet,
      variable = plt.fg_mid,
      special = plt.accent_yellow,
      special2 = plt.hiddenMagenta,
      special3 = plt.veiledDeep,
    },

    vcs = {
      added = plt.accent_green,
      removed = plt.hiddenMagenta,
      changed = plt.accent_yellow,
    },

    diff = {
      add = plt.accent_green,
      change = plt.accent_yellow,
      delete = plt.hiddenMagenta,
      text = plt.veiledCore,
    },

    diag = {
      ok = plt.accent_green,
      error = plt.hiddenMagenta,
      warning = plt.accent_yellow,
      info = plt.veiledCore,
      hint = plt.shroudedViolet,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.hiddenMagenta,
      green = plt.accent_green,
      yellow = plt.accent_yellow,
      blue = plt.veiledCore,
      magenta = plt.accent_pink,
      cyan = plt.shroudedViolet,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.hiddenMagenta):brighten(0.2):to_hex(),
      green_bright = color(plt.accent_green):brighten(0.1):to_hex(),
      yellow_bright = color(plt.accent_yellow):brighten(0.2):to_hex(),
      blue_bright = color(plt.veiledCore):brighten(0.3):to_hex(),
      magenta_bright = color(plt.accent_pink):brighten(0.2):to_hex(),
      cyan_bright = color(plt.shroudedViolet):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.veiledBright,
      indexed2 = plt.hiddenMagenta,
    },
  }
end

return {
  name = "Lantern Corps - Ultraviolet (Veiled)",
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
    base08 = palette.hiddenMagenta,
    base09 = palette.accent_orange,
    base0A = palette.accent_yellow,
    base0B = palette.accent_green,
    base0C = palette.shroudedViolet,
    base0D = palette.veiledCore,
    base0E = palette.veiledDeep,
    base0F = palette.veiledBright,
  },

  palette = palette,

  get = M.get,
}
