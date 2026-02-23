local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0A0D",
  bg_darker = "#0F0F14",
  bg_dark = "#15151A",
  bg_mid = "#1B1B22",
  bg_light = "#22222A",
  bg_lighter = "#2A2A33",
  bg_lightest = "#33333D",

  fg_lightest = "#F0F0F5",
  fg_light = "#D8D8E0",
  fg_mid = "#C0C0CC",
  fg_dark = "#A8A8B8",

  bg_alt1 = "#121216",
  bg_alt2 = "#0D0D10",
  bg_alt3 = "#18181E",
  bg_alt4 = "#0E0E12",

  lightningWhiteCore = "#E8F0FF",
  lightningWhite = "#E8F0FF",
  lightningWhiteBright = "#FFFFFF",
  lightningWhiteDeep = "#D0E0F5",

  egyptianGold = "#FFD700",
  egyptianGoldBright = "#FFE55C",
  egyptianGoldCore = "#FFD700",
  egyptianGoldDeep = "#DAB600",

  thunderPurple = "#6B4FBB",
  thunderPurpleBright = "#8B6FDD",
  thunderPurpleCore = "#6B4FBB",
  thunderPurpleDeep = "#4B2F9B",

  ruthlessRed = "#C41E3A",
  ruthlessRedBright = "#E4384A",
  ruthlessRedCore = "#C41E3A",
  ruthlessRedDeep = "#A40E2A",

  divineBlue = "#4169E1",
  divineBlueBright = "#6A8FF5",
  divineBlueCore = "#4169E1",
  divineBlueDeep = "#2149C1",

  ancientGray = "#707078",
  ancientGrayLight = "#909098",
  ancientGrayDark = "#505058",

  throneGold = "#D4AF37",
  throneGoldBright = "#F4CF57",
  throneGoldCore = "#D4AF37",

  blackSuit = "#1A1A1D",
  blackSuitBright = "#2A2A2D",
  blackSuitCore = "#1A1A1D",

  kahndaqAmber = "#FF8C00",
  kahndaqAmberBright = "#FFAA33",
  kahndaqAmberCore = "#FF8C00",

  stormGray = "#808090",
  stormGrayLight = "#A0A0B0",
  stormGrayDark = "#606070",

  currentGray = "#707078",
  currentGrayLight = "#909098",

  templeGreen = "#2E8B57",
  templeGreenCore = "#2E8B57",
  templeGreenBright = "#4EAB77",

  magicViolet = "#9370DB",
  magicVioletCore = "#9370DB",

  voidBlack = "#0A0A0D",

  successGreen = "#2E8B57",
  errorRed = "#C41E3A",
  warningAmber = "#FF8C00",
  infoBlue = "#4169E1",

  seaweedGreenCore = "#2E8B57",
  anglerYellowCore = "#FF8C00",
  anemoneRedCore = "#C41E3A",

  coralPink = "#FFD700",
  coralPinkBright = "#FFE55C",
  coralPinkCore = "#FFD700",
  coralPinkDeep = "#DAB600",

  pressureWhite = "#F0F0F5",
  pressureWhiteCore = "#F0F0F5",
  pressureWhiteBright = "#FFFFFF",

  depthBlack = "#0A0A0D",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.egyptianGoldCore,
      insert = plt.lightningWhiteCore,
      visual = plt.thunderPurpleCore,
      replace = plt.ruthlessRedCore,
      command = plt.divineBlueCore,
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
      bg_search = plt.kahndaqAmberDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.egyptianGoldBright,
      header2 = plt.lightningWhiteBright,
      special = plt.thunderPurple,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.egyptianGoldCore,
      picker = plt.throneGold,
      yank = plt.lightningWhiteBright,
      mark = plt.thunderPurple,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.egyptianGoldBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.egyptianGoldCore,
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
      accent1 = plt.egyptianGoldCore,
      accent2 = plt.lightningWhiteCore,
      accent3 = plt.thunderPurpleCore,
      accent4 = plt.ruthlessRedCore,
      accent5 = plt.divineBlueCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.egyptianGoldBright,
      rainbow2 = plt.lightningWhiteBright,
      rainbow3 = plt.thunderPurpleBright,
      rainbow4 = plt.divineBlueBright,
      rainbow5 = plt.ruthlessRedBright,
      rainbow6 = plt.throneGoldBright,
      rainbow7 = plt.kahndaqAmberBright,
    },

    syn = {
      attribute = plt.throneGold,
      boolean = plt.divineBlue,
      comment = plt.ancientGray,
      constant = plt.lightningWhite,
      deprecated = plt.voidBlack,
      func = plt.egyptianGoldCore,
      identifier = plt.fg_lightest,
      keyword = plt.lightningWhiteCore,
      method = plt.egyptianGoldBright,
      number = plt.lightningWhite,
      operator = plt.divineBlueCore,
      parameter = plt.fg_mid,
      preproc = plt.thunderPurpleCore,
      punct = plt.fg_dark,
      regex = plt.magicViolet,
      statement = plt.lightningWhiteCore,
      string = plt.egyptianGoldCore,
      symbol = plt.throneGold,
      type = plt.thunderPurpleCore,
      variable = plt.fg_lightest,
      special = plt.ruthlessRed,
      special2 = plt.kahndaqAmber,
      special3 = plt.templeGreen,
    },

    vcs = {
      added = plt.templeGreenCore,
      removed = plt.ruthlessRedCore,
      changed = plt.kahndaqAmberCore,
    },

    diff = {
      add = plt.templeGreenCore,
      change = plt.kahndaqAmberCore,
      delete = plt.ruthlessRedCore,
      text = plt.thunderPurple,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.thunderPurple,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.ruthlessRedCore,
      green = plt.templeGreenCore,
      yellow = plt.egyptianGoldCore,
      blue = plt.divineBlueCore,
      magenta = plt.thunderPurpleCore,
      cyan = plt.lightningWhiteCore,
      white = plt.fg_lightest,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.ruthlessRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.templeGreenBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.egyptianGoldBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.divineBlueBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.thunderPurpleBright):brighten(0.15):to_hex(),
      cyan_bright = color(plt.lightningWhiteBright):brighten(0.15):to_hex(),
      white_bright = plt.lightningWhiteBright,
      indexed1 = plt.egyptianGold,
      indexed2 = plt.ruthlessRed,
    },

    treesitter = {
      ["@comment"] = plt.ancientGray,
      ["@comment.documentation"] = plt.ancientGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.kahndaqAmberBright,
      ["@comment.note"] = plt.thunderPurple,

      ["@constant"] = plt.lightningWhite,
      ["@constant.builtin"] = plt.lightningWhiteCore,
      ["@constant.macro"] = plt.throneGold,

      ["@string"] = plt.egyptianGoldCore,
      ["@string.documentation"] = plt.egyptianGoldCore,
      ["@string.regex"] = plt.magicViolet,
      ["@string.escape"] = plt.lightningWhiteBright,
      ["@string.special"] = plt.egyptianGoldBright,
      ["@string.special.symbol"] = plt.throneGold,
      ["@string.special.url"] = plt.divineBlue,
      ["@string.special.path"] = plt.egyptianGoldCore,

      ["@character"] = plt.egyptianGoldCore,
      ["@character.special"] = plt.throneGold,

      ["@number"] = plt.lightningWhite,
      ["@number.float"] = plt.lightningWhiteCore,

      ["@boolean"] = plt.divineBlue,

      ["@function"] = plt.egyptianGoldCore,
      ["@function.builtin"] = plt.egyptianGoldCore,
      ["@function.call"] = plt.egyptianGoldCore,
      ["@function.macro"] = plt.thunderPurpleCore,
      ["@function.method"] = plt.egyptianGoldBright,
      ["@function.method.call"] = plt.egyptianGoldBright,

      ["@constructor"] = plt.thunderPurpleCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.lightningWhiteCore,
      ["@keyword.coroutine"] = plt.thunderPurpleCore,
      ["@keyword.function"] = plt.lightningWhiteCore,
      ["@keyword.operator"] = plt.divineBlueCore,
      ["@keyword.return"] = plt.lightningWhiteCore,
      ["@keyword.import"] = plt.thunderPurpleCore,
      ["@keyword.storage"] = plt.lightningWhiteCore,
      ["@keyword.repeat"] = plt.lightningWhiteCore,
      ["@keyword.conditional"] = plt.lightningWhiteCore,
      ["@keyword.exception"] = plt.ruthlessRedCore,
      ["@keyword.directive"] = plt.thunderPurpleCore,
      ["@keyword.directive.define"] = plt.thunderPurpleCore,

      ["@conditional"] = plt.lightningWhiteCore,
      ["@conditional.ternary"] = plt.lightningWhiteCore,

      ["@repeat"] = plt.lightningWhiteCore,

      ["@label"] = plt.throneGold,

      ["@operator"] = plt.divineBlueCore,

      ["@exception"] = plt.ruthlessRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.lightningWhiteBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.thunderPurpleCore,
      ["@type.builtin"] = plt.thunderPurpleCore,
      ["@type.definition"] = plt.thunderPurpleCore,
      ["@type.qualifier"] = plt.lightningWhiteCore,

      ["@attribute"] = plt.throneGold,
      ["@attribute.builtin"] = plt.throneGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.thunderPurpleCore,
      ["@module.builtin"] = plt.thunderPurpleCore,

      ["@namespace"] = plt.thunderPurpleCore,
      ["@namespace.builtin"] = plt.thunderPurpleCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.divineBlueCore,

      ["@tag"] = plt.lightningWhiteCore,
      ["@tag.attribute"] = plt.throneGold,
      ["@tag.delimiter"] = plt.divineBlueCore,
      ["@tag.builtin"] = plt.lightningWhiteCore,

      ["@markup.strong"] = { fg = plt.egyptianGoldBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.ancientGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.thunderPurple, underline = true },
      ["@markup.heading"] = plt.egyptianGoldBright,
      ["@markup.heading.1"] = plt.egyptianGoldBright,
      ["@markup.heading.2"] = plt.lightningWhiteBright,
      ["@markup.heading.3"] = plt.thunderPurpleBright,
      ["@markup.heading.4"] = plt.divineBlueBright,
      ["@markup.heading.5"] = plt.ruthlessRedBright,
      ["@markup.heading.6"] = plt.throneGoldBright,
      ["@markup.quote"] = plt.ancientGray,
      ["@markup.math"] = plt.lightningWhite,
      ["@markup.link"] = plt.divineBlue,
      ["@markup.link.label"] = plt.divineBlueBright,
      ["@markup.link.url"] = plt.divineBlue,
      ["@markup.raw"] = plt.egyptianGoldCore,
      ["@markup.raw.block"] = plt.egyptianGoldCore,
      ["@markup.list"] = plt.lightningWhiteCore,
      ["@markup.list.checked"] = plt.templeGreenCore,
      ["@markup.list.unchecked"] = plt.ancientGray,

      ["@diff.plus"] = plt.templeGreenCore,
      ["@diff.minus"] = plt.ruthlessRedCore,
      ["@diff.delta"] = plt.kahndaqAmberCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.thunderPurpleCore,
      ["@constructor.javascript"] = plt.thunderPurpleCore,
      ["@constructor.typescript"] = plt.thunderPurpleCore,
      ["@namespace.rust"] = plt.thunderPurpleCore,
      ["@type.qualifier.rust"] = plt.lightningWhiteCore,
      ["@constant.macro.c"] = plt.throneGold,
      ["@constant.macro.cpp"] = plt.throneGold,
      ["@namespace.go"] = plt.thunderPurpleCore,
      ["@property.css"] = plt.egyptianGoldBright,
      ["@type.css"] = plt.lightningWhiteCore,
      ["@label.json"] = plt.throneGold,
      ["@field.yaml"] = plt.egyptianGoldBright,
      ["@property.toml"] = plt.egyptianGoldBright,
      ["@function.builtin.bash"] = plt.egyptianGoldCore,
      ["@string.regexp"] = plt.magicViolet,
      ["@character.special.regex"] = plt.throneGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.thunderPurpleCore,
      ["@lsp.type.interface"] = plt.thunderPurpleCore,
      ["@lsp.type.struct"] = plt.thunderPurpleCore,
      ["@lsp.type.enum"] = plt.thunderPurpleCore,
      ["@lsp.type.enumMember"] = plt.lightningWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.thunderPurpleCore,

      ["@lsp.type.macro"] = plt.throneGold,
      ["@lsp.type.decorator"] = plt.throneGold,

      ["@lsp.type.builtinType"] = plt.thunderPurpleCore,
      ["@lsp.type.selfParameter"] = plt.egyptianGoldBright,
      ["@lsp.type.typeParameter"] = plt.thunderPurpleCore,

      ["@lsp.type.array"] = plt.thunderPurpleCore,
      ["@lsp.type.object"] = plt.thunderPurpleCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.lightningWhiteCore,
      ["@lsp.type.enumConstant"] = plt.lightningWhiteCore,

      ["@lsp.type.event"] = plt.thunderPurpleCore,
      ["@lsp.type.regexp"] = plt.magicViolet,
      ["@lsp.type.unresolvedReference"] = plt.thunderPurpleCore,

      ["@lsp.mod.deprecated"] = { fg = plt.voidBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.lightningWhiteCore,
      ["@lsp.mod.async"] = plt.lightningWhiteCore,
      ["@lsp.mod.static"] = plt.egyptianGoldBright,
      ["@lsp.mod.abstract"] = plt.thunderPurpleCore,
      ["@lsp.mod.defaultLibrary"] = plt.thunderPurpleCore,
      ["@lsp.mod.documentation"] = plt.ancientGrayLight,
    },
  }
end

return {
  name = "Injustice League – Black Adam",
  author = "PrismPunk.nvim",
  description = "Ancient godlike power — lightning white, Egyptian gold, thunder purple, ruthless justice.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.ancientGray,
    base04 = palette.ancientGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.ruthlessRedCore,
    base09 = palette.kahndaqAmberCore,
    base0A = palette.egyptianGoldCore,
    base0B = palette.egyptianGoldCore,
    base0C = palette.divineBlueCore,
    base0D = palette.lightningWhiteCore,
    base0E = palette.thunderPurpleCore,
    base0F = palette.magicVioletCore,
  },

  palette = palette,
  get = M.get,
}
