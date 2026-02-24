local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0802",
  bg_darker = "#14110A",
  bg_dark = "#1E1A12",
  bg_mid = "#28231A",
  bg_light = "#322C22",
  bg_lighter = "#3C362A",
  bg_lightest = "#464032",

  fg_lightest = "#FFF8E8",
  fg_light = "#E8DCC8",
  fg_mid = "#C0B098",
  fg_dark = "#98886F",

  bg_alt1 = "#181410",
  bg_alt2 = "#0D0B06",
  bg_alt3 = "#221E16",
  bg_alt4 = "#100E0A",

  willLoud = "#00FF66",
  willBrash = "#00FF77",
  willIntense = "#00FF88",
  willPunch = "#00E65C",
  willGrit = "#00CC52",

  attitudeGreen = "#00EE66",
  rebelGreen = "#11FF77",
  inYourFace = "#22FF88",
  streetGreen = "#00D459",
  brawlerGreen = "#00BA4D",

  hotheadOrange = "#FF6B35",
  rageRed = "#FF4433",
  aggression = "#FF5544",
  temper = "#E85030",
  fury = "#CC3D22",

  cockyGold = "#FFD700",
  arrogantYellow = "#FFDD33",
  flashyAmber = "#FFE566",
  swaggerGold = "#FFC700",
  boldYellow = "#FFB800",

  streetBlue = "#00D4FF",
  brawlerCyan = "#00E0FF",
  punchBlue = "#33EAFF",
  fightTeal = "#00BCD4",
  urbanCyan = "#00A3C4",

  constructSharp = "#00FFA8",
  constructEdge = "#00FF99",
  constructBlade = "#00FF8A",
  constructHard = "#00E690",
  constructSteel = "#00CC7D",

  rebelYellow = "#FFEB3B",
  defiantGold = "#FFF176",
  loudAmber = "#FFF59D",
  chipYellow = "#FFE54C",
  attitudeAmber = "#FFDD2D",

  clashRed = "#F44336",
  argumentOrange = "#FF7043",
  conflictCoral = "#FF8A65",

  barBrown = "#6D4C41",
  grittGray = "#78909C",
  streetGray = "#90A4AE",
  roughBrown = "#5D4037",
  toughGray = "#607D8B",

  victoryLoud = "#76FF03",
  winGreen = "#64DD17",
  triumphBright = "#8BC34A",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.willLoud,
      insert = plt.cockyGold,
      visual = plt.streetBlue,
      replace = plt.rageRed,
      command = plt.rebelYellow,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_mid,
      fg_dark = plt.fg_dark,
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
      bg_cursorline = plt.bg_dark,
      bg_cursorline_alt = plt.bg_mid,
      bg_search = plt.cockyGold,
      bg_visual = plt.streetBlue,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.willLoud,
      header2 = plt.cockyGold,
      special = plt.constructSharp,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.willLoud,
      indent = plt.bg_lighter,
      indent_scope = plt.willPunch,
      picker = plt.hotheadOrange,
      yank = plt.flashyAmber,
      mark = plt.streetBlue,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.willLoud,
        bg_alternate = plt.bg_darkest,
        indicator = plt.attitudeGreen,
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
        bg = plt.bg_darker,
        fg_border = plt.willGrit,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.willLoud,
      accent2 = plt.cockyGold,
      accent3 = plt.hotheadOrange,
      accent4 = plt.streetBlue,
      accent5 = plt.constructSharp,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.willLoud,
      rainbow2 = plt.cockyGold,
      rainbow3 = plt.hotheadOrange,
      rainbow4 = plt.streetBlue,
      rainbow5 = plt.constructSharp,
      rainbow6 = plt.rebelYellow,
      rainbow7 = plt.rageRed,
    },

    syn = {
      attribute = plt.cockyGold,
      boolean = plt.willLoud,
      comment = plt.fg_dark,
      constant = plt.streetGray,
      deprecated = plt.fg_mid,
      func = plt.streetBlue,
      identifier = plt.fg_lightest,
      keyword = plt.willLoud,
      method = plt.brawlerCyan,
      number = plt.swaggerGold,
      operator = plt.constructSharp,
      parameter = plt.fg_mid,
      preproc = plt.rebelYellow,
      punct = plt.fg_mid,
      regex = plt.constructEdge,
      statement = plt.willLoud,
      string = plt.attitudeGreen,
      symbol = plt.cockyGold,
      type = plt.cockyGold,
      variable = plt.fg_lightest,
      special = plt.hotheadOrange,
      special2 = plt.inYourFace,
      special3 = plt.punchBlue,
    },

    vcs = {
      added = plt.attitudeGreen,
      removed = plt.rageRed,
      changed = plt.cockyGold,
    },

    diff = {
      add = plt.attitudeGreen,
      change = plt.cockyGold,
      delete = plt.rageRed,
      text = plt.streetBlue,
    },

    diag = {
      ok = plt.victoryLoud,
      error = plt.rageRed,
      warning = plt.hotheadOrange,
      info = plt.fightTeal,
      hint = plt.rebelYellow,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.rageRed,
      green = plt.willLoud,
      yellow = plt.cockyGold,
      blue = plt.streetBlue,
      magenta = plt.hotheadOrange,
      cyan = plt.constructSharp,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.rageRed):brighten(0.2):to_hex(),
      green_bright = color(plt.willLoud):brighten(0.1):to_hex(),
      yellow_bright = color(plt.cockyGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.streetBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.hotheadOrange):brighten(0.2):to_hex(),
      cyan_bright = color(plt.constructSharp):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.cockyGold,
      indexed2 = plt.rageRed,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.rageRed,
      ["@comment.warning"] = plt.hotheadOrange,
      ["@comment.todo"] = plt.cockyGold,
      ["@comment.note"] = plt.streetBlue,

      ["@constant"] = plt.streetGray,
      ["@constant.builtin"] = plt.streetGray,
      ["@constant.macro"] = plt.cockyGold,

      ["@string"] = plt.attitudeGreen,
      ["@string.documentation"] = plt.attitudeGreen,
      ["@string.regex"] = plt.constructEdge,
      ["@string.escape"] = plt.rebelYellow,
      ["@string.special"] = plt.inYourFace,
      ["@string.special.symbol"] = plt.swaggerGold,
      ["@string.special.url"] = plt.fightTeal,
      ["@string.special.path"] = plt.attitudeGreen,

      ["@character"] = plt.attitudeGreen,
      ["@character.special"] = plt.cockyGold,

      ["@number"] = plt.swaggerGold,
      ["@number.float"] = plt.swaggerGold,

      ["@boolean"] = plt.willLoud,

      ["@function"] = plt.streetBlue,
      ["@function.builtin"] = plt.streetBlue,
      ["@function.call"] = plt.streetBlue,
      ["@function.macro"] = plt.rebelYellow,
      ["@function.method"] = plt.brawlerCyan,
      ["@function.method.call"] = plt.brawlerCyan,

      ["@constructor"] = plt.cockyGold,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.willLoud,
      ["@keyword.coroutine"] = plt.willBrash,
      ["@keyword.function"] = plt.willLoud,
      ["@keyword.operator"] = plt.constructSharp,
      ["@keyword.return"] = plt.willLoud,
      ["@keyword.import"] = plt.rebelYellow,
      ["@keyword.storage"] = plt.willLoud,
      ["@keyword.repeat"] = plt.willLoud,
      ["@keyword.conditional"] = plt.willLoud,
      ["@keyword.exception"] = plt.rageRed,
      ["@keyword.directive"] = plt.rebelYellow,
      ["@keyword.directive.define"] = plt.rebelYellow,

      ["@conditional"] = plt.willLoud,
      ["@conditional.ternary"] = plt.willLoud,

      ["@repeat"] = plt.willLoud,

      ["@label"] = plt.willBrash,

      ["@operator"] = plt.constructSharp,

      ["@exception"] = plt.rageRed,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.willIntense,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.cockyGold,
      ["@type.builtin"] = plt.cockyGold,
      ["@type.definition"] = plt.cockyGold,
      ["@type.qualifier"] = plt.willLoud,

      ["@attribute"] = plt.cockyGold,
      ["@attribute.builtin"] = plt.cockyGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.cockyGold,
      ["@module.builtin"] = plt.cockyGold,

      ["@namespace"] = plt.cockyGold,
      ["@namespace.builtin"] = plt.cockyGold,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.constructSharp,

      ["@tag"] = plt.willLoud,
      ["@tag.attribute"] = plt.cockyGold,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.willLoud,

      ["@markup.strong"] = { fg = plt.willLoud, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.constructSharp, underline = true },
      ["@markup.heading"] = plt.willLoud,
      ["@markup.heading.1"] = plt.willLoud,
      ["@markup.heading.2"] = plt.cockyGold,
      ["@markup.heading.3"] = plt.hotheadOrange,
      ["@markup.heading.4"] = plt.streetBlue,
      ["@markup.heading.5"] = plt.rebelYellow,
      ["@markup.heading.6"] = plt.constructSharp,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.cockyGold,
      ["@markup.link"] = plt.streetBlue,
      ["@markup.link.label"] = plt.brawlerCyan,
      ["@markup.link.url"] = plt.fightTeal,
      ["@markup.raw"] = plt.attitudeGreen,
      ["@markup.raw.block"] = plt.attitudeGreen,
      ["@markup.list"] = plt.willLoud,
      ["@markup.list.checked"] = plt.victoryLoud,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.attitudeGreen,
      ["@diff.minus"] = plt.rageRed,
      ["@diff.delta"] = plt.cockyGold,

      ["@none"] = "none",
      ["@conceal"] = plt.rebelYellow,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.cockyGold,
      ["@constructor.javascript"] = plt.cockyGold,
      ["@constructor.typescript"] = plt.cockyGold,
      ["@namespace.rust"] = plt.cockyGold,
      ["@type.qualifier.rust"] = plt.willLoud,
      ["@constant.macro.c"] = plt.streetGray,
      ["@constant.macro.cpp"] = plt.streetGray,
      ["@namespace.go"] = plt.cockyGold,
      ["@property.css"] = plt.brawlerCyan,
      ["@type.css"] = plt.willLoud,
      ["@label.json"] = plt.cockyGold,
      ["@field.yaml"] = plt.brawlerCyan,
      ["@property.toml"] = plt.brawlerCyan,
      ["@function.builtin.bash"] = plt.streetBlue,
      ["@string.regexp"] = plt.constructEdge,
      ["@character.special.regex"] = plt.cockyGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.cockyGold,
      ["@lsp.type.interface"] = plt.cockyGold,
      ["@lsp.type.struct"] = plt.cockyGold,
      ["@lsp.type.enum"] = plt.cockyGold,
      ["@lsp.type.enumMember"] = plt.streetGray,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.cockyGold,

      ["@lsp.type.macro"] = plt.cockyGold,
      ["@lsp.type.decorator"] = plt.cockyGold,

      ["@lsp.type.builtinType"] = plt.cockyGold,
      ["@lsp.type.selfParameter"] = plt.willIntense,
      ["@lsp.type.typeParameter"] = plt.cockyGold,

      ["@lsp.type.array"] = plt.cockyGold,
      ["@lsp.type.object"] = plt.cockyGold,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.streetGray,
      ["@lsp.type.enumConstant"] = plt.streetGray,

      ["@lsp.type.event"] = plt.cockyGold,
      ["@lsp.type.regexp"] = plt.constructEdge,
      ["@lsp.type.unresolvedReference"] = plt.cockyGold,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.streetGray,
      ["@lsp.mod.async"] = plt.willLoud,
      ["@lsp.mod.static"] = plt.willBrash,
      ["@lsp.mod.abstract"] = plt.cockyGold,
      ["@lsp.mod.defaultLibrary"] = plt.cockyGold,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Justice League – Green Lantern (Guy Gardner)",
  author = "PrismPunk.nvim",
  description = "Brash hothead, bar fighter with a ring. Loud greens, cocky golds, rage reds. "
    .. "Street attitude, punch-first mentality, chip on shoulder. "
    .. "The rebellious Lantern who argues with everyone.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.rageRed,
    base09 = palette.hotheadOrange,
    base0A = palette.cockyGold,
    base0B = palette.willLoud,
    base0C = palette.constructSharp,
    base0D = palette.streetBlue,
    base0E = palette.rebelYellow,
    base0F = palette.attitudeGreen,
  },

  palette = palette,
  get = M.get,
}
