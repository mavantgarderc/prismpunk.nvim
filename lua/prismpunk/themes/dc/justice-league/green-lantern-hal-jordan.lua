local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#030B0A",
  bg_darker = "#0A1412",
  bg_dark = "#121D1A",
  bg_mid = "#1A2622",
  bg_light = "#222F2A",
  bg_lighter = "#2A3832",
  bg_lightest = "#32413A",

  fg_lightest = "#F0FFF8",
  fg_light = "#D4E8DC",
  fg_mid = "#B0C8B8",
  fg_dark = "#8AA898",

  bg_alt1 = "#0C1714",
  bg_alt2 = "#050D0C",
  bg_alt3 = "#14201C",
  bg_alt4 = "#080F0E",

  willCore = "#00E676",
  willBright = "#00FF88",
  willFlare = "#33FF99",
  willStrong = "#00D66A",
  willSolid = "#00B85C",

  fearlessGreen = "#10DC70",
  emeraldFlash = "#1FFF82",
  emeraldGlow = "#2AFF94",
  emeraldDeep = "#0AC95D",
  emeraldDark = "#089B47",

  jetStream = "#4FC3F7",
  skyBlue = "#29B6F6",
  cockpitBlue = "#03A9F4",
  contrailWhite = "#E0F7FA",
  silverWing = "#B0BEC5",

  heroGold = "#FFD54F",
  confidentAmber = "#FFCA28",
  boldYellow = "#FFC107",
  starGold = "#FFB300",
  pilotBadge = "#FFA000",

  constructBright = "#00FFA3",
  constructEdge = "#00E68A",
  constructCore = "#00CC77",
  constructGlow = "#66FFBB",
  constructSolid = "#00B366",

  guardianTeal = "#00BFA5",
  oaGlow = "#1DE9B6",
  centralBattery = "#00E5A0",
  ancientsWisdom = "#00C896",
  immortalGreen = "#009D7D",

  dangerRed = "#EF5350",
  warningAmber = "#FFB74D",
  criticalOrange = "#FF7043",

  missionGreen = "#66BB6A",
  successBright = "#4CAF50",
  victoryGlow = "#81C784",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.willCore,
      insert = plt.willBright,
      visual = plt.jetStream,
      replace = plt.dangerRed,
      command = plt.heroGold,
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
      bg_search = plt.heroGold,
      bg_visual = plt.jetStream,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.willBright,
      header2 = plt.heroGold,
      special = plt.constructBright,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.willCore,
      indent = plt.bg_lighter,
      indent_scope = plt.willCore,
      picker = plt.jetStream,
      yank = plt.heroGold,
      mark = plt.constructEdge,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.willBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.willCore,
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
        fg_border = plt.willSolid,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.willCore,
      accent2 = plt.willBright,
      accent3 = plt.heroGold,
      accent4 = plt.jetStream,
      accent5 = plt.constructBright,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.willBright,
      rainbow2 = plt.willCore,
      rainbow3 = plt.heroGold,
      rainbow4 = plt.jetStream,
      rainbow5 = plt.constructBright,
      rainbow6 = plt.guardianTeal,
      rainbow7 = plt.skyBlue,
    },

    syn = {
      attribute = plt.heroGold,
      boolean = plt.willCore,
      comment = plt.fg_dark,
      constant = plt.contrailWhite,
      deprecated = plt.fg_mid,
      func = plt.jetStream,
      identifier = plt.fg_lightest,
      keyword = plt.willCore,
      method = plt.skyBlue,
      number = plt.starGold,
      operator = plt.constructEdge,
      parameter = plt.fg_mid,
      preproc = plt.guardianTeal,
      punct = plt.fg_mid,
      regex = plt.constructBright,
      statement = plt.willCore,
      string = plt.willBright,
      symbol = plt.heroGold,
      type = plt.heroGold,
      variable = plt.fg_lightest,
      special = plt.oaGlow,
      special2 = plt.constructGlow,
      special3 = plt.emeraldFlash,
    },

    vcs = {
      added = plt.willBright,
      removed = plt.dangerRed,
      changed = plt.heroGold,
    },

    diff = {
      add = plt.willBright,
      change = plt.heroGold,
      delete = plt.dangerRed,
      text = plt.jetStream,
    },

    diag = {
      ok = plt.successBright,
      error = plt.dangerRed,
      warning = plt.warningAmber,
      info = plt.cockpitBlue,
      hint = plt.guardianTeal,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.dangerRed,
      green = plt.willBright,
      yellow = plt.heroGold,
      blue = plt.jetStream,
      magenta = plt.guardianTeal,
      cyan = plt.constructBright,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.dangerRed):brighten(0.2):to_hex(),
      green_bright = color(plt.willBright):brighten(0.1):to_hex(),
      yellow_bright = color(plt.heroGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.jetStream):brighten(0.3):to_hex(),
      magenta_bright = color(plt.guardianTeal):brighten(0.2):to_hex(),
      cyan_bright = color(plt.constructBright):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.heroGold,
      indexed2 = plt.willCore,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.dangerRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.heroGold,
      ["@comment.note"] = plt.jetStream,

      ["@constant"] = plt.contrailWhite,
      ["@constant.builtin"] = plt.contrailWhite,
      ["@constant.macro"] = plt.heroGold,

      ["@string"] = plt.willBright,
      ["@string.documentation"] = plt.willBright,
      ["@string.regex"] = plt.constructBright,
      ["@string.escape"] = plt.heroGold,
      ["@string.special"] = plt.constructEdge,
      ["@string.special.symbol"] = plt.starGold,
      ["@string.special.url"] = plt.cockpitBlue,
      ["@string.special.path"] = plt.willBright,

      ["@character"] = plt.willBright,
      ["@character.special"] = plt.heroGold,

      ["@number"] = plt.starGold,
      ["@number.float"] = plt.starGold,

      ["@boolean"] = plt.willCore,

      ["@function"] = plt.jetStream,
      ["@function.builtin"] = plt.jetStream,
      ["@function.call"] = plt.jetStream,
      ["@function.macro"] = plt.guardianTeal,
      ["@function.method"] = plt.skyBlue,
      ["@function.method.call"] = plt.skyBlue,

      ["@constructor"] = plt.heroGold,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.willCore,
      ["@keyword.coroutine"] = plt.emeraldFlash,
      ["@keyword.function"] = plt.willCore,
      ["@keyword.operator"] = plt.constructEdge,
      ["@keyword.return"] = plt.willCore,
      ["@keyword.import"] = plt.guardianTeal,
      ["@keyword.storage"] = plt.willCore,
      ["@keyword.repeat"] = plt.willCore,
      ["@keyword.conditional"] = plt.willCore,
      ["@keyword.exception"] = plt.dangerRed,
      ["@keyword.directive"] = plt.guardianTeal,
      ["@keyword.directive.define"] = plt.guardianTeal,

      ["@conditional"] = plt.willCore,
      ["@conditional.ternary"] = plt.willCore,

      ["@repeat"] = plt.willCore,

      ["@label"] = plt.emeraldFlash,

      ["@operator"] = plt.constructEdge,

      ["@exception"] = plt.dangerRed,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.emeraldGlow,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.heroGold,
      ["@type.builtin"] = plt.heroGold,
      ["@type.definition"] = plt.heroGold,
      ["@type.qualifier"] = plt.willCore,

      ["@attribute"] = plt.heroGold,
      ["@attribute.builtin"] = plt.heroGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.heroGold,
      ["@module.builtin"] = plt.heroGold,

      ["@namespace"] = plt.heroGold,
      ["@namespace.builtin"] = plt.heroGold,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.constructEdge,

      ["@tag"] = plt.willCore,
      ["@tag.attribute"] = plt.heroGold,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.willCore,

      ["@markup.strong"] = { fg = plt.willBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.constructEdge, underline = true },
      ["@markup.heading"] = plt.willBright,
      ["@markup.heading.1"] = plt.willBright,
      ["@markup.heading.2"] = plt.heroGold,
      ["@markup.heading.3"] = plt.jetStream,
      ["@markup.heading.4"] = plt.constructBright,
      ["@markup.heading.5"] = plt.guardianTeal,
      ["@markup.heading.6"] = plt.skyBlue,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.heroGold,
      ["@markup.link"] = plt.jetStream,
      ["@markup.link.label"] = plt.skyBlue,
      ["@markup.link.url"] = plt.cockpitBlue,
      ["@markup.raw"] = plt.willBright,
      ["@markup.raw.block"] = plt.willBright,
      ["@markup.list"] = plt.willCore,
      ["@markup.list.checked"] = plt.successBright,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.willBright,
      ["@diff.minus"] = plt.dangerRed,
      ["@diff.delta"] = plt.heroGold,

      ["@none"] = "none",
      ["@conceal"] = plt.guardianTeal,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.heroGold,
      ["@constructor.javascript"] = plt.heroGold,
      ["@constructor.typescript"] = plt.heroGold,
      ["@namespace.rust"] = plt.heroGold,
      ["@type.qualifier.rust"] = plt.willCore,
      ["@constant.macro.c"] = plt.contrailWhite,
      ["@constant.macro.cpp"] = plt.contrailWhite,
      ["@namespace.go"] = plt.heroGold,
      ["@property.css"] = plt.skyBlue,
      ["@type.css"] = plt.willCore,
      ["@label.json"] = plt.heroGold,
      ["@field.yaml"] = plt.skyBlue,
      ["@property.toml"] = plt.skyBlue,
      ["@function.builtin.bash"] = plt.jetStream,
      ["@string.regexp"] = plt.constructBright,
      ["@character.special.regex"] = plt.heroGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.heroGold,
      ["@lsp.type.interface"] = plt.heroGold,
      ["@lsp.type.struct"] = plt.heroGold,
      ["@lsp.type.enum"] = plt.heroGold,
      ["@lsp.type.enumMember"] = plt.contrailWhite,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.heroGold,

      ["@lsp.type.macro"] = plt.heroGold,
      ["@lsp.type.decorator"] = plt.heroGold,

      ["@lsp.type.builtinType"] = plt.heroGold,
      ["@lsp.type.selfParameter"] = plt.emeraldGlow,
      ["@lsp.type.typeParameter"] = plt.heroGold,

      ["@lsp.type.array"] = plt.heroGold,
      ["@lsp.type.object"] = plt.heroGold,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.contrailWhite,
      ["@lsp.type.enumConstant"] = plt.contrailWhite,

      ["@lsp.type.event"] = plt.heroGold,
      ["@lsp.type.regexp"] = plt.constructBright,
      ["@lsp.type.unresolvedReference"] = plt.heroGold,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.contrailWhite,
      ["@lsp.mod.async"] = plt.willCore,
      ["@lsp.mod.static"] = plt.emeraldFlash,
      ["@lsp.mod.abstract"] = plt.heroGold,
      ["@lsp.mod.defaultLibrary"] = plt.heroGold,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Justice League – Green Lantern (Hal Jordan)",
  author = "PrismPunk.nvim",
  description = "Fearless test pilot, cocky hero, Silver Age legend. Brightest day, "
    .. "blackest night—no evil escapes his sight. Jet stream blues, confident gold, "
    .. "emerald will. The greatest Green Lantern.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.dangerRed,
    base09 = palette.starGold,
    base0A = palette.heroGold,
    base0B = palette.willBright,
    base0C = palette.constructBright,
    base0D = palette.jetStream,
    base0E = palette.guardianTeal,
    base0F = palette.willCore,
  },

  palette = palette,
  get = M.get,
}
