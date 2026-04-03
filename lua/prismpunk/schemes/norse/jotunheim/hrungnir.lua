local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0f0a05",
  bg_darker = "#19140a",
  bg_dark = "#231e0f",
  bg_mid = "#2d2814",
  bg_light = "#373219",
  bg_lighter = "#413c1e",
  bg_lightest = "#4b4623",
  bg_alt1 = "#555028",
  bg_alt2 = "#5f5a2d",
  bg_alt3 = "#696432",
  bg_alt4 = "#736e37",

  fg_lightest = "#f0f0f0",
  fg_light = "#d2d2d2",
  fg_mid = "#a5a5a5",
  fg_dark = "#878787",

  whetstoneHead = "#7d783c",
  stoneShield = "#878241",
  clayFeet = "#918c46",
  duelGround = "#9b964b",
  thorsMight = "#a5a050",
  shatteredStone = "#969696",
  fallingGiant = "#a5a5a5",
  embeddedShard = "#b4b4b4",
  tragicEnd = "#c3c3c3",
  giantLegacy = "#e1e1e1",
}

local M = {}

---@param plt table|nil
---@param opts table|nil
---@return table
M.get = function(opts, plt)
  plt = plt or palette
  opts = opts or {}
  return {
    modes = {
      normal = plt.whetstoneHead,
      insert = plt.clayFeet,
      visual = plt.thorsMight,
      replace = plt.shatteredStone,
      command = plt.giantLegacy,
    },

    accent = {
      accent1 = plt.whetstoneHead,
      accent2 = plt.clayFeet,
      accent3 = plt.thorsMight,
      accent4 = plt.fg_light,
      accent5 = plt.shatteredStone,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.whetstoneHead,
      rainbow2 = plt.stoneShield,
      rainbow3 = plt.clayFeet,
      rainbow4 = plt.duelGround,
      rainbow5 = plt.thorsMight,
      rainbow6 = plt.shatteredStone,
      rainbow7 = plt.fallingGiant,
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
      bg_search = plt.thorsMight,
      bg_visual = plt.bg_light,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt1,

      header1 = plt.whetstoneHead,
      header2 = plt.shatteredStone,
      special = plt.giantLegacy,
      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,
      win_separator = plt.clayFeet,
      indent = plt.bg_light,
      indent_scope = plt.whetstoneHead,
      picker = plt.thorsMight,
      yank = plt.embeddedShard,
      mark = plt.tragicEnd,
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
        fg_alternate = plt.whetstoneHead,
        indicator = plt.shatteredStone,
      },
    },

    syn = {
      attribute = plt.giantLegacy,
      boolean = plt.thorsMight,
      comment = plt.fg_mid,
      constant = plt.thorsMight,
      deprecated = plt.fg_dark,
      func = plt.whetstoneHead,
      identifier = plt.fg_lightest,
      keyword = plt.shatteredStone,
      method = plt.whetstoneHead,
      number = plt.thorsMight,
      operator = plt.clayFeet,
      parameter = plt.tragicEnd,
      preproc = plt.giantLegacy,
      punct = plt.fg_mid,
      regex = plt.embeddedShard,
      special = plt.giantLegacy,
      special2 = plt.embeddedShard,
      special3 = plt.tragicEnd,
      statement = plt.shatteredStone,
      string = plt.stoneShield,
      symbol = plt.clayFeet,
      type = plt.giantLegacy,
      variable = plt.fg_lightest,
    },

    diag = {
      error = plt.shatteredStone,
      warning = plt.thorsMight,
      info = plt.whetstoneHead,
      ok = plt.stoneShield,
      hint = plt.giantLegacy,

      virtual_text_error = plt.shatteredStone,
      virtual_text_warning = plt.thorsMight,
      virtual_text_info = plt.whetstoneHead,
      virtual_text_ok = plt.stoneShield,
      virtual_text_hint = plt.giantLegacy,
    },

    diff = {
      add = plt.stoneShield,
      add_inline = plt.clayFeet,
      change = plt.thorsMight,
      change_inline = plt.embeddedShard,
      delete = plt.shatteredStone,
      delete_inline = plt.fallingGiant,
      text = plt.giantLegacy,
    },

    vcs = {
      added = plt.stoneShield,
      changed = plt.thorsMight,
      removed = plt.shatteredStone,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.shatteredStone,
      green = plt.stoneShield,
      yellow = plt.giantLegacy,
      blue = plt.whetstoneHead,
      magenta = plt.thorsMight,
      cyan = plt.clayFeet,
      white = plt.fg_light,

      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color(plt.shatteredStone):brighten(0.2):to_hex(),
      green_bright = color(plt.stoneShield):brighten(0.15):to_hex(),
      yellow_bright = color(plt.giantLegacy):brighten(0.15):to_hex(),
      blue_bright = color(plt.whetstoneHead):brighten(0.15):to_hex(),
      magenta_bright = color(plt.thorsMight):brighten(0.2):to_hex(),
      cyan_bright = color(plt.clayFeet):brighten(0.15):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.15):to_hex(),

      indexed1 = plt.tragicEnd,
      indexed2 = plt.embeddedShard,
    },
  }
end

return {
  name = "Jötunheim – Hrungnir",
  author = "PrismPunk",
  description = "Stone giant — whetstone head, duel with Thor, tragic fall. Hrungnir, "
    .. "strongest of all giants, challenged Thor to single combat. His head and heart "
    .. "were made of stone, his shield of flint. When Thor hurled Mjölnir, Hrungnir "
    .. "threw his whetstone in defense — the weapons met mid-air, shattering the "
    .. "whetstone. A shard embedded itself in Thor's forehead, while Mjölnir struck "
    .. "true, killing the giant. Hrungnir fell forward, his leg pinning Thor to the "
    .. "ground. The palette blends earthy ochre and olive tones with cold grey stone — "
    .. "the colors of clay feet and whetstone head, of a duel between living rock and "
    .. "divine thunder, ending in shattered stone and tragic victory.",
  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.shatteredStone,
    base09 = palette.thorsMight,
    base0A = palette.tragicEnd,
    base0B = palette.stoneShield,
    base0C = palette.giantLegacy,
    base0D = palette.whetstoneHead,
    base0E = palette.clayFeet,
    base0F = palette.embeddedShard,
  },
  palette = palette,
  get = M.get,
}
