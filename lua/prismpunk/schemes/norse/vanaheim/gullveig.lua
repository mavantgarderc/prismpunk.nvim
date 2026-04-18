local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0a0504",
  bg_darker = "#1a0a05",
  bg_dark = "#2a140a",
  bg_mid = "#3a1e0f",
  bg_light = "#4a2814",
  bg_lighter = "#5a3219",
  bg_lightest = "#6a3c1e",
  bg_alt1 = "#120804",
  bg_alt2 = "#321a0c",
  bg_alt3 = "#523220",
  bg_alt4 = "#6e4830",
  fg_lightest = "#f4e0cc",
  fg_light = "#d4b898",
  fg_mid = "#aa8462",
  fg_dark = "#8a6848",
  pyreAsh = "#CA3030",
  emberTongue = "#DC6522",
  greedGold = "#CA8832",
  moltenOre = "#EA9C4B",
  seidrSmoke = "#7EAA58",
  ashVeil = "#6A9EAA",
  warSpear = "#B8510E",
  heidrVision = "#A06888",
}

local M = {}

---@param opts table|nil
---@param plt table|nil
---@return table
M.get = function(opts, plt)
  plt = plt or palette
  opts = opts or {}
  return {

    modes = {
      normal = plt.greedGold,
      insert = plt.seidrSmoke,
      visual = plt.heidrVision,
      replace = plt.pyreAsh,
      command = plt.moltenOre,
    },

    accent = {
      accent1 = plt.greedGold,
      accent2 = plt.emberTongue,
      accent3 = plt.ashVeil,
      accent4 = plt.fg_light,
      accent5 = plt.pyreAsh,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.pyreAsh,
      rainbow2 = plt.emberTongue,
      rainbow3 = plt.greedGold,
      rainbow4 = plt.moltenOre,
      rainbow5 = plt.seidrSmoke,
      rainbow6 = plt.ashVeil,
      rainbow7 = plt.heidrVision,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_mid,
      fg_dark = plt.fg_dark,
      fg_reverse = plt.bg_darkest,

      bg = plt.bg_darkest,
      bg_dim = plt.bg_darkest,
      bg_m1 = plt.bg_darker,
      bg_m2 = plt.bg_dark,
      bg_m3 = plt.bg_mid,
      bg_m4 = plt.bg_light,
      bg_p1 = plt.bg_dark,
      bg_p2 = plt.bg_mid,

      bg_gutter = (opts.gutter ~= false) and plt.bg_light or "none",
      bg_cursorline = plt.bg_mid,
      bg_cursorline_alt = plt.bg_light,
      cursorline = plt.bg_mid,
      bg_highlight = plt.bg_light,
      bg_search = plt.greedGold,
      bg_visual = plt.bg_light,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt2,

      header1 = plt.greedGold,
      header2 = plt.emberTongue,
      special = plt.moltenOre,
      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,
      win_separator = plt.heidrVision,
      indent = plt.bg_light,
      indent_scope = plt.greedGold,
      picker = plt.heidrVision,
      yank = plt.greedGold,
      mark = plt.pyreAsh,
      scrollbar = plt.bg_lighter,
      selection = plt.bg_light,
      line_nr = plt.fg_mid,
      line_nr_dim = plt.bg_lighter,
      line_nr_active = plt.fg_lightest,

      float = {
        fg = plt.fg_light,
        bg = plt.bg_mid,
        fg_border = plt.fg_dark,
        bg_border = plt.bg_mid,
      },

      pmenu = {
        fg = plt.fg_lightest,
        fg_sel = "none",
        fg_border = plt.fg_dark,
        bg = plt.bg_light,
        bg_sel = plt.bg_lighter,
        bg_border = plt.bg_light,
        bg_sbar = plt.bg_light,
        bg_thumb = plt.bg_lighter,
      },

      tabline = {
        bg = plt.bg_darkest,
        bg_inactive = plt.bg_darkest,
        bg_selected = plt.bg_dark,
        bg_alternate = plt.bg_darker,
        fg_inactive = plt.fg_mid,
        fg_selected = plt.fg_lightest,
        fg_alternate = plt.greedGold,
        indicator = plt.emberTongue,
      },
    },

    syn = {
      attribute = plt.moltenOre,
      boolean = plt.warSpear,
      comment = plt.fg_mid,
      constant = plt.warSpear,
      deprecated = plt.fg_dark,
      func = plt.greedGold,
      identifier = plt.fg_lightest,
      keyword = plt.emberTongue,
      method = plt.greedGold,
      number = plt.moltenOre,
      operator = plt.pyreAsh,
      parameter = plt.fg_light,
      preproc = plt.heidrVision,
      punct = plt.fg_mid,
      regex = plt.warSpear,
      special = plt.moltenOre,
      special2 = plt.heidrVision,
      special3 = plt.ashVeil,
      statement = plt.heidrVision,
      string = plt.seidrSmoke,
      symbol = plt.pyreAsh,
      type = plt.ashVeil,
      variable = plt.fg_lightest,
    },

    diag = {
      error = plt.pyreAsh,
      warning = plt.moltenOre,
      info = plt.ashVeil,
      ok = plt.seidrSmoke,
      hint = plt.greedGold,

      virtual_text_error = plt.pyreAsh,
      virtual_text_warning = plt.moltenOre,
      virtual_text_info = plt.ashVeil,
      virtual_text_ok = plt.seidrSmoke,
      virtual_text_hint = plt.greedGold,
    },

    diff = {
      add = plt.seidrSmoke,
      add_inline = plt.ashVeil,
      change = plt.moltenOre,
      change_inline = plt.greedGold,
      delete = plt.pyreAsh,
      delete_inline = plt.emberTongue,
      text = plt.greedGold,
    },

    vcs = {
      added = plt.seidrSmoke,
      changed = plt.moltenOre,
      removed = plt.pyreAsh,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.pyreAsh,
      green = plt.seidrSmoke,
      yellow = plt.greedGold,
      blue = plt.ashVeil,
      magenta = plt.heidrVision,
      cyan = plt.seidrSmoke,
      white = plt.fg_light,

      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color(plt.pyreAsh):brighten(0.2):to_hex(),
      green_bright = color(plt.seidrSmoke):brighten(0.1):to_hex(),
      yellow_bright = color(plt.greedGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.ashVeil):brighten(0.3):to_hex(),
      magenta_bright = color(plt.heidrVision):brighten(0.2):to_hex(),
      cyan_bright = color(plt.seidrSmoke):brighten(0.2):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),

      indexed1 = plt.warSpear,
      indexed2 = plt.emberTongue,
    },
  }
end

return {
  name = "Vanaheim – Gullveig",
  author = "PrismPunk",
  description = "Thrice-burned witch of gold-greed — catalyst of the first war between "
    .. "Aesir and Vanir. Charred-ember backgrounds smoulder beneath pyre-ash crimson, "
    .. "cursed greed-gold, molten ore, and the green-tinged seidr smoke of her "
    .. "witchcraft, while the pale ash-veil of her spirit rises reborn and "
    .. "Heiðr's violet visions pierce the firelit dark.",
  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.pyreAsh,
    base09 = palette.emberTongue,
    base0A = palette.greedGold,
    base0B = palette.seidrSmoke,
    base0C = palette.ashVeil,
    base0D = palette.greedGold,
    base0E = palette.heidrVision,
    base0F = palette.warSpear,
  },
  palette = palette,
  get = M.get,
}
