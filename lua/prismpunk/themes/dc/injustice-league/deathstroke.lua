local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0A0A",
  bg_darker = "#121212",
  bg_dark = "#1A1A1A",
  bg_mid = "#242424",
  bg_light = "#2E2E2E",
  bg_lighter = "#383838",
  bg_lightest = "#424242",

  fg_lightest = "#E8E8E8",
  fg_light = "#C8C8C8",
  fg_mid = "#A8A8A8",
  fg_dark = "#888888",

  bg_alt1 = "#141414",
  bg_alt2 = "#0D0D0D",
  bg_alt3 = "#1F1F1F",
  bg_alt4 = "#0F0F0F",

  tacticalOrangeCore = "#FF6B35",
  tacticalOrange = "#FF6B35",
  tacticalOrangeBright = "#FF8C5E",
  tacticalOrangeDeep = "#E8551F",

  steelGray = "#708090",
  steelGrayBright = "#90A0B0",
  steelGrayCore = "#708090",
  steelGrayDeep = "#5A6A78",

  militaryGreen = "#4A5F4A",
  militaryGreenBright = "#608060",
  militaryGreenCore = "#4A5F4A",
  militaryGreenDeep = "#3A4A3A",

  lethalRed = "#B91C1C",
  lethalRedBright = "#DC2626",
  lethalRedCore = "#B91C1C",
  lethalRedDeep = "#991B1B",

  weaponSilver = "#B0B0B0",
  weaponSilverBright = "#D0D0D0",
  weaponSilverCore = "#B0B0B0",
  weaponSilverDeep = "#909090",

  shadowGray = "#606060",
  shadowGrayLight = "#787878",
  shadowGrayDark = "#484848",

  contractWhite = "#E8E8E8",
  contractWhiteCore = "#E8E8E8",
  contractWhiteBright = "#F5F5F5",

  armorBlack = "#2A2A2A",
  armorBlackBright = "#3A3A3A",
  armorBlackCore = "#2A2A2A",

  tacticalAmber = "#D97706",
  tacticalAmberBright = "#F59E0B",
  tacticalAmberCore = "#D97706",

  currentGray = "#606060",
  currentGrayLight = "#787878",

  missionGreen = "#059669",
  missionGreenCore = "#059669",
  missionGreenBright = "#10B981",

  scopeViolet = "#7C3AED",
  scopeVioletCore = "#7C3AED",

  voidBlack = "#0A0A0A",

  successGreen = "#059669",
  errorRed = "#B91C1C",
  warningAmber = "#D97706",
  infoBlue = "#708090",

  seaweedGreenCore = "#059669",
  anglerYellowCore = "#D97706",
  anemoneRedCore = "#B91C1C",

  coralPink = "#FF6B35",
  coralPinkBright = "#FF8C5E",
  coralPinkCore = "#FF6B35",
  coralPinkDeep = "#E8551F",

  pressureWhite = "#E8E8E8",
  pressureWhiteCore = "#E8E8E8",
  pressureWhiteBright = "#F5F5F5",

  depthBlack = "#0A0A0A",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.tacticalOrangeCore,
      insert = plt.steelGrayCore,
      visual = plt.militaryGreenCore,
      replace = plt.lethalRedCore,
      command = plt.weaponSilverCore,
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
      bg_search = plt.tacticalAmberDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.tacticalOrangeBright,
      header2 = plt.steelGrayBright,
      special = plt.lethalRed,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.tacticalOrangeCore,
      picker = plt.tacticalOrange,
      yank = plt.weaponSilverBright,
      mark = plt.militaryGreen,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.tacticalOrangeBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.tacticalOrangeCore,
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
      accent1 = plt.tacticalOrangeCore,
      accent2 = plt.steelGrayCore,
      accent3 = plt.militaryGreenCore,
      accent4 = plt.lethalRedCore,
      accent5 = plt.weaponSilverCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.tacticalOrangeBright,
      rainbow2 = plt.steelGrayBright,
      rainbow3 = plt.militaryGreenBright,
      rainbow4 = plt.lethalRedBright,
      rainbow5 = plt.weaponSilverBright,
      rainbow6 = plt.tacticalAmberBright,
      rainbow7 = plt.missionGreenBright,
    },

    syn = {
      attribute = plt.tacticalAmber,
      boolean = plt.militaryGreen,
      comment = plt.shadowGray,
      constant = plt.contractWhite,
      deprecated = plt.voidBlack,
      func = plt.steelGrayCore,
      identifier = plt.fg_lightest,
      keyword = plt.tacticalOrangeCore,
      method = plt.steelGrayBright,
      number = plt.contractWhite,
      operator = plt.tacticalOrangeCore,
      parameter = plt.fg_mid,
      preproc = plt.lethalRedCore,
      punct = plt.fg_dark,
      regex = plt.scopeViolet,
      statement = plt.tacticalOrangeCore,
      string = plt.steelGrayCore,
      symbol = plt.tacticalAmber,
      type = plt.militaryGreenCore,
      variable = plt.fg_lightest,
      special = plt.lethalRed,
      special2 = plt.weaponSilver,
      special3 = plt.missionGreen,
    },

    vcs = {
      added = plt.missionGreenCore,
      removed = plt.lethalRedCore,
      changed = plt.tacticalAmberCore,
    },

    diff = {
      add = plt.missionGreenCore,
      change = plt.tacticalAmberCore,
      delete = plt.lethalRedCore,
      text = plt.lethalRed,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.lethalRed,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.lethalRedCore,
      green = plt.militaryGreenCore,
      yellow = plt.tacticalAmberCore,
      blue = plt.steelGrayCore,
      magenta = plt.scopeVioletCore,
      cyan = plt.weaponSilverCore,
      white = plt.contractWhiteCore,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.lethalRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.militaryGreenBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.tacticalAmberBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.steelGrayBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.scopeVioletCore):brighten(0.15):to_hex(),
      cyan_bright = color(plt.weaponSilverBright):brighten(0.15):to_hex(),
      white_bright = plt.contractWhiteBright,
      indexed1 = plt.tacticalOrange,
      indexed2 = plt.lethalRed,
    },

    treesitter = {
      ["@comment"] = plt.shadowGray,
      ["@comment.documentation"] = plt.shadowGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.tacticalAmberBright,
      ["@comment.note"] = plt.lethalRed,

      ["@constant"] = plt.contractWhite,
      ["@constant.builtin"] = plt.contractWhiteCore,
      ["@constant.macro"] = plt.tacticalAmber,

      ["@string"] = plt.steelGrayCore,
      ["@string.documentation"] = plt.steelGrayCore,
      ["@string.regex"] = plt.scopeViolet,
      ["@string.escape"] = plt.tacticalOrangeBright,
      ["@string.special"] = plt.steelGrayBright,
      ["@string.special.symbol"] = plt.tacticalAmber,
      ["@string.special.url"] = plt.militaryGreen,
      ["@string.special.path"] = plt.steelGrayCore,

      ["@character"] = plt.steelGrayCore,
      ["@character.special"] = plt.tacticalAmber,

      ["@number"] = plt.contractWhite,
      ["@number.float"] = plt.contractWhiteCore,

      ["@boolean"] = plt.militaryGreen,

      ["@function"] = plt.steelGrayCore,
      ["@function.builtin"] = plt.steelGrayCore,
      ["@function.call"] = plt.steelGrayCore,
      ["@function.macro"] = plt.lethalRedCore,
      ["@function.method"] = plt.steelGrayBright,
      ["@function.method.call"] = plt.steelGrayBright,

      ["@constructor"] = plt.militaryGreenCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.tacticalOrangeCore,
      ["@keyword.coroutine"] = plt.lethalRedCore,
      ["@keyword.function"] = plt.tacticalOrangeCore,
      ["@keyword.operator"] = plt.tacticalOrangeCore,
      ["@keyword.return"] = plt.tacticalOrangeCore,
      ["@keyword.import"] = plt.lethalRedCore,
      ["@keyword.storage"] = plt.tacticalOrangeCore,
      ["@keyword.repeat"] = plt.tacticalOrangeCore,
      ["@keyword.conditional"] = plt.tacticalOrangeCore,
      ["@keyword.exception"] = plt.lethalRedCore,
      ["@keyword.directive"] = plt.lethalRedCore,
      ["@keyword.directive.define"] = plt.lethalRedCore,

      ["@conditional"] = plt.tacticalOrangeCore,
      ["@conditional.ternary"] = plt.tacticalOrangeCore,

      ["@repeat"] = plt.tacticalOrangeCore,

      ["@label"] = plt.tacticalAmber,

      ["@operator"] = plt.tacticalOrangeCore,

      ["@exception"] = plt.lethalRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.tacticalOrangeBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.militaryGreenCore,
      ["@type.builtin"] = plt.militaryGreenCore,
      ["@type.definition"] = plt.militaryGreenCore,
      ["@type.qualifier"] = plt.tacticalOrangeCore,

      ["@attribute"] = plt.tacticalAmber,
      ["@attribute.builtin"] = plt.tacticalAmber,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.militaryGreenCore,
      ["@module.builtin"] = plt.militaryGreenCore,

      ["@namespace"] = plt.militaryGreenCore,
      ["@namespace.builtin"] = plt.militaryGreenCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.tacticalOrangeCore,

      ["@tag"] = plt.tacticalOrangeCore,
      ["@tag.attribute"] = plt.tacticalAmber,
      ["@tag.delimiter"] = plt.tacticalOrangeCore,
      ["@tag.builtin"] = plt.tacticalOrangeCore,

      ["@markup.strong"] = { fg = plt.tacticalOrangeBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.shadowGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.lethalRed, underline = true },
      ["@markup.heading"] = plt.tacticalOrangeBright,
      ["@markup.heading.1"] = plt.tacticalOrangeBright,
      ["@markup.heading.2"] = plt.steelGrayBright,
      ["@markup.heading.3"] = plt.militaryGreenBright,
      ["@markup.heading.4"] = plt.lethalRedBright,
      ["@markup.heading.5"] = plt.weaponSilverBright,
      ["@markup.heading.6"] = plt.tacticalAmberBright,
      ["@markup.quote"] = plt.shadowGray,
      ["@markup.math"] = plt.contractWhite,
      ["@markup.link"] = plt.militaryGreen,
      ["@markup.link.label"] = plt.militaryGreenBright,
      ["@markup.link.url"] = plt.militaryGreen,
      ["@markup.raw"] = plt.steelGrayCore,
      ["@markup.raw.block"] = plt.steelGrayCore,
      ["@markup.list"] = plt.tacticalOrangeCore,
      ["@markup.list.checked"] = plt.missionGreenCore,
      ["@markup.list.unchecked"] = plt.shadowGray,

      ["@diff.plus"] = plt.missionGreenCore,
      ["@diff.minus"] = plt.lethalRedCore,
      ["@diff.delta"] = plt.tacticalAmberCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.militaryGreenCore,
      ["@constructor.javascript"] = plt.militaryGreenCore,
      ["@constructor.typescript"] = plt.militaryGreenCore,
      ["@namespace.rust"] = plt.militaryGreenCore,
      ["@type.qualifier.rust"] = plt.tacticalOrangeCore,
      ["@constant.macro.c"] = plt.tacticalAmber,
      ["@constant.macro.cpp"] = plt.tacticalAmber,
      ["@namespace.go"] = plt.militaryGreenCore,
      ["@property.css"] = plt.steelGrayBright,
      ["@type.css"] = plt.tacticalOrangeCore,
      ["@label.json"] = plt.tacticalAmber,
      ["@field.yaml"] = plt.steelGrayBright,
      ["@property.toml"] = plt.steelGrayBright,
      ["@function.builtin.bash"] = plt.steelGrayCore,
      ["@string.regexp"] = plt.scopeViolet,
      ["@character.special.regex"] = plt.tacticalAmber,
    },

    lsp = {
      ["@lsp.type.class"] = plt.militaryGreenCore,
      ["@lsp.type.interface"] = plt.militaryGreenCore,
      ["@lsp.type.struct"] = plt.militaryGreenCore,
      ["@lsp.type.enum"] = plt.militaryGreenCore,
      ["@lsp.type.enumMember"] = plt.contractWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.militaryGreenCore,

      ["@lsp.type.macro"] = plt.tacticalAmber,
      ["@lsp.type.decorator"] = plt.tacticalAmber,

      ["@lsp.type.builtinType"] = plt.militaryGreenCore,
      ["@lsp.type.selfParameter"] = plt.tacticalOrangeBright,
      ["@lsp.type.typeParameter"] = plt.militaryGreenCore,

      ["@lsp.type.array"] = plt.militaryGreenCore,
      ["@lsp.type.object"] = plt.militaryGreenCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.contractWhiteCore,
      ["@lsp.type.enumConstant"] = plt.contractWhiteCore,

      ["@lsp.type.event"] = plt.militaryGreenCore,
      ["@lsp.type.regexp"] = plt.scopeViolet,
      ["@lsp.type.unresolvedReference"] = plt.militaryGreenCore,

      ["@lsp.mod.deprecated"] = { fg = plt.voidBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.contractWhiteCore,
      ["@lsp.mod.async"] = plt.tacticalOrangeCore,
      ["@lsp.mod.static"] = plt.tacticalOrangeBright,
      ["@lsp.mod.abstract"] = plt.militaryGreenCore,
      ["@lsp.mod.defaultLibrary"] = plt.militaryGreenCore,
      ["@lsp.mod.documentation"] = plt.shadowGrayLight,
    },
  }
end

return {
  name = "Injustice League – Deathstroke",
  author = "PrismPunk.nvim",
  description = "Contract accepted — tactical orange, steel gray, lethal precision, mercenary efficiency.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.shadowGray,
    base04 = palette.shadowGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.lethalRedCore,
    base09 = palette.tacticalAmberCore,
    base0A = palette.tacticalOrangeCore,
    base0B = palette.steelGrayCore,
    base0C = palette.militaryGreenCore,
    base0D = palette.tacticalOrangeCore,
    base0E = palette.lethalRedCore,
    base0F = palette.scopeVioletCore,
  },

  palette = palette,
  get = M.get,
}
