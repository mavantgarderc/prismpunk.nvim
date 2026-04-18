local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0c0e14",
  bg_darker = "#12141c",
  bg_dark = "#181a24",
  bg_mid = "#1e222e",
  bg_light = "#262a38",
  bg_lighter = "#2e3242",
  bg_lightest = "#363a4c",
  bg_alt1 = "#3e4256",
  bg_alt2 = "#464c60",
  bg_alt3 = "#50566a",
  bg_alt4 = "#586074",

  fg_lightest = "#e0e6f0",
  fg_light = "#c4cad8",
  fg_mid = "#8e96a8",
  fg_dark = "#606878",

  hvergelmirFrost = "#7aaac8",
  mistVeil = "#6888b0",
  deadIce = "#9ac0d8",
  helBlue = "#5a72a8",
  corpselight = "#88c4a0",
  bonePale = "#c8ccd8",
  serpentGreen = "#6aaa8a",
  rotViolet = "#8a6aa0",
  naglfariGrey = "#707888",
  nidhoggrRed = "#a85a5a",
  frostbite = "#a0d0e8",
  abyssBlack = "#0a0c10",
  elivagarMist = "#1c2232",
  rimeFog = "#2a3040",
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
      normal = plt.hvergelmirFrost,
      insert = plt.corpselight,
      visual = plt.rotViolet,
      replace = plt.nidhoggrRed,
      command = plt.mistVeil,
    },

    accent = {
      accent1 = plt.hvergelmirFrost,
      accent2 = plt.corpselight,
      accent3 = plt.helBlue,
      accent4 = plt.fg_light,
      accent5 = plt.deadIce,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.hvergelmirFrost,
      rainbow2 = plt.corpselight,
      rainbow3 = plt.helBlue,
      rainbow4 = plt.rotViolet,
      rainbow5 = plt.deadIce,
      rainbow6 = plt.nidhoggrRed,
      rainbow7 = plt.serpentGreen,
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
      bg_search = plt.corpselight,
      bg_visual = plt.elivagarMist,

      bg_statusline = plt.bg_light,
      border = plt.bg_alt1,

      header1 = plt.hvergelmirFrost,
      header2 = plt.corpselight,
      special = plt.deadIce,

      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,

      win_separator = plt.helBlue,

      indent = plt.bg_light,
      indent_scope = plt.hvergelmirFrost,

      picker = plt.helBlue,

      yank = plt.corpselight,
      mark = plt.rotViolet,

      scrollbar = plt.bg_lighter,

      selection = plt.elivagarMist,

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
        fg_alternate = plt.hvergelmirFrost,

        indicator = plt.corpselight,
      },
    },

    syn = {
      attribute = plt.deadIce,
      boolean = plt.rotViolet,
      comment = plt.naglfariGrey,
      constant = plt.helBlue,
      deprecated = plt.fg_dark,

      func = plt.corpselight,
      identifier = plt.fg_light,
      keyword = plt.hvergelmirFrost,

      method = plt.corpselight,
      number = plt.deadIce,
      operator = plt.bonePale,
      parameter = plt.serpentGreen,

      preproc = plt.nidhoggrRed,

      punct = plt.fg_mid,
      regex = plt.rotViolet,

      special = plt.deadIce,
      special2 = plt.nidhoggrRed,
      special3 = plt.frostbite,

      statement = plt.hvergelmirFrost,

      string = plt.serpentGreen,
      symbol = plt.bonePale,
      type = plt.helBlue,

      variable = plt.fg_light,
      annotation = plt.mistVeil,
    },

    diag = {
      error = plt.nidhoggrRed,
      warning = plt.deadIce,
      info = plt.helBlue,
      ok = plt.corpselight,
      hint = plt.hvergelmirFrost,

      virtual_text_error = plt.nidhoggrRed,
      virtual_text_warning = plt.deadIce,
      virtual_text_info = plt.helBlue,
      virtual_text_ok = plt.corpselight,
      virtual_text_hint = plt.hvergelmirFrost,
    },

    diff = {
      add = plt.corpselight,
      add_inline = plt.serpentGreen,

      change = plt.helBlue,
      change_inline = plt.rotViolet,

      delete = plt.nidhoggrRed,
      delete_inline = plt.deadIce,

      text = plt.corpselight,
    },

    vcs = {
      added = plt.corpselight,
      changed = plt.helBlue,
      removed = plt.nidhoggrRed,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.nidhoggrRed,
      green = plt.corpselight,
      yellow = plt.deadIce,
      blue = plt.helBlue,
      magenta = plt.rotViolet,
      cyan = plt.hvergelmirFrost,
      white = plt.fg_light,

      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color(plt.nidhoggrRed):brighten(0.2):to_hex(),
      green_bright = color(plt.corpselight):brighten(0.15):to_hex(),
      yellow_bright = color(plt.deadIce):brighten(0.15):to_hex(),
      blue_bright = color(plt.helBlue):brighten(0.15):to_hex(),
      magenta_bright = color(plt.rotViolet):brighten(0.2):to_hex(),
      cyan_bright = color(plt.hvergelmirFrost):brighten(0.15):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.15):to_hex(),

      indexed1 = plt.frostbite,
      indexed2 = plt.naglfariGrey,
    },
  }
end

return {
  name = "Niflheimr – Realm of Mist and Ice",
  author = "PrismPunk",
  description = "The primordial world of cold, mist, and the dead. Niflheimr is the frozen "
    .. "counterpart to Múspellsheimr — the dark northern void where eleven poisoned rivers "
    .. "of Élivágar flow from the well Hvergelmir, where Níðhöggr gnaws at the roots of "
    .. "Yggdrasil, and where the dead who did not fall in battle drift through endless fog. "
    .. "The palette is drawn from the deepest polar abysses: near-black backgrounds like "
    .. "the lightless depths beneath the world-tree, frost blues cold enough to crack bone, "
    .. "the sickly green corpselight that flickers over the dead, and the pale bone-white "
    .. "of things long buried in ice. Hel's domain bleeds through in muted violet, while "
    .. "Níðhöggr's presence stains the edges in dull, venomous red. Mist hangs over "
    .. "everything — the Élivágar fog that blurs the boundary between the living and the "
    .. "forgotten. This is where the Ginnungagap began to fill with rime, where frost met "
    .. "fire and the first giant Ymir took shape from the thaw.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,

    base08 = palette.nidhoggrRed,
    base09 = palette.deadIce,
    base0A = palette.corpselight,
    base0B = palette.serpentGreen,
    base0C = palette.hvergelmirFrost,
    base0D = palette.helBlue,
    base0E = palette.rotViolet,
    base0F = palette.naglfariGrey,
  },

  palette = palette,
  get = M.get,
}
