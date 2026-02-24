local color = require("prismpunk.utils.color")

local palette = -- prismpunk/palettes/dc/justice-league/cyborg.lua
return {
  bg_darkest = "#0C0F17",
  bg_darker = "#12151E",
  bg_dark = "#181C28",
  bg_mid = "#202432",
  bg_light = "#2D3344",
  bg_lighter = "#414A5E",
  bg_lightest = "#59677F",

  fg_lightest = "#E8F0FF",
  fg_light = "#C8D8F0",
  fg_mid = "#889BB8",
  fg_dark = "#566A88",

  bg_alt1 = "#11141C",
  bg_alt2 = "#090B11",
  bg_alt3 = "#151924",
  bg_alt4 = "#0F121A",

  -- CYBORG: THE TRUE MACHINE GOD PALETTE
  humanHeart = "#FF1E56", -- defiant, bleeding red
  heartSurge = "#FF4D7E",
  motherboxViolet = "#C13CFF",
  boomtubeMagenta = "#E65AFF",
  circuitCyan = "#00F5FF",
  neonGrid = "#00FFD0",
  titaniumSteel = "#A8C0E0",
  apokolipsGold = "#FF8C1A",
  warningAmber = "#FFAA33",
  neuralTeal = "#00E6C0",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.circuitCyan,
      insert = plt.neonGrid,
      visual = plt.humanHeart,
      replace = plt.heartSurge,
      command = plt.apokolipsGold,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_dark,
      fg_dark = plt.bg_lightest,
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
      bg_search = plt.boomtubeMagenta,
      bg_visual = plt.motherboxViolet,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.apokolipsGold,
      header2 = plt.humanHeart,
      special = plt.neonGrid,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.circuitCyan,
      indent = plt.bg_lighter,
      indent_scope = plt.circuitCyan,
      picker = plt.humanHeart,
      yank = plt.apokolipsGold,
      mark = plt.neonGrid,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.apokolipsGold,
        bg_alternate = plt.bg_darkest,
        indicator = plt.circuitCyan,
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
      accent1 = plt.apokolipsGold,
      accent2 = plt.circuitCyan,
      accent3 = plt.neonGrid,
      accent4 = plt.humanHeart,
      accent5 = plt.motherboxViolet,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.apokolipsGold,
      rainbow2 = plt.circuitCyan,
      rainbow3 = plt.humanHeart,
      rainbow4 = plt.neonGrid,
      rainbow5 = plt.motherboxViolet,
      rainbow6 = plt.boomtubeMagenta,
      rainbow7 = plt.warningAmber,
    },

    syn = {
      attribute = plt.warningAmber,
      boolean = plt.neonGrid,
      comment = plt.fg_dark,
      constant = plt.humanHeart,
      deprecated = plt.fg_mid,
      func = plt.circuitCyan,
      identifier = plt.fg_lightest,
      keyword = plt.motherboxViolet,
      method = plt.boomtubeMagenta,
      number = plt.apokolipsGold,
      operator = plt.neonGrid,
      parameter = plt.fg_mid,
      preproc = plt.motherboxViolet,
      punct = plt.fg_mid,
      regex = plt.warningAmber,
      statement = plt.motherboxViolet,
      string = plt.neuralTeal,
      symbol = plt.neonGrid,
      type = plt.titaniumSteel,
      variable = plt.fg_lightest,
      special = plt.warningAmber,
      special2 = plt.humanHeart,
      special3 = plt.circuitCyan,
    },

    vcs = {
      added = plt.neonGrid,
      removed = plt.humanHeart,
      changed = plt.apokolipsGold,
    },

    diff = {
      add = plt.neonGrid,
      change = plt.apokolipsGold,
      delete = plt.humanHeart,
      text = plt.motherboxViolet,
    },

    diag = {
      ok = plt.neonGrid,
      error = plt.heartSurge,
      warning = plt.warningAmber,
      info = plt.circuitCyan,
      hint = plt.neonGrid,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.humanHeart,
      green = plt.neonGrid,
      yellow = plt.apokolipsGold,
      blue = plt.circuitCyan,
      magenta = plt.motherboxViolet,
      cyan = plt.neonGrid,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.humanHeart):brighten(0.2):to_hex(),
      green_bright = color(plt.neonGrid):brighten(0.1):to_hex(),
      yellow_bright = color(plt.apokolipsGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.circuitCyan):brighten(0.3):to_hex(),
      magenta_bright = color(plt.motherboxViolet):brighten(0.2):to_hex(),
      cyan_bright = color(plt.neonGrid):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.apokolipsGold,
      indexed2 = plt.humanHeart,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.heartSurge,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.circuitCyan,
      ["@comment.note"] = plt.neonGrid,

      ["@constant"] = plt.humanHeart,
      ["@constant.builtin"] = plt.humanHeart,
      ["@constant.macro"] = plt.warningAmber,

      ["@string"] = plt.neuralTeal,
      ["@string.documentation"] = plt.neuralTeal,
      ["@string.regex"] = plt.warningAmber,
      ["@string.escape"] = plt.apokolipsGold,
      ["@string.special"] = plt.neonGrid,
      ["@string.special.symbol"] = plt.neonGrid,
      ["@string.special.url"] = plt.motherboxViolet,
      ["@string.special.path"] = plt.neuralTeal,

      ["@character"] = plt.neuralTeal,
      ["@character.special"] = plt.apokolipsGold,

      ["@number"] = plt.apokolipsGold,
      ["@number.float"] = plt.apokolipsGold,

      ["@boolean"] = plt.neonGrid,

      ["@function"] = plt.circuitCyan,
      ["@function.builtin"] = plt.circuitCyan,
      ["@function.call"] = plt.circuitCyan,
      ["@function.macro"] = plt.boomtubeMagenta,
      ["@function.method"] = plt.boomtubeMagenta,
      ["@function.method.call"] = plt.boomtubeMagenta,

      ["@constructor"] = plt.titaniumSteel,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.motherboxViolet,
      ["@keyword.coroutine"] = plt.boomtubeMagenta,
      ["@keyword.function"] = plt.motherboxViolet,
      ["@keyword.operator"] = plt.neonGrid,
      ["@keyword.return"] = plt.motherboxViolet,
      ["@keyword.import"] = plt.circuitCyan,
      ["@keyword.storage"] = plt.motherboxViolet,
      ["@keyword.repeat"] = plt.motherboxViolet,
      ["@keyword.conditional"] = plt.motherboxViolet,
      ["@keyword.exception"] = plt.motherboxViolet,
      ["@keyword.directive"] = plt.circuitCyan,
      ["@keyword.directive.define"] = plt.circuitCyan,

      ["@conditional"] = plt.motherboxViolet,
      ["@conditional.ternary"] = plt.motherboxViolet,

      ["@repeat"] = plt.motherboxViolet,

      ["@label"] = plt.boomtubeMagenta,

      ["@operator"] = plt.neonGrid,

      ["@exception"] = plt.motherboxViolet,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.boomtubeMagenta,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.titaniumSteel,
      ["@type.builtin"] = plt.titaniumSteel,
      ["@type.definition"] = plt.titaniumSteel,
      ["@type.qualifier"] = plt.motherboxViolet,

      ["@attribute"] = plt.warningAmber,
      ["@attribute.builtin"] = plt.apokolipsGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.titaniumSteel,
      ["@module.builtin"] = plt.titaniumSteel,

      ["@namespace"] = plt.titaniumSteel,
      ["@namespace.builtin"] = plt.titaniumSteel,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.neonGrid,

      ["@tag"] = plt.motherboxViolet,
      ["@tag.attribute"] = plt.warningAmber,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.motherboxViolet,

      ["@markup.strong"] = { fg = plt.apokolipsGold, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.neonGrid, underline = true },
      ["@markup.heading"] = plt.apokolipsGold,
      ["@markup.heading.1"] = plt.apokolipsGold,
      ["@markup.heading.2"] = plt.humanHeart,
      ["@markup.heading.3"] = plt.motherboxViolet,
      ["@markup.heading.4"] = plt.circuitCyan,
      ["@markup.heading.5"] = plt.neonGrid,
      ["@markup.heading.6"] = plt.boomtubeMagenta,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.neonGrid,
      ["@markup.link"] = plt.motherboxViolet,
      ["@markup.link.label"] = plt.neonGrid,
      ["@markup.link.url"] = plt.motherboxViolet,
      ["@markup.raw"] = plt.neuralTeal,
      ["@markup.raw.block"] = plt.neuralTeal,
      ["@markup.list"] = plt.motherboxViolet,
      ["@markup.list.checked"] = plt.neonGrid,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.neonGrid,
      ["@diff.minus"] = plt.humanHeart,
      ["@diff.delta"] = plt.apokolipsGold,

      ["@none"] = "none",
      ["@conceal"] = plt.boomtubeMagenta,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",
    },

    lsp = {
      ["@lsp.type.class"] = plt.titaniumSteel,
      ["@lsp.type.interface"] = plt.titaniumSteel,
      ["@lsp.type.struct"] = plt.titaniumSteel,
      ["@lsp.type.enum"] = plt.titaniumSteel,
      ["@lsp.type.enumMember"] = plt.humanHeart,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.titaniumSteel,

      ["@lsp.type.macro"] = plt.warningAmber,
      ["@lsp.type.decorator"] = plt.titaniumSteel,

      ["@lsp.type.builtinType"] = plt.titaniumSteel,
      ["@lsp.type.selfParameter"] = plt.boomtubeMagenta,
      ["@lsp.type.typeParameter"] = plt.titaniumSteel,

      ["@lsp.type.array"] = plt.titaniumSteel,
      ["@lsp.type.object"] = plt.titaniumSteel,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.humanHeart,
      ["@lsp.type.enumConstant"] = plt.humanHeart,

      ["@lsp.type.event"] = plt.titaniumSteel,
      ["@lsp.type.regexp"] = plt.warningAmber,
      ["@lsp.type.unresolvedReference"] = plt.apokolipsGold,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.humanHeart,
      ["@lsp.mod.async"] = plt.motherboxViolet,
      ["@lsp.mod.static"] = plt.boomtubeMagenta,
      ["@lsp.mod.abstract"] = plt.titaniumSteel,
      ["@lsp.mod.defaultLibrary"] = plt.titaniumSteel,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Justice League – Cyborg",
  author = "PrismPunk.nvim",
  description = "Half man. Half machine. Full hero. Titanium, Mother Box violet, "
    .. "and a heart that refuses to be silenced.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.humanHeart,
    base09 = palette.apokolipsGold,
    base0A = palette.circuitCyan,
    base0B = palette.neonGrid,
    base0C = palette.neonGrid,
    base0D = palette.circuitCyan,
    base0E = palette.motherboxViolet,
    base0F = palette.warningAmber,
  },

  palette = palette,
  get = M.get,
}
