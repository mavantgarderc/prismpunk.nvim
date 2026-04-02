local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#050a0f",
  bg_darker = "#0c1620",
  bg_dark = "#142230",
  bg_mid = "#1c2e3a",
  bg_light = "#253a46",
  bg_lighter = "#2e4652",
  bg_lightest = "#38525e",
  bg_alt1 = "#101c28",
  bg_alt2 = "#203040",
  bg_alt3 = "#384e58",
  bg_alt4 = "#4a6068",
  fg_lightest = "#d8f0f4",
  fg_light = "#b8d6dc",
  fg_mid = "#7ea0aa",
  fg_dark = "#607e88",
  stormCoral = "#C4605A",
  driftPeach = "#C88A72",
  anchorBrass = "#B89A3A",
  harbourLamp = "#D4AA42",
  tideMoss = "#6AAE78",
  shallowBrine = "#48AEAA",
  openSea = "#4A8AB8",
  sailMist = "#8A7EAE",
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
      normal = plt.openSea,
      insert = plt.tideMoss,
      visual = plt.sailMist,
      replace = plt.stormCoral,
      command = plt.harbourLamp,
    },

    accent = {
      accent1 = plt.openSea,
      accent2 = plt.anchorBrass,
      accent3 = plt.shallowBrine,
      accent4 = plt.fg_light,
      accent5 = plt.stormCoral,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.stormCoral,
      rainbow2 = plt.driftPeach,
      rainbow3 = plt.harbourLamp,
      rainbow4 = plt.anchorBrass,
      rainbow5 = plt.tideMoss,
      rainbow6 = plt.shallowBrine,
      rainbow7 = plt.openSea,
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
      bg_search = plt.harbourLamp,
      bg_visual = plt.bg_light,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt2,

      header1 = plt.harbourLamp,
      header2 = plt.openSea,
      special = plt.anchorBrass,
      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,
      win_separator = plt.sailMist,
      indent = plt.bg_light,
      indent_scope = plt.openSea,
      picker = plt.sailMist,
      yank = plt.harbourLamp,
      mark = plt.stormCoral,
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
        fg_alternate = plt.harbourLamp,
        indicator = plt.openSea,
      },
    },

    syn = {
      attribute = plt.anchorBrass,
      boolean = plt.anchorBrass,
      comment = plt.fg_mid,
      constant = plt.anchorBrass,
      deprecated = plt.fg_dark,
      func = plt.openSea,
      identifier = plt.fg_lightest,
      keyword = plt.driftPeach,
      method = plt.openSea,
      number = plt.driftPeach,
      operator = plt.stormCoral,
      parameter = plt.fg_light,
      preproc = plt.sailMist,
      punct = plt.fg_mid,
      regex = plt.anchorBrass,
      special = plt.harbourLamp,
      special2 = plt.sailMist,
      special3 = plt.shallowBrine,
      statement = plt.sailMist,
      string = plt.tideMoss,
      symbol = plt.stormCoral,
      type = plt.shallowBrine,
      variable = plt.fg_lightest,
    },

    diag = {
      error = plt.stormCoral,
      warning = plt.harbourLamp,
      info = plt.openSea,
      ok = plt.tideMoss,
      hint = plt.shallowBrine,

      virtual_text_error = plt.stormCoral,
      virtual_text_warning = plt.harbourLamp,
      virtual_text_info = plt.openSea,
      virtual_text_ok = plt.tideMoss,
      virtual_text_hint = plt.shallowBrine,
    },

    diff = {
      add = plt.tideMoss,
      add_inline = plt.shallowBrine,
      change = plt.harbourLamp,
      change_inline = plt.anchorBrass,
      delete = plt.stormCoral,
      delete_inline = plt.driftPeach,
      text = plt.openSea,
    },

    vcs = {
      added = plt.tideMoss,
      changed = plt.harbourLamp,
      removed = plt.stormCoral,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.stormCoral,
      green = plt.tideMoss,
      yellow = plt.harbourLamp,
      blue = plt.openSea,
      magenta = plt.sailMist,
      cyan = plt.shallowBrine,
      white = plt.fg_light,

      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color(plt.stormCoral):brighten(0.2):to_hex(),
      green_bright = color(plt.tideMoss):brighten(0.1):to_hex(),
      yellow_bright = color(plt.harbourLamp):brighten(0.2):to_hex(),
      blue_bright = color(plt.openSea):brighten(0.3):to_hex(),
      magenta_bright = color(plt.sailMist):brighten(0.2):to_hex(),
      cyan_bright = color(plt.shallowBrine):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),

      indexed1 = plt.anchorBrass,
      indexed2 = plt.driftPeach,
    },
  }
end

return {
  name = "Vanaheim – Njörðr",
  author = "PrismPunk",
  description = "God of the sea — coastal winds, calm waters, and the fishermen's patron. "
    .. "Midnight ocean depths rising through harbour teal and open-sea steel, "
    .. "warmed by storm-coral, driftwood peach, anchor brass, and the amber glow "
    .. "of a harbour lamp guiding ships home through salt mist.",
  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.stormCoral,
    base09 = palette.driftPeach,
    base0A = palette.harbourLamp,
    base0B = palette.tideMoss,
    base0C = palette.shallowBrine,
    base0D = palette.openSea,
    base0E = palette.sailMist,
    base0F = palette.anchorBrass,
  },
  palette = palette,
  get = M.get,
}
