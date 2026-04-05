local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#1a100c",
  bg_darker = "#221612",
  bg_dark = "#2a1c16",
  bg_mid = "#34241e",
  bg_light = "#3e2c24",
  bg_lighter = "#48362e",
  bg_lightest = "#524038",
  bg_alt1 = "#5c4a42",
  bg_alt2 = "#66544c",
  bg_alt3 = "#705e56",
  bg_alt4 = "#7a6860",

  fg_lightest = "#f4e6da",
  fg_light = "#dcc8b6",
  fg_mid = "#b09888",
  fg_dark = "#7e685a",

  surtrFlame = "#e86830",
  lavaCore = "#d44a2a",
  emberGold = "#e8b040",
  magmaOrange = "#d88a38",
  ashSmoke = "#8a7e76",
  cinder = "#c85a3a",
  obsidian = "#3c2e28",
  infernoYellow = "#ecd060",
  moltenSteel = "#cc9060",
  scorchedEarth = "#7a5840",
  fireGiantRed = "#b83a2e",
  ragnarokViolet = "#a86898",
  coalBed = "#2e1e18",
  sparkWhite = "#f0d8c0",
  volcanicVent = "#d06848",
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
      normal = plt.surtrFlame,
      insert = plt.emberGold,
      visual = plt.ragnarokViolet,
      replace = plt.fireGiantRed,
      command = plt.magmaOrange,
    },

    accent = {
      accent1 = plt.surtrFlame,
      accent2 = plt.emberGold,
      accent3 = plt.lavaCore,
      accent4 = plt.fg_light,
      accent5 = plt.magmaOrange,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.surtrFlame,
      rainbow2 = plt.emberGold,
      rainbow3 = plt.lavaCore,
      rainbow4 = plt.ragnarokViolet,
      rainbow5 = plt.magmaOrange,
      rainbow6 = plt.fireGiantRed,
      rainbow7 = plt.infernoYellow,
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
      bg_search = plt.emberGold,
      bg_visual = plt.coalBed,

      bg_statusline = plt.bg_light,
      border = plt.bg_alt1,

      header1 = plt.surtrFlame,
      header2 = plt.emberGold,
      special = plt.infernoYellow,

      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,

      win_separator = plt.lavaCore,

      indent = plt.bg_light,
      indent_scope = plt.surtrFlame,

      picker = plt.lavaCore,

      yank = plt.emberGold,
      mark = plt.ragnarokViolet,

      scrollbar = plt.bg_lighter,

      selection = plt.coalBed,

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
        fg_alternate = plt.surtrFlame,

        indicator = plt.emberGold,
      },
    },

    syn = {
      attribute = plt.magmaOrange,
      boolean = plt.ragnarokViolet,
      comment = plt.ashSmoke,
      constant = plt.lavaCore,
      deprecated = plt.fg_dark,

      func = plt.emberGold,
      identifier = plt.fg_light,
      keyword = plt.surtrFlame,

      method = plt.emberGold,
      number = plt.infernoYellow,
      operator = plt.moltenSteel,
      parameter = plt.magmaOrange,

      preproc = plt.fireGiantRed,

      punct = plt.fg_mid,
      regex = plt.ragnarokViolet,

      special = plt.infernoYellow,
      special2 = plt.fireGiantRed,
      special3 = plt.sparkWhite,

      statement = plt.surtrFlame,

      string = plt.moltenSteel,
      symbol = plt.sparkWhite,
      type = plt.lavaCore,

      variable = plt.fg_light,
      annotation = plt.volcanicVent,
    },

    diag = {
      error = plt.fireGiantRed,
      warning = plt.emberGold,
      info = plt.lavaCore,
      ok = plt.infernoYellow,
      hint = plt.magmaOrange,

      virtual_text_error = plt.fireGiantRed,
      virtual_text_warning = plt.emberGold,
      virtual_text_info = plt.lavaCore,
      virtual_text_ok = plt.infernoYellow,
      virtual_text_hint = plt.magmaOrange,
    },

    diff = {
      add = plt.infernoYellow,
      add_inline = plt.emberGold,

      change = plt.magmaOrange,
      change_inline = plt.ragnarokViolet,

      delete = plt.fireGiantRed,
      delete_inline = plt.lavaCore,

      text = plt.emberGold,
    },

    vcs = {
      added = plt.infernoYellow,
      changed = plt.magmaOrange,
      removed = plt.fireGiantRed,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.fireGiantRed,
      green = plt.infernoYellow,
      yellow = plt.emberGold,
      blue = plt.lavaCore,
      magenta = plt.ragnarokViolet,
      cyan = plt.surtrFlame,
      white = plt.fg_light,

      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color(plt.fireGiantRed):brighten(0.2):to_hex(),
      green_bright = color(plt.infernoYellow):brighten(0.15):to_hex(),
      yellow_bright = color(plt.emberGold):brighten(0.15):to_hex(),
      blue_bright = color(plt.lavaCore):brighten(0.15):to_hex(),
      magenta_bright = color(plt.ragnarokViolet):brighten(0.2):to_hex(),
      cyan_bright = color(plt.surtrFlame):brighten(0.15):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.15):to_hex(),

      indexed1 = plt.sparkWhite,
      indexed2 = plt.moltenSteel,
    },
  }
end

return {
  name = "Múspellsheimr – Realm of Fire",
  author = "PrismPunk",
  description = "The primordial land of fire that burns at the southern edge of the void. "
    .. "Múspellsheimr is the scorching domain of Surtr, the fire giant who guards its "
    .. "borders with a flaming sword and whose destiny is to set the world ablaze at "
    .. "Ragnarök. Here rivers of magma carve through obsidian plains, volcanic vents "
    .. "belch sulfur and spark into perpetual twilight, and the air itself shimmers with "
    .. "unbearable heat. The palette is forged from the deep charred blacks of cooled "
    .. "lava fields, the incandescent oranges and golds of molten rock, the angry reds "
    .. "of fire giant war-paint, and the rare violet glow of Ragnarök's prophecy burning "
    .. "at the horizon. Ember gold and inferno yellow illuminate the darkness like cracks "
    .. "in the earth's crust, while ash smoke greys drift through every shadow. This is "
    .. "the realm where creation began — the sparks that flew from Múspellsheimr into "
    .. "the Ginnungagap met the ice of Niflheimr, and from that collision, the world was born.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,

    base08 = palette.fireGiantRed,
    base09 = palette.magmaOrange,
    base0A = palette.emberGold,
    base0B = palette.infernoYellow,
    base0C = palette.surtrFlame,
    base0D = palette.lavaCore,
    base0E = palette.ragnarokViolet,
    base0F = palette.moltenSteel,
  },

  palette = palette,
  get = M.get,
}
