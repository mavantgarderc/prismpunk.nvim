local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#140A0A",
  bg_darker = "#281414",
  bg_dark = "#3C1E1E",
  bg_mid = "#502828",
  bg_light = "#643232",
  bg_lighter = "#783C3C",
  bg_lightest = "#8C4646",

  fg_lightest = "#FFE8E8",
  fg_light = "#E8C8C8",
  fg_mid = "#A87878",
  fg_dark = "#885858",

  bg_alt1 = "#1C0F0F",
  bg_alt2 = "#0C0505",
  bg_alt3 = "#321919",
  bg_alt4 = "#100808",

  chaosCore = "#FF3333",
  chaosGlow = "#FF6666",
  chaosBright = "#FF0000",
  chaosDeep = "#CC0000",
  chaosDark = "#990000",

  stormWill = "#33FF33",
  stormHope = "#3333FF",
  stormRage = "#FF3333",
  stormFear = "#FFFF33",
  stormLove = "#FF33FF",
  stormAvarice = "#FF9933",
  stormCompassion = "#9933FF",

  emotionalVortex = "#FF33AA",
  unstableEnergy = "#33FFFF",
  chaoticPattern = "#FFAA33",

  accent_red = "#FF3333",
  accent_pink = "#FF33AA",
  accent_yellow = "#FFFF33",
  accent_orange = "#FF9933",
  accent_green = "#33FF33",
  accent_blue = "#3333FF",
  accent_violet = "#AA33FF",
  accent_aqua = "#33FFFF",
}

local M = {}

---@param opts table
---@param plt table
---@return table
---@diagnostic disable-next-line: redefined-local
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.chaosCore,
      insert = plt.stormWill,
      visual = plt.emotionalVortex,
      replace = plt.stormRage,
      command = plt.chaosBright,
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
      bg_search = plt.chaosGlow,
      bg_visual = plt.emotionalVortex,
      bg_statusline = plt.unstableEnergy,
      border = plt.bg_alt4,
      header1 = plt.chaosCore,
      header2 = plt.chaoticPattern,
      special = plt.unstableEnergy,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.chaosCore,
      indent = plt.bg_lighter,
      indent_scope = plt.chaosGlow,
      picker = plt.stormRage,
      yank = plt.stormWill,
      mark = plt.stormHope,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.chaosBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.chaoticPattern,
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
      accent1 = plt.chaosCore,
      accent2 = plt.chaosBright,
      accent3 = plt.chaoticPattern,
      accent4 = plt.fg_mid,
      accent5 = plt.stormRage,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.stormRage,
      rainbow2 = plt.stormAvarice,
      rainbow3 = plt.stormFear,
      rainbow4 = plt.stormWill,
      rainbow5 = plt.stormHope,
      rainbow6 = plt.stormCompassion,
      rainbow7 = plt.stormLove,
    },

    syn = {
      attribute = plt.accent_yellow,
      comment = plt.fg_dark,
      constant = plt.stormAvarice,
      deprecated = plt.fg_mid,
      func = plt.stormHope,
      identifier = plt.fg_lightest,
      keyword = plt.chaosCore,
      method = plt.stormWill,
      number = plt.stormAvarice,
      operator = plt.stormRage,
      parameter = plt.fg_mid,
      preproc = plt.stormLove,
      punct = plt.fg_mid,
      regex = plt.stormFear,
      statement = plt.chaosCore,
      string = plt.stormWill,
      symbol = plt.stormRage,
      type = plt.stormHope,
      variable = plt.fg_mid,
      special = plt.stormFear,
      special2 = plt.stormRage,
      special3 = plt.chaosDeep,
    },

    vcs = {
      added = plt.stormWill,
      removed = plt.stormRage,
      changed = plt.stormFear,
    },

    diff = {
      add = plt.stormWill,
      change = plt.stormFear,
      delete = plt.stormRage,
      text = plt.stormHope,
    },

    diag = {
      ok = plt.stormWill,
      error = plt.stormRage,
      warning = plt.stormFear,
      info = plt.stormHope,
      hint = plt.stormCompassion,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.stormRage,
      green = plt.stormWill,
      yellow = plt.stormFear,
      blue = plt.stormHope,
      magenta = plt.stormLove,
      cyan = plt.chaoticPattern,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.stormRage):brighten(0.2):to_hex(),
      green_bright = color(plt.stormWill):brighten(0.1):to_hex(),
      yellow_bright = color(plt.stormFear):brighten(0.2):to_hex(),
      blue_bright = color(plt.stormHope):brighten(0.3):to_hex(),
      magenta_bright = color(plt.stormLove):brighten(0.2):to_hex(),
      cyan_bright = color(plt.chaoticPattern):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.chaosBright,
      indexed2 = plt.stormRage,
    },
  }
end

return {
  name = "Lantern Corps - Phantom (Choas)",
  author = "PrismPunk.nvim",
  description = "In Desperate Day, In Hopeless Night,"
    .. "The Phantom Ring is our last light."
    .. "We yearn for power, strength and might, "
    .. "I seize the ring, that is my right!",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.stormRage,
    base09 = palette.stormAvarice,
    base0A = palette.stormFear,
    base0B = palette.stormWill,
    base0C = palette.chaoticPattern,
    base0D = palette.chaosCore,
    base0E = palette.chaosDeep,
    base0F = palette.chaosBright,
  },

  palette = palette,

  get = M.get,
}
