local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0D10",
  bg_darker = "#111418",
  bg_dark = "#181C21",
  bg_mid = "#1F2329",
  bg_light = "#272B33",
  bg_lighter = "#2F333B",
  bg_lightest = "#373C45",

  fg_lightest = "#E8F5E8",
  fg_light = "#C8DEC8",
  fg_mid = "#A8C7A8",
  fg_dark = "#88B088",

  bg_alt1 = "#13161A",
  bg_alt2 = "#0C0F12",
  bg_alt3 = "#1C1F24",
  bg_alt4 = "#0E1114",

  terminalGreenCore = "#00FF41",
  terminalGreen = "#00FF41",
  terminalGreenBright = "#5AFF7A",
  terminalGreenDeep = "#00D635",

  dataBlue = "#4A9EFF",
  dataBlueBright = "#7AB8FF",
  dataBlueCore = "#4A9EFF",
  dataBlueDeep = "#3580D9",

  networkPurple = "#9D4EDD",
  networkPurpleBright = "#C77DFF",
  networkPurpleCore = "#9D4EDD",
  networkPurpleDeep = "#7B2CBF",

  signalOrange = "#FF9500",
  signalOrangeBright = "#FFB143",
  signalOrangeCore = "#FF9500",
  signalOrangeDeep = "#D97D00",

  alertAmber = "#FFC107",
  alertAmberBright = "#FFD54F",
  alertAmberCore = "#FFC107",
  alertAmberDeep = "#FFA000",

  encryptionTeal = "#00D9A3",
  encryptionTealBright = "#33E6B8",
  encryptionTealCore = "#00D9A3",

  screenGray = "#6B7C8C",
  screenGrayLight = "#8A9BA8",
  screenGrayDark = "#556570",

  codeWhite = "#E8F5E8",
  codeWhiteCore = "#E8F5E8",
  codeWhiteBright = "#F5FFF5",

  firewallRed = "#FF3D00",
  firewallRedBright = "#FF6E40",
  firewallRedCore = "#FF3D00",

  monitorGreen = "#00E676",
  monitorGreenBright = "#69F0AE",
  monitorGreenCore = "#00E676",

  circuitViolet = "#7C4DFF",
  circuitVioletCore = "#7C4DFF",

  currentGray = "#6B7C8C",
  currentGrayLight = "#8A9BA8",

  accessGreen = "#00E676",
  accessGreenCore = "#00E676",
  accessGreenBright = "#69F0AE",

  offlineBlack = "#0A0D10",

  successGreen = "#00E676",
  errorRed = "#FF3D00",
  warningAmber = "#FFC107",
  infoBlue = "#4A9EFF",

  seaweedGreenCore = "#00E676",
  anglerYellowCore = "#FFC107",
  anemoneRedCore = "#FF3D00",

  coralPink = "#FF9500",
  coralPinkBright = "#FFB143",
  coralPinkCore = "#FF9500",
  coralPinkDeep = "#D97D00",

  pressureWhite = "#E8F5E8",
  pressureWhiteCore = "#E8F5E8",
  pressureWhiteBright = "#F5FFF5",

  depthBlack = "#0A0D10",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.terminalGreenCore,
      insert = plt.dataBlueCore,
      visual = plt.networkPurpleCore,
      replace = plt.firewallRedCore,
      command = plt.alertAmberCore,
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
      bg_search = plt.alertAmberDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.terminalGreenBright,
      header2 = plt.dataBlueBright,
      special = plt.alertAmber,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.terminalGreenCore,
      picker = plt.signalOrange,
      yank = plt.alertAmberBright,
      mark = plt.networkPurple,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.terminalGreenBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.terminalGreenCore,
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
      accent1 = plt.terminalGreenCore,
      accent2 = plt.dataBlueCore,
      accent3 = plt.networkPurpleCore,
      accent4 = plt.signalOrangeCore,
      accent5 = plt.alertAmberCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.terminalGreenBright,
      rainbow2 = plt.dataBlueBright,
      rainbow3 = plt.networkPurpleBright,
      rainbow4 = plt.signalOrangeBright,
      rainbow5 = plt.alertAmberBright,
      rainbow6 = plt.encryptionTealBright,
      rainbow7 = plt.monitorGreenBright,
    },

    syn = {
      attribute = plt.signalOrange,
      boolean = plt.networkPurple,
      comment = plt.screenGray,
      constant = plt.codeWhite,
      deprecated = plt.offlineBlack,
      func = plt.dataBlueCore,
      identifier = plt.fg_lightest,
      keyword = plt.terminalGreenCore,
      method = plt.dataBlueBright,
      number = plt.codeWhite,
      operator = plt.signalOrangeCore,
      parameter = plt.fg_mid,
      preproc = plt.alertAmberCore,
      punct = plt.fg_dark,
      regex = plt.circuitViolet,
      statement = plt.terminalGreenCore,
      string = plt.dataBlueCore,
      symbol = plt.signalOrange,
      type = plt.networkPurpleCore,
      variable = plt.fg_lightest,
      special = plt.alertAmber,
      special2 = plt.encryptionTeal,
      special3 = plt.monitorGreen,
    },

    vcs = {
      added = plt.accessGreenCore,
      removed = plt.firewallRedCore,
      changed = plt.alertAmberCore,
    },

    diff = {
      add = plt.accessGreenCore,
      change = plt.alertAmberCore,
      delete = plt.firewallRedCore,
      text = plt.alertAmber,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.alertAmber,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.firewallRedCore,
      green = plt.terminalGreenCore,
      yellow = plt.alertAmberCore,
      blue = plt.dataBlueCore,
      magenta = plt.networkPurpleCore,
      cyan = plt.encryptionTealCore,
      white = plt.codeWhiteCore,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.firewallRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.terminalGreenBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.alertAmberBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.dataBlueBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.networkPurpleBright):brighten(0.15):to_hex(),
      cyan_bright = color(plt.encryptionTealBright):brighten(0.15):to_hex(),
      white_bright = plt.codeWhiteBright,
      indexed1 = plt.terminalGreen,
      indexed2 = plt.signalOrange,
    },

    treesitter = {
      ["@comment"] = plt.screenGray,
      ["@comment.documentation"] = plt.screenGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.alertAmberBright,
      ["@comment.note"] = plt.alertAmber,

      ["@constant"] = plt.codeWhite,
      ["@constant.builtin"] = plt.codeWhiteCore,
      ["@constant.macro"] = plt.signalOrange,

      ["@string"] = plt.dataBlueCore,
      ["@string.documentation"] = plt.dataBlueCore,
      ["@string.regex"] = plt.circuitViolet,
      ["@string.escape"] = plt.alertAmberBright,
      ["@string.special"] = plt.dataBlueBright,
      ["@string.special.symbol"] = plt.signalOrange,
      ["@string.special.url"] = plt.networkPurple,
      ["@string.special.path"] = plt.dataBlueCore,

      ["@character"] = plt.dataBlueCore,
      ["@character.special"] = plt.signalOrange,

      ["@number"] = plt.codeWhite,
      ["@number.float"] = plt.codeWhiteCore,

      ["@boolean"] = plt.networkPurple,

      ["@function"] = plt.dataBlueCore,
      ["@function.builtin"] = plt.dataBlueCore,
      ["@function.call"] = plt.dataBlueCore,
      ["@function.macro"] = plt.alertAmberCore,
      ["@function.method"] = plt.dataBlueBright,
      ["@function.method.call"] = plt.dataBlueBright,

      ["@constructor"] = plt.networkPurpleCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.terminalGreenCore,
      ["@keyword.coroutine"] = plt.alertAmberCore,
      ["@keyword.function"] = plt.terminalGreenCore,
      ["@keyword.operator"] = plt.signalOrangeCore,
      ["@keyword.return"] = plt.terminalGreenCore,
      ["@keyword.import"] = plt.alertAmberCore,
      ["@keyword.storage"] = plt.terminalGreenCore,
      ["@keyword.repeat"] = plt.terminalGreenCore,
      ["@keyword.conditional"] = plt.terminalGreenCore,
      ["@keyword.exception"] = plt.firewallRedCore,
      ["@keyword.directive"] = plt.alertAmberCore,
      ["@keyword.directive.define"] = plt.alertAmberCore,

      ["@conditional"] = plt.terminalGreenCore,
      ["@conditional.ternary"] = plt.terminalGreenCore,

      ["@repeat"] = plt.terminalGreenCore,

      ["@label"] = plt.signalOrange,

      ["@operator"] = plt.signalOrangeCore,

      ["@exception"] = plt.firewallRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.terminalGreenBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.networkPurpleCore,
      ["@type.builtin"] = plt.networkPurpleCore,
      ["@type.definition"] = plt.networkPurpleCore,
      ["@type.qualifier"] = plt.terminalGreenCore,

      ["@attribute"] = plt.signalOrange,
      ["@attribute.builtin"] = plt.signalOrange,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.networkPurpleCore,
      ["@module.builtin"] = plt.networkPurpleCore,

      ["@namespace"] = plt.networkPurpleCore,
      ["@namespace.builtin"] = plt.networkPurpleCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.signalOrangeCore,

      ["@tag"] = plt.terminalGreenCore,
      ["@tag.attribute"] = plt.signalOrange,
      ["@tag.delimiter"] = plt.signalOrangeCore,
      ["@tag.builtin"] = plt.terminalGreenCore,

      ["@markup.strong"] = { fg = plt.terminalGreenBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.screenGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.alertAmber, underline = true },
      ["@markup.heading"] = plt.terminalGreenBright,
      ["@markup.heading.1"] = plt.terminalGreenBright,
      ["@markup.heading.2"] = plt.dataBlueBright,
      ["@markup.heading.3"] = plt.networkPurpleBright,
      ["@markup.heading.4"] = plt.signalOrangeBright,
      ["@markup.heading.5"] = plt.alertAmberBright,
      ["@markup.heading.6"] = plt.encryptionTealBright,
      ["@markup.quote"] = plt.screenGray,
      ["@markup.math"] = plt.codeWhite,
      ["@markup.link"] = plt.networkPurple,
      ["@markup.link.label"] = plt.networkPurpleBright,
      ["@markup.link.url"] = plt.networkPurple,
      ["@markup.raw"] = plt.dataBlueCore,
      ["@markup.raw.block"] = plt.dataBlueCore,
      ["@markup.list"] = plt.terminalGreenCore,
      ["@markup.list.checked"] = plt.accessGreenCore,
      ["@markup.list.unchecked"] = plt.screenGray,

      ["@diff.plus"] = plt.accessGreenCore,
      ["@diff.minus"] = plt.firewallRedCore,
      ["@diff.delta"] = plt.alertAmberCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.networkPurpleCore,
      ["@constructor.javascript"] = plt.networkPurpleCore,
      ["@constructor.typescript"] = plt.networkPurpleCore,
      ["@namespace.rust"] = plt.networkPurpleCore,
      ["@type.qualifier.rust"] = plt.terminalGreenCore,
      ["@constant.macro.c"] = plt.signalOrange,
      ["@constant.macro.cpp"] = plt.signalOrange,
      ["@namespace.go"] = plt.networkPurpleCore,
      ["@property.css"] = plt.dataBlueBright,
      ["@type.css"] = plt.terminalGreenCore,
      ["@label.json"] = plt.signalOrange,
      ["@field.yaml"] = plt.dataBlueBright,
      ["@property.toml"] = plt.dataBlueBright,
      ["@function.builtin.bash"] = plt.dataBlueCore,
      ["@string.regexp"] = plt.circuitViolet,
      ["@character.special.regex"] = plt.signalOrange,
    },

    lsp = {
      ["@lsp.type.class"] = plt.networkPurpleCore,
      ["@lsp.type.interface"] = plt.networkPurpleCore,
      ["@lsp.type.struct"] = plt.networkPurpleCore,
      ["@lsp.type.enum"] = plt.networkPurpleCore,
      ["@lsp.type.enumMember"] = plt.codeWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.networkPurpleCore,

      ["@lsp.type.macro"] = plt.signalOrange,
      ["@lsp.type.decorator"] = plt.signalOrange,

      ["@lsp.type.builtinType"] = plt.networkPurpleCore,
      ["@lsp.type.selfParameter"] = plt.terminalGreenBright,
      ["@lsp.type.typeParameter"] = plt.networkPurpleCore,

      ["@lsp.type.array"] = plt.networkPurpleCore,
      ["@lsp.type.object"] = plt.networkPurpleCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.codeWhiteCore,
      ["@lsp.type.enumConstant"] = plt.codeWhiteCore,

      ["@lsp.type.event"] = plt.networkPurpleCore,
      ["@lsp.type.regexp"] = plt.circuitViolet,
      ["@lsp.type.unresolvedReference"] = plt.networkPurpleCore,

      ["@lsp.mod.deprecated"] = { fg = plt.offlineBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.codeWhiteCore,
      ["@lsp.mod.async"] = plt.terminalGreenCore,
      ["@lsp.mod.static"] = plt.terminalGreenBright,
      ["@lsp.mod.abstract"] = plt.networkPurpleCore,
      ["@lsp.mod.defaultLibrary"] = plt.networkPurpleCore,
      ["@lsp.mod.documentation"] = plt.screenGrayLight,
    },
  }
end

return {
  name = "Punk – Oracle",
  author = "PrismPunk.nvim",
  description = "Barbara Gordon's command center — terminal green, data blue, network purple, signal systems.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.screenGray,
    base04 = palette.screenGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.firewallRedCore,
    base09 = palette.signalOrangeCore,
    base0A = palette.alertAmberCore,
    base0B = palette.dataBlueCore,
    base0C = palette.encryptionTealCore,
    base0D = palette.terminalGreenCore,
    base0E = palette.networkPurpleCore,
    base0F = palette.circuitVioletCore,
  },

  palette = palette,
  get = M.get,
}
