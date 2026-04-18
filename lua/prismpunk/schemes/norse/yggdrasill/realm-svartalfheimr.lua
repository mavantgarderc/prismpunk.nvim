local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0a0a10",
  bg_darker = "#101018",
  bg_dark = "#161620",
  bg_mid = "#1c1c2a",
  bg_light = "#242434",
  bg_lighter = "#2c2c3e",
  bg_lightest = "#343448",
  bg_alt1 = "#3c3c52",
  bg_alt2 = "#44445c",
  bg_alt3 = "#4e4e66",
  bg_alt4 = "#585870",

  fg_lightest = "#dcdae6",
  fg_light = "#c0bed0",
  fg_mid = "#908ea2",
  fg_dark = "#605e72",

  forgeEmber = "#d08a40",
  anvilSpark = "#e8b850",
  dvergrSteel = "#8a9ab8",
  mithrilSheen = "#a8b8d4",
  deepVein = "#7a6aa0",
  runeCarve = "#c87850",
  cavernMoss = "#6a9a78",
  shadowAmethyst = "#9068a8",
  hammerStrike = "#c8a060",
  eitriGold = "#d4a840",
  brokkirCopper = "#b87848",
  darkIron = "#606878",
  tunnelDamp = "#4a5060",
  pitchBlack = "#08080e",
  gemVein = "#6888b8",
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
      normal = plt.dvergrSteel,
      insert = plt.anvilSpark,
      visual = plt.shadowAmethyst,
      replace = plt.runeCarve,
      command = plt.forgeEmber,
    },

    accent = {
      accent1 = plt.dvergrSteel,
      accent2 = plt.anvilSpark,
      accent3 = plt.gemVein,
      accent4 = plt.fg_light,
      accent5 = plt.forgeEmber,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.dvergrSteel,
      rainbow2 = plt.anvilSpark,
      rainbow3 = plt.gemVein,
      rainbow4 = plt.shadowAmethyst,
      rainbow5 = plt.forgeEmber,
      rainbow6 = plt.runeCarve,
      rainbow7 = plt.cavernMoss,
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
      bg_search = plt.anvilSpark,
      bg_visual = plt.pitchBlack,

      bg_statusline = plt.bg_light,
      border = plt.bg_alt1,

      header1 = plt.dvergrSteel,
      header2 = plt.anvilSpark,
      special = plt.eitriGold,

      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,

      win_separator = plt.gemVein,

      indent = plt.bg_light,
      indent_scope = plt.dvergrSteel,

      picker = plt.gemVein,

      yank = plt.anvilSpark,
      mark = plt.shadowAmethyst,

      scrollbar = plt.bg_lighter,

      selection = plt.pitchBlack,

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
        fg_alternate = plt.dvergrSteel,

        indicator = plt.anvilSpark,
      },
    },

    syn = {
      attribute = plt.forgeEmber,
      boolean = plt.shadowAmethyst,
      comment = plt.darkIron,
      constant = plt.gemVein,
      deprecated = plt.fg_dark,

      func = plt.anvilSpark,
      identifier = plt.fg_light,
      keyword = plt.dvergrSteel,

      method = plt.anvilSpark,
      number = plt.eitriGold,
      operator = plt.mithrilSheen,
      parameter = plt.cavernMoss,

      preproc = plt.runeCarve,

      punct = plt.fg_mid,
      regex = plt.shadowAmethyst,

      special = plt.eitriGold,
      special2 = plt.runeCarve,
      special3 = plt.hammerStrike,

      statement = plt.dvergrSteel,

      string = plt.cavernMoss,
      symbol = plt.mithrilSheen,
      type = plt.gemVein,

      variable = plt.fg_light,
      annotation = plt.brokkirCopper,
    },

    diag = {
      error = plt.runeCarve,
      warning = plt.forgeEmber,
      info = plt.gemVein,
      ok = plt.cavernMoss,
      hint = plt.dvergrSteel,

      virtual_text_error = plt.runeCarve,
      virtual_text_warning = plt.forgeEmber,
      virtual_text_info = plt.gemVein,
      virtual_text_ok = plt.cavernMoss,
      virtual_text_hint = plt.dvergrSteel,
    },

    diff = {
      add = plt.cavernMoss,
      add_inline = plt.dvergrSteel,

      change = plt.gemVein,
      change_inline = plt.shadowAmethyst,

      delete = plt.runeCarve,
      delete_inline = plt.forgeEmber,

      text = plt.anvilSpark,
    },

    vcs = {
      added = plt.cavernMoss,
      changed = plt.gemVein,
      removed = plt.runeCarve,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.runeCarve,
      green = plt.cavernMoss,
      yellow = plt.anvilSpark,
      blue = plt.gemVein,
      magenta = plt.shadowAmethyst,
      cyan = plt.dvergrSteel,
      white = plt.fg_light,

      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color(plt.runeCarve):brighten(0.2):to_hex(),
      green_bright = color(plt.cavernMoss):brighten(0.15):to_hex(),
      yellow_bright = color(plt.anvilSpark):brighten(0.15):to_hex(),
      blue_bright = color(plt.gemVein):brighten(0.15):to_hex(),
      magenta_bright = color(plt.shadowAmethyst):brighten(0.2):to_hex(),
      cyan_bright = color(plt.dvergrSteel):brighten(0.15):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.15):to_hex(),

      indexed1 = plt.hammerStrike,
      indexed2 = plt.brokkirCopper,
    },
  }
end

return {
  name = "Svartálfaheimr – Realm of the Dark Elves",
  author = "PrismPunk",
  description = "The subterranean kingdom of the Dvergar, master smiths of the nine realms. "
    .. "Svartálfaheimr lies deep beneath the earth — a labyrinth of tunnels, forges, and "
    .. "gem-veined caverns where the dark elves and dwarves craft the most powerful artifacts "
    .. "in all of Norse myth. It was here that Eitri and Brokkir forged Mjölnir, Thor's "
    .. "hammer; here that the golden hair of Sif was spun from real gold; here that "
    .. "Gleipnir, the impossible chain that binds Fenrir, was woven from the sound of a "
    .. "cat's footfall and the roots of a mountain. The palette is drawn from the deepest "
    .. "darkness of the underground — near-void blacks and blue-tinged shadows — lit only "
    .. "by the amber glow of forge embers, the bright spark of hammer on anvil, and the "
    .. "cool gleam of mithril and raw gemstone veins in the rock. Amethyst and copper "
    .. "catch the light in unexpected places, cavern moss clings to damp stone, and "
    .. "everywhere the patient, meticulous craft of the Dvergar leaves its mark in "
    .. "rune-carved metal and polished steel.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,

    base08 = palette.runeCarve,
    base09 = palette.forgeEmber,
    base0A = palette.anvilSpark,
    base0B = palette.cavernMoss,
    base0C = palette.dvergrSteel,
    base0D = palette.gemVein,
    base0E = palette.shadowAmethyst,
    base0F = palette.brokkirCopper,
  },

  palette = palette,
  get = M.get,
}
