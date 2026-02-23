local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0D0A",
  bg_darker = "#0F130F",
  bg_dark = "#141A14",
  bg_mid = "#1A211A",
  bg_light = "#202820",
  bg_lighter = "#263026",
  bg_lightest = "#2D382D",

  fg_lightest = "#E8F5E8",
  fg_light = "#C8E0C8",
  fg_mid = "#A8CAA8",
  fg_dark = "#88B488",

  bg_alt1 = "#121612",
  bg_alt2 = "#0C0F0C",
  bg_alt3 = "#181E18",
  bg_alt4 = "#0E110E",

  lexcorpGreenCore = "#00A86B",
  lexcorpGreen = "#00A86B",
  lexcorpGreenBright = "#00C87F",
  lexcorpGreenDeep = "#008858",

  techPurple = "#7C3AED",
  techPurpleBright = "#9D5CFF",
  techPurpleCore = "#7C3AED",
  techPurpleDeep = "#6221C4",

  kryptoniteGreen = "#00FF7F",
  kryptoniteGreenBright = "#5AFFAA",
  kryptoniteGreenCore = "#00FF7F",
  kryptoniteGreenDeep = "#00D96B",

  wealthGold = "#FFD700",
  wealthGoldBright = "#FFE55C",
  wealthGoldCore = "#FFD700",
  wealthGoldDeep = "#DAB600",

  intellectBlue = "#4A9EFF",
  intellectBlueBright = "#7AB8FF",
  intellectBlueCore = "#4A9EFF",
  intellectBlueDeep = "#3580D9",

  powerSuitSilver = "#B8C5D0",
  powerSuitSilverBright = "#D4E0EB",
  powerSuitSilverCore = "#B8C5D0",
  powerSuitSilverDeep = "#9CAAB5",

  executiveGray = "#6B7C6B",
  executiveGrayLight = "#85A885",
  executiveGrayDark = "#546854",

  corporateWhite = "#E8F5E8",
  corporateWhiteCore = "#E8F5E8",
  corporateWhiteBright = "#F5FFF5",

  boardroomBlue = "#2563EB",
  boardroomBlueBright = "#3B82F6",
  boardroomBlueCore = "#2563EB",

  ambitionAmber = "#F59E0B",
  ambitionAmberBright = "#FCD34D",
  ambitionAmberCore = "#F59E0B",

  rivalryRed = "#DC2626",
  rivalryRedBright = "#EF4444",
  rivalryRedCore = "#DC2626",

  currentGray = "#6B7C6B",
  currentGrayLight = "#85A885",

  innovationGreen = "#10B981",
  innovationGreenCore = "#10B981",
  innovationGreenBright = "#34D399",

  algorithmViolet = "#8B5CF6",
  algorithmVioletCore = "#8B5CF6",

  voidBlack = "#0A0D0A",

  successGreen = "#10B981",
  errorRed = "#DC2626",
  warningAmber = "#F59E0B",
  infoBlue = "#4A9EFF",

  seaweedGreenCore = "#10B981",
  anglerYellowCore = "#F59E0B",
  anemoneRedCore = "#DC2626",

  coralPink = "#00A86B",
  coralPinkBright = "#00C87F",
  coralPinkCore = "#00A86B",
  coralPinkDeep = "#008858",

  pressureWhite = "#E8F5E8",
  pressureWhiteCore = "#E8F5E8",
  pressureWhiteBright = "#F5FFF5",

  depthBlack = "#0A0D0A",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.lexcorpGreenCore,
      insert = plt.techPurpleCore,
      visual = plt.kryptoniteGreenCore,
      replace = plt.rivalryRedCore,
      command = plt.wealthGoldCore,
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
      bg_search = plt.ambitionAmberDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.lexcorpGreenBright,
      header2 = plt.techPurpleBright,
      special = plt.wealthGold,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.lexcorpGreenCore,
      picker = plt.kryptoniteGreen,
      yank = plt.wealthGoldBright,
      mark = plt.intellectBlue,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.lexcorpGreenBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.lexcorpGreenCore,
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
      accent1 = plt.lexcorpGreenCore,
      accent2 = plt.techPurpleCore,
      accent3 = plt.kryptoniteGreenCore,
      accent4 = plt.wealthGoldCore,
      accent5 = plt.intellectBlueCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.lexcorpGreenBright,
      rainbow2 = plt.techPurpleBright,
      rainbow3 = plt.kryptoniteGreenBright,
      rainbow4 = plt.wealthGoldBright,
      rainbow5 = plt.intellectBlueBright,
      rainbow6 = plt.powerSuitSilverBright,
      rainbow7 = plt.boardroomBlueBright,
    },

    syn = {
      attribute = plt.wealthGold,
      boolean = plt.intellectBlue,
      comment = plt.executiveGray,
      constant = plt.corporateWhite,
      deprecated = plt.voidBlack,
      func = plt.techPurpleCore,
      identifier = plt.fg_lightest,
      keyword = plt.lexcorpGreenCore,
      method = plt.techPurpleBright,
      number = plt.corporateWhite,
      operator = plt.intellectBlueCore,
      parameter = plt.fg_mid,
      preproc = plt.kryptoniteGreenCore,
      punct = plt.fg_dark,
      regex = plt.algorithmViolet,
      statement = plt.lexcorpGreenCore,
      string = plt.techPurpleCore,
      symbol = plt.wealthGold,
      type = plt.kryptoniteGreenCore,
      variable = plt.fg_lightest,
      special = plt.wealthGold,
      special2 = plt.powerSuitSilver,
      special3 = plt.boardroomBlue,
    },

    vcs = {
      added = plt.innovationGreenCore,
      removed = plt.rivalryRedCore,
      changed = plt.ambitionAmberCore,
    },

    diff = {
      add = plt.innovationGreenCore,
      change = plt.ambitionAmberCore,
      delete = plt.rivalryRedCore,
      text = plt.wealthGold,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.wealthGold,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.rivalryRedCore,
      green = plt.lexcorpGreenCore,
      yellow = plt.wealthGoldCore,
      blue = plt.intellectBlueCore,
      magenta = plt.techPurpleCore,
      cyan = plt.kryptoniteGreenCore,
      white = plt.corporateWhiteCore,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.rivalryRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.lexcorpGreenBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.wealthGoldBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.intellectBlueBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.techPurpleBright):brighten(0.15):to_hex(),
      cyan_bright = color(plt.kryptoniteGreenBright):brighten(0.15):to_hex(),
      white_bright = plt.corporateWhiteBright,
      indexed1 = plt.lexcorpGreen,
      indexed2 = plt.wealthGold,
    },

    treesitter = {
      ["@comment"] = plt.executiveGray,
      ["@comment.documentation"] = plt.executiveGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.ambitionAmberBright,
      ["@comment.note"] = plt.wealthGold,

      ["@constant"] = plt.corporateWhite,
      ["@constant.builtin"] = plt.corporateWhiteCore,
      ["@constant.macro"] = plt.wealthGold,

      ["@string"] = plt.techPurpleCore,
      ["@string.documentation"] = plt.techPurpleCore,
      ["@string.regex"] = plt.algorithmViolet,
      ["@string.escape"] = plt.kryptoniteGreenBright,
      ["@string.special"] = plt.techPurpleBright,
      ["@string.special.symbol"] = plt.wealthGold,
      ["@string.special.url"] = plt.intellectBlue,
      ["@string.special.path"] = plt.techPurpleCore,

      ["@character"] = plt.techPurpleCore,
      ["@character.special"] = plt.wealthGold,

      ["@number"] = plt.corporateWhite,
      ["@number.float"] = plt.corporateWhiteCore,

      ["@boolean"] = plt.intellectBlue,

      ["@function"] = plt.techPurpleCore,
      ["@function.builtin"] = plt.techPurpleCore,
      ["@function.call"] = plt.techPurpleCore,
      ["@function.macro"] = plt.kryptoniteGreenCore,
      ["@function.method"] = plt.techPurpleBright,
      ["@function.method.call"] = plt.techPurpleBright,

      ["@constructor"] = plt.kryptoniteGreenCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.lexcorpGreenCore,
      ["@keyword.coroutine"] = plt.kryptoniteGreenCore,
      ["@keyword.function"] = plt.lexcorpGreenCore,
      ["@keyword.operator"] = plt.intellectBlueCore,
      ["@keyword.return"] = plt.lexcorpGreenCore,
      ["@keyword.import"] = plt.kryptoniteGreenCore,
      ["@keyword.storage"] = plt.lexcorpGreenCore,
      ["@keyword.repeat"] = plt.lexcorpGreenCore,
      ["@keyword.conditional"] = plt.lexcorpGreenCore,
      ["@keyword.exception"] = plt.rivalryRedCore,
      ["@keyword.directive"] = plt.kryptoniteGreenCore,
      ["@keyword.directive.define"] = plt.kryptoniteGreenCore,

      ["@conditional"] = plt.lexcorpGreenCore,
      ["@conditional.ternary"] = plt.lexcorpGreenCore,

      ["@repeat"] = plt.lexcorpGreenCore,

      ["@label"] = plt.wealthGold,

      ["@operator"] = plt.intellectBlueCore,

      ["@exception"] = plt.rivalryRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.lexcorpGreenBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.kryptoniteGreenCore,
      ["@type.builtin"] = plt.kryptoniteGreenCore,
      ["@type.definition"] = plt.kryptoniteGreenCore,
      ["@type.qualifier"] = plt.lexcorpGreenCore,

      ["@attribute"] = plt.wealthGold,
      ["@attribute.builtin"] = plt.wealthGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.kryptoniteGreenCore,
      ["@module.builtin"] = plt.kryptoniteGreenCore,

      ["@namespace"] = plt.kryptoniteGreenCore,
      ["@namespace.builtin"] = plt.kryptoniteGreenCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.intellectBlueCore,

      ["@tag"] = plt.lexcorpGreenCore,
      ["@tag.attribute"] = plt.wealthGold,
      ["@tag.delimiter"] = plt.intellectBlueCore,
      ["@tag.builtin"] = plt.lexcorpGreenCore,

      ["@markup.strong"] = { fg = plt.lexcorpGreenBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.executiveGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.wealthGold, underline = true },
      ["@markup.heading"] = plt.lexcorpGreenBright,
      ["@markup.heading.1"] = plt.lexcorpGreenBright,
      ["@markup.heading.2"] = plt.techPurpleBright,
      ["@markup.heading.3"] = plt.kryptoniteGreenBright,
      ["@markup.heading.4"] = plt.wealthGoldBright,
      ["@markup.heading.5"] = plt.intellectBlueBright,
      ["@markup.heading.6"] = plt.powerSuitSilverBright,
      ["@markup.quote"] = plt.executiveGray,
      ["@markup.math"] = plt.corporateWhite,
      ["@markup.link"] = plt.intellectBlue,
      ["@markup.link.label"] = plt.intellectBlueBright,
      ["@markup.link.url"] = plt.intellectBlue,
      ["@markup.raw"] = plt.techPurpleCore,
      ["@markup.raw.block"] = plt.techPurpleCore,
      ["@markup.list"] = plt.lexcorpGreenCore,
      ["@markup.list.checked"] = plt.innovationGreenCore,
      ["@markup.list.unchecked"] = plt.executiveGray,

      ["@diff.plus"] = plt.innovationGreenCore,
      ["@diff.minus"] = plt.rivalryRedCore,
      ["@diff.delta"] = plt.ambitionAmberCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.kryptoniteGreenCore,
      ["@constructor.javascript"] = plt.kryptoniteGreenCore,
      ["@constructor.typescript"] = plt.kryptoniteGreenCore,
      ["@namespace.rust"] = plt.kryptoniteGreenCore,
      ["@type.qualifier.rust"] = plt.lexcorpGreenCore,
      ["@constant.macro.c"] = plt.wealthGold,
      ["@constant.macro.cpp"] = plt.wealthGold,
      ["@namespace.go"] = plt.kryptoniteGreenCore,
      ["@property.css"] = plt.techPurpleBright,
      ["@type.css"] = plt.lexcorpGreenCore,
      ["@label.json"] = plt.wealthGold,
      ["@field.yaml"] = plt.techPurpleBright,
      ["@property.toml"] = plt.techPurpleBright,
      ["@function.builtin.bash"] = plt.techPurpleCore,
      ["@string.regexp"] = plt.algorithmViolet,
      ["@character.special.regex"] = plt.wealthGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.kryptoniteGreenCore,
      ["@lsp.type.interface"] = plt.kryptoniteGreenCore,
      ["@lsp.type.struct"] = plt.kryptoniteGreenCore,
      ["@lsp.type.enum"] = plt.kryptoniteGreenCore,
      ["@lsp.type.enumMember"] = plt.corporateWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.kryptoniteGreenCore,

      ["@lsp.type.macro"] = plt.wealthGold,
      ["@lsp.type.decorator"] = plt.wealthGold,

      ["@lsp.type.builtinType"] = plt.kryptoniteGreenCore,
      ["@lsp.type.selfParameter"] = plt.lexcorpGreenBright,
      ["@lsp.type.typeParameter"] = plt.kryptoniteGreenCore,

      ["@lsp.type.array"] = plt.kryptoniteGreenCore,
      ["@lsp.type.object"] = plt.kryptoniteGreenCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.corporateWhiteCore,
      ["@lsp.type.enumConstant"] = plt.corporateWhiteCore,

      ["@lsp.type.event"] = plt.kryptoniteGreenCore,
      ["@lsp.type.regexp"] = plt.algorithmViolet,
      ["@lsp.type.unresolvedReference"] = plt.kryptoniteGreenCore,

      ["@lsp.mod.deprecated"] = { fg = plt.voidBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.corporateWhiteCore,
      ["@lsp.mod.async"] = plt.lexcorpGreenCore,
      ["@lsp.mod.static"] = plt.lexcorpGreenBright,
      ["@lsp.mod.abstract"] = plt.kryptoniteGreenCore,
      ["@lsp.mod.defaultLibrary"] = plt.kryptoniteGreenCore,
      ["@lsp.mod.documentation"] = plt.executiveGrayLight,
    },
  }
end

return {
  name = "Injustice League – Lex Luthor",
  author = "PrismPunk.nvim",
  description = "LexCorp empire — corporate green, tech purple, kryptonite weapons, billionaire genius.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.executiveGray,
    base04 = palette.executiveGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.rivalryRedCore,
    base09 = palette.ambitionAmberCore,
    base0A = palette.wealthGoldCore,
    base0B = palette.techPurpleCore,
    base0C = palette.kryptoniteGreenCore,
    base0D = palette.lexcorpGreenCore,
    base0E = palette.intellectBlueCore,
    base0F = palette.algorithmVioletCore,
  },

  palette = palette,
  get = M.get,
}
