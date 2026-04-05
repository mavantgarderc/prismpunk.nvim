local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#f8f4ee",
  bg_darker = "#f2ede6",
  bg_dark = "#ebe5dc",
  bg_mid = "#e4ddd2",
  bg_light = "#dbd3c6",
  bg_lighter = "#d2c9ba",
  bg_lightest = "#c8beae",
  bg_alt1 = "#beb4a2",
  bg_alt2 = "#b4aa96",
  bg_alt3 = "#aaa08a",
  bg_alt4 = "#a0967e",

  fg_lightest = "#2a2520",
  fg_light = "#3e3830",
  fg_mid = "#6a6258",
  fg_dark = "#968c7e",

  ljosalfar = "#5a8a50",
  sunweave = "#c49028",
  dawnpetal = "#c86880",
  skybloom = "#4878b0",
  honeydew = "#88a840",
  freyrGold = "#b89030",
  idunnApple = "#d07040",
  bifrostShimmer = "#7868b0",
  meadowDeep = "#3a7a58",
  pollenDust = "#c8a040",
  silkMoth = "#9878a8",
  morningMist = "#8898b0",
  warmBark = "#8a7260",
  heartwood = "#6a5a48",
  petalWhite = "#faf6f0",
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
      normal = plt.skybloom,
      insert = plt.ljosalfar,
      visual = plt.bifrostShimmer,
      replace = plt.idunnApple,
      command = plt.sunweave,
    },

    accent = {
      accent1 = plt.skybloom,
      accent2 = plt.ljosalfar,
      accent3 = plt.sunweave,
      accent4 = plt.fg_light,
      accent5 = plt.dawnpetal,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.skybloom,
      rainbow2 = plt.ljosalfar,
      rainbow3 = plt.sunweave,
      rainbow4 = plt.bifrostShimmer,
      rainbow5 = plt.dawnpetal,
      rainbow6 = plt.idunnApple,
      rainbow7 = plt.meadowDeep,
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
      bg_search = plt.pollenDust,
      bg_visual = plt.petalWhite,

      bg_statusline = plt.bg_light,
      border = plt.bg_alt1,

      header1 = plt.skybloom,
      header2 = plt.ljosalfar,
      special = plt.freyrGold,

      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,

      win_separator = plt.morningMist,

      indent = plt.bg_light,
      indent_scope = plt.skybloom,

      picker = plt.sunweave,

      yank = plt.pollenDust,
      mark = plt.bifrostShimmer,

      scrollbar = plt.bg_lighter,

      selection = plt.petalWhite,

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
        fg_alternate = plt.skybloom,

        indicator = plt.ljosalfar,
      },
    },

    syn = {
      attribute = plt.sunweave,
      boolean = plt.bifrostShimmer,
      comment = plt.warmBark,
      constant = plt.skybloom,
      deprecated = plt.fg_dark,

      func = plt.ljosalfar,
      identifier = plt.fg_light,
      keyword = plt.dawnpetal,

      method = plt.ljosalfar,
      number = plt.freyrGold,
      operator = plt.heartwood,
      parameter = plt.meadowDeep,

      preproc = plt.idunnApple,

      punct = plt.fg_mid,
      regex = plt.bifrostShimmer,

      special = plt.freyrGold,
      special2 = plt.idunnApple,
      special3 = plt.pollenDust,

      statement = plt.dawnpetal,

      string = plt.meadowDeep,
      symbol = plt.morningMist,
      type = plt.skybloom,

      variable = plt.fg_light,
      annotation = plt.silkMoth,
    },

    diag = {
      error = plt.idunnApple,
      warning = plt.sunweave,
      info = plt.skybloom,
      ok = plt.ljosalfar,
      hint = plt.morningMist,

      virtual_text_error = plt.idunnApple,
      virtual_text_warning = plt.sunweave,
      virtual_text_info = plt.skybloom,
      virtual_text_ok = plt.ljosalfar,
      virtual_text_hint = plt.morningMist,
    },

    diff = {
      add = plt.ljosalfar,
      add_inline = plt.honeydew,

      change = plt.skybloom,
      change_inline = plt.bifrostShimmer,

      delete = plt.idunnApple,
      delete_inline = plt.dawnpetal,

      text = plt.sunweave,
    },

    vcs = {
      added = plt.ljosalfar,
      changed = plt.skybloom,
      removed = plt.idunnApple,
    },

    term = {
      black = plt.fg_lightest,
      red = plt.idunnApple,
      green = plt.ljosalfar,
      yellow = plt.sunweave,
      blue = plt.skybloom,
      magenta = plt.bifrostShimmer,
      cyan = plt.meadowDeep,
      white = plt.bg_darkest,

      black_bright = color(plt.fg_lightest):brighten(0.3):to_hex(),
      red_bright = color(plt.idunnApple):brighten(-0.15):to_hex(),
      green_bright = color(plt.ljosalfar):brighten(-0.15):to_hex(),
      yellow_bright = color(plt.sunweave):brighten(-0.15):to_hex(),
      blue_bright = color(plt.skybloom):brighten(-0.15):to_hex(),
      magenta_bright = color(plt.bifrostShimmer):brighten(-0.15):to_hex(),
      cyan_bright = color(plt.meadowDeep):brighten(-0.15):to_hex(),
      white_bright = color(plt.bg_darkest):brighten(-0.1):to_hex(),

      indexed1 = plt.dawnpetal,
      indexed2 = plt.silkMoth,
    },
  }
end

return {
  name = "Álfheimr – Realm of the Light Elves",
  author = "PrismPunk",
  description = "The luminous homeland of the Ljósálfar, the light elves who dwell in the "
    .. "highest branches of Yggdrasil, closer to the sun than any other realm. Álfheimr is "
    .. "a world of eternal golden morning — sunlight filtering through ancient canopies, "
    .. "meadows heavy with pollen and wildflowers, orchards where Iðunn's golden apples "
    .. "ripen in perpetual warmth. The Ljósálfar are beings of radiance and subtle magic, "
    .. "weavers of light and growth, allies of the Vanir god Freyr who rules this realm. "
    .. "This is PrismPunk's only light theme: a warm, parchment-toned background evoking "
    .. "sun-bleached linen and birch bark, with syntax drawn from the greens of deep "
    .. "meadows and forest canopy, the rose of dawn petals, the blue of open sky, and "
    .. "the gold of harvest and honey. Bifröst's violet shimmer threads through as accent, "
    .. "while morning mist softens the edges. It is a theme of clarity, craft, and the "
    .. "quiet, persistent magic of living things.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,

    base08 = palette.idunnApple,
    base09 = palette.sunweave,
    base0A = palette.pollenDust,
    base0B = palette.ljosalfar,
    base0C = palette.meadowDeep,
    base0D = palette.skybloom,
    base0E = palette.bifrostShimmer,
    base0F = palette.dawnpetal,
  },

  palette = palette,
  get = M.get,
}
