local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0a0604",
  bg_darker = "#140d08",
  bg_dark = "#1f140d",
  bg_mid = "#2a1c13",
  bg_light = "#36241a",
  bg_lighter = "#422d21",
  bg_lightest = "#4f3629",
  bg_alt1 = "#5c3f31",
  bg_alt2 = "#69483a",
  bg_alt3 = "#765143",
  bg_alt4 = "#835a4c",
  fg_darkest = "#fef9f0",
  fg_dark = "#fdf5e6",
  fg_mid = "#fcf0db",
  fg_light = "#faebd0",
  fg_lighter = "#f8e5c4",
  fg_lightest = "#f5dfb8",
  meadHall = "#d4a574",
  honeyedWord = "#c19a6b",
  runicTongue = "#8b4513",
  skaldSong = "#cd853f",
  verseFlow = "#deb887",
  eddaInk = "#a0826d",
  harpWood = "#8b7355",
  bragaCup = "#b8860b",
  oathSworn = "#d2691e",
  kvasirBlood = "#a0522d",
  poeticMadness = "#bc8f8f",
  immortalVerse = "#fffef8",
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
      normal = plt.meadHall,
      insert = plt.bragaCup,
      visual = plt.skaldSong,
      replace = plt.poeticMadness,
      command = plt.verseFlow,
    },
    accent = {
      accent1 = plt.meadHall,
      accent2 = plt.bragaCup,
      accent3 = plt.skaldSong,
      accent4 = plt.oathSworn,
      accent5 = plt.kvasirBlood,
      invert = plt.bg_darkest,
    },
    rainbow = {
      rainbow1 = plt.kvasirBlood,
      rainbow2 = plt.oathSworn,
      rainbow3 = plt.bragaCup,
      rainbow4 = plt.skaldSong,
      rainbow5 = plt.verseFlow,
      rainbow6 = plt.honeyedWord,
      rainbow7 = plt.poeticMadness,
    },
    ui = {
      fg = plt.fg_darkest,
      fg_dim = plt.fg_dark,
      fg_dimmer = plt.fg_mid,
      fg_dark = plt.fg_light,
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
      bg_search = plt.bragaCup,
      bg_visual = plt.bg_light,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt1,
      header1 = plt.meadHall,
      header2 = plt.bragaCup,
      special = plt.skaldSong,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_alt2,
      win_separator = plt.oathSworn,
      indent = plt.bg_light,
      indent_scope = plt.meadHall,
      picker = plt.poeticMadness,
      yank = plt.bragaCup,
      mark = plt.meadHall,
      scrollbar = plt.bg_lighter,
      selection = plt.bg_light,
      line_nr = plt.bg_alt3,
      line_nr_dim = plt.bg_lighter,
      line_nr_active = plt.bragaCup,
      float = {
        fg = plt.fg_dark,
        bg = plt.bg_mid,
        fg_border = plt.oathSworn,
        bg_border = plt.bg_mid,
      },
      pmenu = {
        fg = plt.fg_dark,
        fg_sel = "none",
        fg_border = plt.bg_alt2,
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
        fg_inactive = plt.bg_alt3,
        fg_selected = plt.fg_dark,
        fg_alternate = plt.meadHall,
        indicator = plt.bragaCup,
      },
    },
    syn = {
      attribute = plt.bragaCup,
      boolean = plt.poeticMadness,
      comment = plt.bg_alt2,
      constant = plt.oathSworn,
      deprecated = plt.bg_alt3,
      func = plt.verseFlow,
      identifier = plt.fg_dark,
      keyword = plt.meadHall,
      method = plt.verseFlow,
      number = plt.bragaCup,
      operator = plt.fg_lighter,
      parameter = plt.fg_mid,
      preproc = plt.skaldSong,
      punct = plt.fg_light,
      regex = plt.eddaInk,
      special = plt.poeticMadness,
      special2 = plt.honeyedWord,
      special3 = plt.immortalVerse,
      statement = plt.kvasirBlood,
      string = plt.runicTongue,
      symbol = plt.harpWood,
      type = plt.fg_dark,
      variable = plt.fg_dark,
    },
    diag = {
      error = plt.kvasirBlood,
      warning = plt.oathSworn,
      info = plt.meadHall,
      ok = plt.verseFlow,
      hint = plt.skaldSong,
      virtual_text_error = plt.kvasirBlood,
      virtual_text_warning = plt.oathSworn,
      virtual_text_info = plt.meadHall,
      virtual_text_ok = plt.verseFlow,
      virtual_text_hint = plt.skaldSong,
    },
    diff = {
      add = plt.verseFlow,
      add_inline = plt.honeyedWord,
      change = plt.bragaCup,
      change_inline = plt.oathSworn,
      delete = plt.kvasirBlood,
      delete_inline = plt.poeticMadness,
      text = plt.meadHall,
    },
    vcs = {
      added = plt.verseFlow,
      changed = plt.bragaCup,
      removed = plt.kvasirBlood,
    },
    term = {
      black = plt.bg_darkest,
      red = plt.kvasirBlood,
      green = plt.verseFlow,
      yellow = plt.bragaCup,
      blue = plt.meadHall,
      magenta = plt.poeticMadness,
      cyan = plt.skaldSong,
      white = plt.fg_darkest,
      black_bright = color(plt.bg_darkest):brighten(0.3):to_hex(),
      red_bright = color(plt.kvasirBlood):brighten(0.2):to_hex(),
      green_bright = color(plt.verseFlow):brighten(0.2):to_hex(),
      yellow_bright = color(plt.bragaCup):brighten(0.1):to_hex(),
      blue_bright = color(plt.meadHall):brighten(0.1):to_hex(),
      magenta_bright = color(plt.poeticMadness):brighten(0.2):to_hex(),
      cyan_bright = color(plt.skaldSong):brighten(0.1):to_hex(),
      white_bright = plt.immortalVerse,
      indexed1 = plt.honeyedWord,
      indexed2 = plt.eddaInk,
    },
  }
end

return {
  name = "Asgard – Bragi",
  author = "PrismPunk",
  description = "God of Poetry — warm browns, runic earth, honeyed words, rosy madness, "
    .. "the mead hall's wooden warmth. "
    .. "Bragi is the silver-tongued, the first skald, god of poetry and eloquence. His "
    .. "tongue is carved with runes and his words drip like honey from the comb. He sits "
    .. "in Valhalla and welcomes the slain with verse, turning their deaths into glory "
    .. "and their suffering into song. His wife is Iðunn, keeper of the golden apples, "
    .. "and together they are art and life — the voice that gives meaning to immortality. "
    .. "The skalds invoked Bragi before every recitation, asking that their words flow "
    .. "like mead from Óðrerir, the cauldron brewed from Kvasir's blood — for true "
    .. "poetry is divine madness, the breath of Odin himself. The bragafull, the "
    .. "toasting cup, bears his name: men swore oaths over it and drank deeply before "
    .. "speaking truths that could not be unsaid. This palette is the wooden mead hall "
    .. "itself — deep brown-black backgrounds like old timber and shadow, rising through "
    .. "warm earth tones and tans. Keywords are the color of the hall's worn wood, "
    .. "functions flow like burlywood verse, strings are deep saddle brown like runic "
    .. "carvings, and rosy-brown `poeticMadness` brings the flush of divine inspiration. "
    .. "Dark gold `bragaCup` and burnt sienna `oathSworn` add warmth without the bright "
    .. "orange-gold of Jotunheim. This is earthier, woodier, warmer — the poet's hearth, "
    .. "not the giant's forge.",
  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.bg_alt2,
    base05 = palette.fg_mid,
    base06 = palette.fg_dark,
    base07 = palette.fg_darkest,
    base08 = palette.kvasirBlood,
    base09 = palette.oathSworn,
    base0A = palette.bragaCup,
    base0B = palette.verseFlow,
    base0C = palette.skaldSong,
    base0D = palette.meadHall,
    base0E = palette.poeticMadness,
    base0F = palette.runicTongue,
  },
  palette = palette,
  get = M.get,
}
