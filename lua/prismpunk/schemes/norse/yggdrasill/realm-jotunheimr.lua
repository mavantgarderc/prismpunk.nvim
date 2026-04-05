local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0e1218",
  bg_darker = "#141820",
  bg_dark = "#1a1e28",
  bg_mid = "#222632",
  bg_light = "#2a2e3c",
  bg_lighter = "#323846",
  bg_lightest = "#3a4050",
  bg_alt1 = "#42485a",
  bg_alt2 = "#4a5064",
  bg_alt3 = "#545a6e",
  bg_alt4 = "#5c6278",

  fg_lightest = "#e6edf7",
  fg_light = "#cbd3df",
  fg_mid = "#9aa3b2",
  fg_dark = "#6b7384",

  frostGiant = "#7aa6d6",
  glacierBlue = "#5f87c9",
  rimeCyan = "#7fc7d9",
  aurora = "#9a7fd1",
  iceGold = "#d9c27a",
  stoneGiant = "#8a8f9e",
  stormGiant = "#6f8fbf",
  jotunBlood = "#c46a6a",
  ancientIce = "#a8c8e8",
  frozenSteel = "#9fb3cc",
  blizzardMist = "#2a3446",
  tundraShadow = "#1c2330",
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
      normal = plt.frostGiant,
      insert = plt.iceGold,
      visual = plt.aurora,
      replace = plt.jotunBlood,
      command = plt.glacierBlue,
    },

    accent = {
      accent1 = plt.frostGiant,
      accent2 = plt.iceGold,
      accent3 = plt.glacierBlue,
      accent4 = plt.fg_light,
      accent5 = plt.rimeCyan,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.frostGiant,
      rainbow2 = plt.iceGold,
      rainbow3 = plt.glacierBlue,
      rainbow4 = plt.aurora,
      rainbow5 = plt.rimeCyan,
      rainbow6 = plt.jotunBlood,
      rainbow7 = plt.stoneGiant,
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

      bg_gutter = (opts.gutter ~= false) and plt.bg_dark or "none",

      bg_cursorline = plt.bg_mid,
      bg_cursorline_alt = plt.bg_light,
      cursorline = plt.bg_mid,

      bg_highlight = plt.bg_light,
      bg_search = plt.iceGold,
      bg_visual = plt.blizzardMist,

      bg_statusline = plt.bg_light,
      border = plt.bg_alt1,

      header1 = plt.frostGiant,
      header2 = plt.iceGold,
      special = plt.rimeCyan,

      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,

      win_separator = plt.glacierBlue,

      indent = plt.bg_light,
      indent_scope = plt.frostGiant,

      picker = plt.glacierBlue,

      yank = plt.iceGold,
      mark = plt.aurora,

      scrollbar = plt.bg_lighter,

      selection = plt.blizzardMist,

      line_nr = plt.fg_dark,
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
        fg_alternate = plt.frostGiant,

        indicator = plt.iceGold,
      },
    },

    syn = {
      attribute = plt.rimeCyan,
      boolean = plt.aurora,
      comment = plt.stoneGiant,
      constant = plt.glacierBlue,
      deprecated = plt.fg_dark,

      func = plt.iceGold,
      identifier = plt.fg_light,
      keyword = plt.frostGiant,

      method = plt.iceGold,
      number = plt.iceGold,
      operator = plt.frozenSteel,
      parameter = plt.rimeCyan,

      preproc = plt.jotunBlood,

      punct = plt.fg_mid,
      regex = plt.aurora,

      special = plt.rimeCyan,
      special2 = plt.jotunBlood,
      special3 = plt.ancientIce,

      statement = plt.frostGiant,

      string = plt.ancientIce,
      symbol = plt.frozenSteel,
      type = plt.glacierBlue,

      variable = plt.fg_light,
      annotation = plt.stormGiant,
    },

    diag = {
      error = plt.jotunBlood,
      warning = plt.iceGold,
      info = plt.glacierBlue,
      ok = plt.rimeCyan,
      hint = plt.frostGiant,

      virtual_text_error = plt.jotunBlood,
      virtual_text_warning = plt.iceGold,
      virtual_text_info = plt.glacierBlue,
      virtual_text_ok = plt.rimeCyan,
      virtual_text_hint = plt.frostGiant,
    },

    diff = {
      add = plt.rimeCyan,
      add_inline = plt.frostGiant,

      change = plt.glacierBlue,
      change_inline = plt.aurora,

      delete = plt.jotunBlood,
      delete_inline = plt.iceGold,

      text = plt.iceGold,
    },

    vcs = {
      added = plt.rimeCyan,
      changed = plt.glacierBlue,
      removed = plt.jotunBlood,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.jotunBlood,
      green = plt.rimeCyan,
      yellow = plt.iceGold,
      blue = plt.glacierBlue,
      magenta = plt.aurora,
      cyan = plt.frostGiant,
      white = plt.fg_light,

      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color(plt.jotunBlood):brighten(0.2):to_hex(),
      green_bright = color(plt.rimeCyan):brighten(0.15):to_hex(),
      yellow_bright = color(plt.iceGold):brighten(0.15):to_hex(),
      blue_bright = color(plt.glacierBlue):brighten(0.15):to_hex(),
      magenta_bright = color(plt.aurora):brighten(0.2):to_hex(),
      cyan_bright = color(plt.frostGiant):brighten(0.15):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.15):to_hex(),

      indexed1 = plt.ancientIce,
      indexed2 = plt.stoneGiant,
    },
  }
end

return {
  name = "Jötunheimr – Realm of the Frost Giants",
  author = "PrismPunk",
  description = "Frozen mountains and ancient ice where the Jötnar dwell. Jötunheimr is a realm of "
    .. "glaciers, blizzards, and primordial stone where the frost giants rule beneath "
    .. "aurora-lit skies. The palette blends deep polar night blues, glacial cyan, "
    .. "and ancient ice whites with storm-tinted violets and the cold steel of "
    .. "mountain peaks. Warm tones appear only as rare gold firelight in giant halls "
    .. "or the crimson mark of battle against the Æsir. A stark, windswept palette "
    .. "evoking endless tundra, frozen seas, and the colossal silence of the north.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,

    base08 = palette.jotunBlood,
    base09 = palette.iceGold,
    base0A = palette.ancientIce,
    base0B = palette.rimeCyan,
    base0C = palette.frostGiant,
    base0D = palette.glacierBlue,
    base0E = palette.aurora,
    base0F = palette.stoneGiant,
  },

  palette = palette,
  get = M.get,
}
