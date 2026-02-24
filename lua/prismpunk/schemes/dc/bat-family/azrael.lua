local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0806",
  bg_darker = "#110F0D",
  bg_dark = "#191614",
  bg_mid = "#211E1B",
  bg_light = "#2A2622",
  bg_lighter = "#332E2A",
  bg_lightest = "#3C3732",

  fg_lightest = "#F5F0E8",
  fg_light = "#E0D8C8",
  fg_mid = "#CBC0A8",
  fg_dark = "#B6A888",

  bg_alt1 = "#13100E",
  bg_alt2 = "#0C0A08",
  bg_alt3 = "#1C1917",
  bg_alt4 = "#0E0C0A",

  holyGoldCore = "#D4A017",
  holyGold = "#D4A017",
  holyGoldBright = "#E5B730",
  holyGoldDeep = "#B8860B",

  consecratedBlue = "#1E3A8A",
  consecratedBlueBright = "#2563EB",
  consecratedBlueCore = "#1E3A8A",
  consecratedBlueDeep = "#1E293B",

  flameRed = "#DC2626",
  flameRedBright = "#EF4444",
  flameRedCore = "#DC2626",
  flameRedDeep = "#B91C1C",

  sacredWhite = "#F8F8FF",
  sacredWhiteBright = "#FFFFFF",
  sacredWhiteCore = "#F8F8FF",
  sacredWhiteDeep = "#E0E0F0",

  judgmentRed = "#B91C1C",
  judgmentRedBright = "#DC2626",
  judgmentRedCore = "#B91C1C",
  judgmentRedDeep = "#991B1B",

  divineWhite = "#FFFAF0",
  divineWhiteCore = "#FFFAF0",
  divineWhiteBright = "#FFFFFF",

  ashGray = "#6B6661",
  ashGrayLight = "#85807A",
  ashGrayDark = "#54504C",

  zealotAmber = "#D97706",
  zealotAmberBright = "#F59E0B",
  zealotAmberCore = "#D97706",

  crusaderRed = "#DC2626",
  crusaderRedBright = "#EF4444",
  crusaderRedCore = "#DC2626",

  sanctifiedGold = "#CA8A04",
  sanctifiedGoldBright = "#EAB308",
  sanctifiedGoldCore = "#CA8A04",

  martyrPurple = "#7C2D12",
  martyrPurpleCore = "#7C2D12",

  currentGray = "#6B6661",
  currentGrayLight = "#85807A",

  salvationGreen = "#DC2626",
  salvationGreenCore = "#DC2626",
  salvationGreenBright = "#EF4444",

  voidBlack = "#0A0806",

  successGreen = "#DC2626",
  errorRed = "#DC2626",
  warningAmber = "#D97706",
  infoBlue = "#1E3A8A",

  seaweedGreenCore = "#DC2626",
  anglerYellowCore = "#D97706",
  anemoneRedCore = "#DC2626",

  coralPink = "#DC2626",
  coralPinkBright = "#EF4444",
  coralPinkCore = "#DC2626",
  coralPinkDeep = "#B91C1C",

  pressureWhite = "#F5F0E8",
  pressureWhiteCore = "#F5F0E8",
  pressureWhiteBright = "#FFFAF0",

  depthBlack = "#0A0806",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.holyGoldCore,
      insert = plt.consecratedBlueCore,
      visual = plt.flameRedCore,
      replace = plt.crusaderRedCore,
      command = plt.sacredWhiteCore,
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
      bg_search = plt.zealotAmberDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.holyGoldBright,
      header2 = plt.consecratedBlueBright,
      special = plt.judgmentRed,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.holyGoldCore,
      picker = plt.sanctifiedGold,
      yank = plt.sacredWhiteBright,
      mark = plt.flameOrange,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.holyGoldBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.holyGoldCore,
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
      accent1 = plt.holyGoldCore,
      accent2 = plt.consecratedBlueCore,
      accent3 = plt.flameRedCore,
      accent4 = plt.sacredWhiteCore,
      accent5 = plt.judgmentRedCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.holyGoldBright,
      rainbow2 = plt.consecratedBlueBright,
      rainbow3 = plt.flameRedBright,
      rainbow4 = plt.sacredWhiteBright,
      rainbow5 = plt.judgmentRedBright,
      rainbow6 = plt.zealotAmberBright,
      rainbow7 = plt.sanctifiedGoldBright,
    },

    syn = {
      attribute = plt.sanctifiedGold,
      boolean = plt.consecratedBlue,
      comment = plt.ashGray,
      constant = plt.divineWhite,
      deprecated = plt.voidBlack,
      func = plt.consecratedBlueCore,
      identifier = plt.fg_lightest,
      keyword = plt.holyGoldCore,
      method = plt.consecratedBlueBright,
      number = plt.divineWhite,
      operator = plt.sacredWhiteCore,
      parameter = plt.fg_mid,
      preproc = plt.judgmentRedCore,
      punct = plt.fg_dark,
      regex = plt.martyrPurple,
      statement = plt.holyGoldCore,
      string = plt.consecratedBlueCore,
      symbol = plt.sanctifiedGold,
      type = plt.flameRedCore,
      variable = plt.fg_lightest,
      special = plt.judgmentRed,
      special2 = plt.zealotAmber,
      special3 = plt.salvationGreen,
    },

    vcs = {
      added = plt.salvationGreenCore,
      removed = plt.crusaderRedCore,
      changed = plt.zealotAmberCore,
    },

    diff = {
      add = plt.salvationGreenCore,
      change = plt.zealotAmberCore,
      delete = plt.crusaderRedCore,
      text = plt.judgmentRed,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.judgmentRed,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.judgmentRedCore,
      green = plt.salvationGreenCore,
      yellow = plt.holyGoldCore,
      blue = plt.consecratedBlueCore,
      magenta = plt.martyrPurpleCore,
      cyan = plt.flameRedCore,
      white = plt.divineWhiteCore,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.judgmentRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.salvationGreenBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.holyGoldBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.consecratedBlueBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.judgmentRedBright):brighten(0.15):to_hex(),
      cyan_bright = color(plt.flameRedBright):brighten(0.15):to_hex(),
      white_bright = plt.divineWhiteBright,
      indexed1 = plt.holyGold,
      indexed2 = plt.flameRed,
    },

    treesitter = {
      ["@comment"] = plt.ashGray,
      ["@comment.documentation"] = plt.ashGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.zealotAmberBright,
      ["@comment.note"] = plt.judgmentRed,

      ["@constant"] = plt.divineWhite,
      ["@constant.builtin"] = plt.divineWhiteCore,
      ["@constant.macro"] = plt.sanctifiedGold,

      ["@string"] = plt.consecratedBlueCore,
      ["@string.documentation"] = plt.consecratedBlueCore,
      ["@string.regex"] = plt.martyrPurple,
      ["@string.escape"] = plt.sacredWhiteBright,
      ["@string.special"] = plt.consecratedBlueBright,
      ["@string.special.symbol"] = plt.sanctifiedGold,
      ["@string.special.url"] = plt.flameRed,
      ["@string.special.path"] = plt.consecratedBlueCore,

      ["@character"] = plt.consecratedBlueCore,
      ["@character.special"] = plt.sanctifiedGold,

      ["@number"] = plt.divineWhite,
      ["@number.float"] = plt.divineWhiteCore,

      ["@boolean"] = plt.consecratedBlue,

      ["@function"] = plt.consecratedBlueCore,
      ["@function.builtin"] = plt.consecratedBlueCore,
      ["@function.call"] = plt.consecratedBlueCore,
      ["@function.macro"] = plt.judgmentRedCore,
      ["@function.method"] = plt.consecratedBlueBright,
      ["@function.method.call"] = plt.consecratedBlueBright,

      ["@constructor"] = plt.flameRedCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.holyGoldCore,
      ["@keyword.coroutine"] = plt.judgmentRedCore,
      ["@keyword.function"] = plt.holyGoldCore,
      ["@keyword.operator"] = plt.sacredWhiteCore,
      ["@keyword.return"] = plt.holyGoldCore,
      ["@keyword.import"] = plt.judgmentRedCore,
      ["@keyword.storage"] = plt.holyGoldCore,
      ["@keyword.repeat"] = plt.holyGoldCore,
      ["@keyword.conditional"] = plt.holyGoldCore,
      ["@keyword.exception"] = plt.crusaderRedCore,
      ["@keyword.directive"] = plt.judgmentRedCore,
      ["@keyword.directive.define"] = plt.judgmentRedCore,

      ["@conditional"] = plt.holyGoldCore,
      ["@conditional.ternary"] = plt.holyGoldCore,

      ["@repeat"] = plt.holyGoldCore,

      ["@label"] = plt.sanctifiedGold,

      ["@operator"] = plt.sacredWhiteCore,

      ["@exception"] = plt.crusaderRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.holyGoldBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.flameRedCore,
      ["@type.builtin"] = plt.flameRedCore,
      ["@type.definition"] = plt.flameRedCore,
      ["@type.qualifier"] = plt.holyGoldCore,

      ["@attribute"] = plt.sanctifiedGold,
      ["@attribute.builtin"] = plt.sanctifiedGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.flameRedCore,
      ["@module.builtin"] = plt.flameRedCore,

      ["@namespace"] = plt.flameRedCore,
      ["@namespace.builtin"] = plt.flameRedCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.sacredWhiteCore,

      ["@tag"] = plt.holyGoldCore,
      ["@tag.attribute"] = plt.sanctifiedGold,
      ["@tag.delimiter"] = plt.sacredWhiteCore,
      ["@tag.builtin"] = plt.holyGoldCore,

      ["@markup.strong"] = { fg = plt.holyGoldBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.ashGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.judgmentRed, underline = true },
      ["@markup.heading"] = plt.holyGoldBright,
      ["@markup.heading.1"] = plt.holyGoldBright,
      ["@markup.heading.2"] = plt.consecratedBlueBright,
      ["@markup.heading.3"] = plt.flameRedBright,
      ["@markup.heading.4"] = plt.sacredWhiteBright,
      ["@markup.heading.5"] = plt.judgmentRedBright,
      ["@markup.heading.6"] = plt.zealotAmberBright,
      ["@markup.quote"] = plt.ashGray,
      ["@markup.math"] = plt.divineWhite,
      ["@markup.link"] = plt.flameRed,
      ["@markup.link.label"] = plt.flameRedBright,
      ["@markup.link.url"] = plt.flameRed,
      ["@markup.raw"] = plt.consecratedBlueCore,
      ["@markup.raw.block"] = plt.consecratedBlueCore,
      ["@markup.list"] = plt.holyGoldCore,
      ["@markup.list.checked"] = plt.salvationGreenCore,
      ["@markup.list.unchecked"] = plt.ashGray,

      ["@diff.plus"] = plt.salvationGreenCore,
      ["@diff.minus"] = plt.crusaderRedCore,
      ["@diff.delta"] = plt.zealotAmberCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.flameRedCore,
      ["@constructor.javascript"] = plt.flameRedCore,
      ["@constructor.typescript"] = plt.flameRedCore,
      ["@namespace.rust"] = plt.flameRedCore,
      ["@type.qualifier.rust"] = plt.holyGoldCore,
      ["@constant.macro.c"] = plt.sanctifiedGold,
      ["@constant.macro.cpp"] = plt.sanctifiedGold,
      ["@namespace.go"] = plt.flameRedCore,
      ["@property.css"] = plt.consecratedBlueBright,
      ["@type.css"] = plt.holyGoldCore,
      ["@label.json"] = plt.sanctifiedGold,
      ["@field.yaml"] = plt.consecratedBlueBright,
      ["@property.toml"] = plt.consecratedBlueBright,
      ["@function.builtin.bash"] = plt.consecratedBlueCore,
      ["@string.regexp"] = plt.martyrPurple,
      ["@character.special.regex"] = plt.sanctifiedGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.flameRedCore,
      ["@lsp.type.interface"] = plt.flameRedCore,
      ["@lsp.type.struct"] = plt.flameRedCore,
      ["@lsp.type.enum"] = plt.flameRedCore,
      ["@lsp.type.enumMember"] = plt.divineWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.flameOrangeCore,

      ["@lsp.type.macro"] = plt.sanctifiedGold,
      ["@lsp.type.decorator"] = plt.sanctifiedGold,

      ["@lsp.type.builtinType"] = plt.flameRedCore,
      ["@lsp.type.selfParameter"] = plt.holyGoldBright,
      ["@lsp.type.typeParameter"] = plt.flameRedCore,

      ["@lsp.type.array"] = plt.flameRedCore,
      ["@lsp.type.object"] = plt.flameRedCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.divineWhiteCore,
      ["@lsp.type.enumConstant"] = plt.divineWhiteCore,

      ["@lsp.type.event"] = plt.flameRedCore,
      ["@lsp.type.regexp"] = plt.martyrPurple,
      ["@lsp.type.unresolvedReference"] = plt.flameOrangeCore,

      ["@lsp.mod.deprecated"] = { fg = plt.voidBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.divineWhiteCore,
      ["@lsp.mod.async"] = plt.holyGoldCore,
      ["@lsp.mod.static"] = plt.holyGoldBright,
      ["@lsp.mod.abstract"] = plt.flameRedCore,
      ["@lsp.mod.defaultLibrary"] = plt.flameRedCore,
      ["@lsp.mod.documentation"] = plt.ashGrayLight,
    },
  }
end

return {
  name = "Punk – Azrael",
  author = "PrismPunk.nvim",
  description = "Avenging angel — deep gold, deep blue, flame red, sacred judgment, divine wrath.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.ashGray,
    base04 = palette.ashGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.crusaderRedCore,
    base09 = palette.flameRedCore,
    base0A = palette.holyGoldCore,
    base0B = palette.consecratedBlueCore,
    base0C = palette.sacredWhiteCore,
    base0D = palette.holyGoldCore,
    base0E = palette.judgmentRedCore,
    base0F = palette.martyrPurpleCore,
  },

  palette = palette,
  get = M.get,
}
