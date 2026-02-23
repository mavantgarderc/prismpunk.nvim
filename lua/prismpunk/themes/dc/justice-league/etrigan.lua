local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0605",
  bg_darker = "#130C0A",
  bg_dark = "#1C120F",
  bg_mid = "#251814",
  bg_light = "#2E1F1A",
  bg_lighter = "#382620",
  bg_lightest = "#422D26",

  fg_lightest = "#FFF5E8",
  fg_light = "#E8D5C0",
  fg_mid = "#D0B598",
  fg_dark = "#B89570",

  bg_alt1 = "#150E0B",
  bg_alt2 = "#0D0807",
  bg_alt3 = "#1F1410",
  bg_alt4 = "#0F0A08",

  hellfireOrangeCore = "#FF6B35",
  hellfireOrange = "#FF6B35",
  hellfireOrangeBright = "#FF8C5E",
  hellfireOrangeDeep = "#E8551F",

  demonRed = "#DC2626",
  demonRedBright = "#EF4444",
  demonRedCore = "#DC2626",
  demonRedDeep = "#B91C1C",

  brimstoneYellow = "#FBBF24",
  brimstoneYellowBright = "#FCD34D",
  brimstoneYellowCore = "#FBBF24",
  brimstoneYellowDeep = "#F59E0B",

  infernalPurple = "#A855F7",
  infernalPurpleBright = "#C084FC",
  infernalPurpleCore = "#A855F7",
  infernalPurpleDeep = "#9333EA",

  sulfurYellow = "#EAB308",
  sulfurYellowBright = "#FACC15",
  sulfurYellowCore = "#EAB308",
  sulfurYellowDeep = "#CA8A04",

  emberOrange = "#FB923C",
  emberOrangeBright = "#FDBA74",
  emberOrangeCore = "#FB923C",

  ashGray = "#78716C",
  ashGrayLight = "#A8A29E",
  ashGrayDark = "#57534E",

  flameWhite = "#FFF5E8",
  flameWhiteCore = "#FFF5E8",
  flameWhiteBright = "#FFFBF5",

  chaosRed = "#EF4444",
  chaosRedBright = "#F87171",
  chaosRedCore = "#EF4444",

  bloodCrimson = "#B91C1C",
  bloodCrimsonBright = "#DC2626",
  bloodCrimsonCore = "#B91C1C",

  currentGray = "#78716C",
  currentGrayLight = "#A8A29E",

  ritualGreen = "#10B981",
  ritualGreenCore = "#10B981",
  ritualGreenBright = "#34D399",

  incantationViolet = "#8B5CF6",
  incantationVioletCore = "#8B5CF6",

  voidBlack = "#0A0605",

  successGreen = "#10B981",
  errorRed = "#DC2626",
  warningAmber = "#FBBF24",
  infoBlue = "#3B82F6",

  seaweedGreenCore = "#10B981",
  anglerYellowCore = "#FBBF24",
  anemoneRedCore = "#DC2626",

  coralPink = "#FF6B35",
  coralPinkBright = "#FF8C5E",
  coralPinkCore = "#FF6B35",
  coralPinkDeep = "#E8551F",

  pressureWhite = "#FFF5E8",
  pressureWhiteCore = "#FFF5E8",
  pressureWhiteBright = "#FFFBF5",

  depthBlack = "#0A0605",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.hellfireOrangeCore,
      insert = plt.brimstoneYellowCore,
      visual = plt.demonRedCore,
      replace = plt.chaosRedCore,
      command = plt.infernalPurpleCore,
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
      bg_search = plt.sulfurYellowDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.hellfireOrangeBright,
      header2 = plt.brimstoneYellowBright,
      special = plt.infernalPurple,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.hellfireOrangeCore,
      picker = plt.emberOrange,
      yank = plt.sulfurYellowBright,
      mark = plt.demonRed,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.hellfireOrangeBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.hellfireOrangeCore,
      },
      pmenu = {
        fg = plt.fg_light,
        fg_sel = plt.fg_lightest,
        fg_border = plt.currentGray,
        bg_border = plt.bg_light,
        bg = plt.bg_light,
        bg_sel = plt.bg_lighter,
        bg_sbar = plt.bg_light,
        bg_thumb = plt.currentGrayLight,
      },
      float = {
        fg = plt.fg_light,
        bg = plt.bg_darker,
        fg_border = plt.currentGray,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.hellfireOrangeCore,
      accent2 = plt.demonRedCore,
      accent3 = plt.brimstoneYellowCore,
      accent4 = plt.sulfurYellowCore,
      accent5 = plt.infernalPurpleCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.hellfireOrangeBright,
      rainbow2 = plt.demonRedBright,
      rainbow3 = plt.brimstoneYellowBright,
      rainbow4 = plt.sulfurYellowBright,
      rainbow5 = plt.infernalPurpleBright,
      rainbow6 = plt.emberOrangeBright,
      rainbow7 = plt.chaosRedBright,
    },

    syn = {
      attribute = plt.emberOrange,
      boolean = plt.demonRed,
      comment = plt.ashGray,
      constant = plt.flameWhite,
      deprecated = plt.voidBlack,
      func = plt.brimstoneYellowCore,
      identifier = plt.fg_lightest,
      keyword = plt.hellfireOrangeCore,
      method = plt.brimstoneYellowBright,
      number = plt.flameWhite,
      operator = plt.sulfurYellowCore,
      parameter = plt.fg_mid,
      preproc = plt.infernalPurpleCore,
      punct = plt.fg_dark,
      regex = plt.incantationViolet,
      statement = plt.hellfireOrangeCore,
      string = plt.brimstoneYellowCore,
      symbol = plt.emberOrange,
      type = plt.demonRedCore,
      variable = plt.fg_lightest,
      special = plt.infernalPurple,
      special2 = plt.chaosRed,
      special3 = plt.ritualGreen,
    },

    vcs = {
      added = plt.ritualGreenCore,
      removed = plt.chaosRedCore,
      changed = plt.sulfurYellowCore,
    },

    diff = {
      add = plt.ritualGreenCore,
      change = plt.sulfurYellowCore,
      delete = plt.chaosRedCore,
      text = plt.infernalPurple,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.infernalPurple,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.demonRedCore,
      green = plt.ritualGreenCore,
      yellow = plt.brimstoneYellowCore,
      blue = plt.infernalPurpleCore,
      magenta = plt.infernalPurpleCore,
      cyan = plt.emberOrangeCore,
      white = plt.flameWhiteCore,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.demonRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.ritualGreenBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.brimstoneYellowBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.infernalPurpleBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.infernalPurpleBright):brighten(0.15):to_hex(),
      cyan_bright = color(plt.emberOrangeBright):brighten(0.15):to_hex(),
      white_bright = plt.flameWhiteBright,
      indexed1 = plt.hellfireOrange,
      indexed2 = plt.sulfurYellow,
    },

    treesitter = {
      ["@comment"] = plt.ashGray,
      ["@comment.documentation"] = plt.ashGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.sulfurYellowBright,
      ["@comment.note"] = plt.infernalPurple,

      ["@constant"] = plt.flameWhite,
      ["@constant.builtin"] = plt.flameWhiteCore,
      ["@constant.macro"] = plt.emberOrange,

      ["@string"] = plt.brimstoneYellowCore,
      ["@string.documentation"] = plt.brimstoneYellowCore,
      ["@string.regex"] = plt.incantationViolet,
      ["@string.escape"] = plt.sulfurYellowBright,
      ["@string.special"] = plt.brimstoneYellowBright,
      ["@string.special.symbol"] = plt.emberOrange,
      ["@string.special.url"] = plt.demonRed,
      ["@string.special.path"] = plt.brimstoneYellowCore,

      ["@character"] = plt.brimstoneYellowCore,
      ["@character.special"] = plt.emberOrange,

      ["@number"] = plt.flameWhite,
      ["@number.float"] = plt.flameWhiteCore,

      ["@boolean"] = plt.demonRed,

      ["@function"] = plt.brimstoneYellowCore,
      ["@function.builtin"] = plt.brimstoneYellowCore,
      ["@function.call"] = plt.brimstoneYellowCore,
      ["@function.macro"] = plt.infernalPurpleCore,
      ["@function.method"] = plt.brimstoneYellowBright,
      ["@function.method.call"] = plt.brimstoneYellowBright,

      ["@constructor"] = plt.demonRedCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.hellfireOrangeCore,
      ["@keyword.coroutine"] = plt.infernalPurpleCore,
      ["@keyword.function"] = plt.hellfireOrangeCore,
      ["@keyword.operator"] = plt.sulfurYellowCore,
      ["@keyword.return"] = plt.hellfireOrangeCore,
      ["@keyword.import"] = plt.infernalPurpleCore,
      ["@keyword.storage"] = plt.hellfireOrangeCore,
      ["@keyword.repeat"] = plt.hellfireOrangeCore,
      ["@keyword.conditional"] = plt.hellfireOrangeCore,
      ["@keyword.exception"] = plt.chaosRedCore,
      ["@keyword.directive"] = plt.infernalPurpleCore,
      ["@keyword.directive.define"] = plt.infernalPurpleCore,

      ["@conditional"] = plt.hellfireOrangeCore,
      ["@conditional.ternary"] = plt.hellfireOrangeCore,

      ["@repeat"] = plt.hellfireOrangeCore,

      ["@label"] = plt.emberOrange,

      ["@operator"] = plt.sulfurYellowCore,

      ["@exception"] = plt.chaosRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.hellfireOrangeBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.demonRedCore,
      ["@type.builtin"] = plt.demonRedCore,
      ["@type.definition"] = plt.demonRedCore,
      ["@type.qualifier"] = plt.hellfireOrangeCore,

      ["@attribute"] = plt.emberOrange,
      ["@attribute.builtin"] = plt.emberOrange,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.demonRedCore,
      ["@module.builtin"] = plt.demonRedCore,

      ["@namespace"] = plt.demonRedCore,
      ["@namespace.builtin"] = plt.demonRedCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.sulfurYellowCore,

      ["@tag"] = plt.hellfireOrangeCore,
      ["@tag.attribute"] = plt.emberOrange,
      ["@tag.delimiter"] = plt.sulfurYellowCore,
      ["@tag.builtin"] = plt.hellfireOrangeCore,

      ["@markup.strong"] = { fg = plt.hellfireOrangeBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.ashGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.infernalPurple, underline = true },
      ["@markup.heading"] = plt.hellfireOrangeBright,
      ["@markup.heading.1"] = plt.hellfireOrangeBright,
      ["@markup.heading.2"] = plt.demonRedBright,
      ["@markup.heading.3"] = plt.brimstoneYellowBright,
      ["@markup.heading.4"] = plt.infernalPurpleBright,
      ["@markup.heading.5"] = plt.emberOrangeBright,
      ["@markup.heading.6"] = plt.sulfurYellowBright,
      ["@markup.quote"] = plt.ashGray,
      ["@markup.math"] = plt.flameWhite,
      ["@markup.link"] = plt.demonRed,
      ["@markup.link.label"] = plt.demonRedBright,
      ["@markup.link.url"] = plt.demonRed,
      ["@markup.raw"] = plt.brimstoneYellowCore,
      ["@markup.raw.block"] = plt.brimstoneYellowCore,
      ["@markup.list"] = plt.hellfireOrangeCore,
      ["@markup.list.checked"] = plt.ritualGreenCore,
      ["@markup.list.unchecked"] = plt.ashGray,

      ["@diff.plus"] = plt.ritualGreenCore,
      ["@diff.minus"] = plt.chaosRedCore,
      ["@diff.delta"] = plt.sulfurYellowCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.demonRedCore,
      ["@constructor.javascript"] = plt.demonRedCore,
      ["@constructor.typescript"] = plt.demonRedCore,
      ["@namespace.rust"] = plt.demonRedCore,
      ["@type.qualifier.rust"] = plt.hellfireOrangeCore,
      ["@constant.macro.c"] = plt.emberOrange,
      ["@constant.macro.cpp"] = plt.emberOrange,
      ["@namespace.go"] = plt.demonRedCore,
      ["@property.css"] = plt.brimstoneYellowBright,
      ["@type.css"] = plt.hellfireOrangeCore,
      ["@label.json"] = plt.emberOrange,
      ["@field.yaml"] = plt.brimstoneYellowBright,
      ["@property.toml"] = plt.brimstoneYellowBright,
      ["@function.builtin.bash"] = plt.brimstoneYellowCore,
      ["@string.regexp"] = plt.incantationViolet,
      ["@character.special.regex"] = plt.emberOrange,
    },

    lsp = {
      ["@lsp.type.class"] = plt.demonRedCore,
      ["@lsp.type.interface"] = plt.demonRedCore,
      ["@lsp.type.struct"] = plt.demonRedCore,
      ["@lsp.type.enum"] = plt.demonRedCore,
      ["@lsp.type.enumMember"] = plt.flameWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.demonRedCore,

      ["@lsp.type.macro"] = plt.emberOrange,
      ["@lsp.type.decorator"] = plt.emberOrange,

      ["@lsp.type.builtinType"] = plt.demonRedCore,
      ["@lsp.type.selfParameter"] = plt.hellfireOrangeBright,
      ["@lsp.type.typeParameter"] = plt.demonRedCore,

      ["@lsp.type.array"] = plt.demonRedCore,
      ["@lsp.type.object"] = plt.demonRedCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.flameWhiteCore,
      ["@lsp.type.enumConstant"] = plt.flameWhiteCore,

      ["@lsp.type.event"] = plt.demonRedCore,
      ["@lsp.type.regexp"] = plt.incantationViolet,
      ["@lsp.type.unresolvedReference"] = plt.demonRedCore,

      ["@lsp.mod.deprecated"] = { fg = plt.voidBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.flameWhiteCore,
      ["@lsp.mod.async"] = plt.hellfireOrangeCore,
      ["@lsp.mod.static"] = plt.hellfireOrangeBright,
      ["@lsp.mod.abstract"] = plt.demonRedCore,
      ["@lsp.mod.defaultLibrary"] = plt.demonRedCore,
      ["@lsp.mod.documentation"] = plt.ashGrayLight,
    },
  }
end

return {
  name = "Etrigan",
  author = "PrismPunk.nvim",
  description = "Rhyming demon — hellfire orange, brimstone yellow, demon red, infernal chaos.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.ashGray,
    base04 = palette.ashGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.chaosRedCore,
    base09 = palette.emberOrangeCore,
    base0A = palette.brimstoneYellowCore,
    base0B = palette.brimstoneYellowCore,
    base0C = palette.sulfurYellowCore,
    base0D = palette.hellfireOrangeCore,
    base0E = palette.infernalPurpleCore,
    base0F = palette.incantationVioletCore,
  },

  palette = palette,
  get = M.get,
}
