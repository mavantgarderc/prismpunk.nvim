local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#050C12",
  bg_darker = "#0A1419",
  bg_dark = "#0F1C21",
  bg_mid = "#142429",
  bg_light = "#1A2D33",
  bg_lighter = "#20363D",
  bg_lightest = "#264047",

  fg_lightest = "#F0F8FA",
  fg_light = "#D4E8ED",
  fg_mid = "#B8D8E0",
  fg_dark = "#9CC8D3",

  bg_alt1 = "#0C1618",
  bg_alt2 = "#070E11",
  bg_alt3 = "#121E23",
  bg_alt4 = "#08111A",

  coralRedCore = "#E63946",
  coralRed = "#E63946",
  coralRedBright = "#FF5A67",
  coralRedDeep = "#C72A36",

  aquaTeal = "#06D6A0",
  aquaTealBright = "#2EEFC0",
  aquaTealCore = "#06D6A0",
  aquaTealDeep = "#04A67A",

  oceanBlue = "#118AB2",
  oceanBlueBright = "#39A8CC",
  oceanBlueCore = "#118AB2",
  oceanBlueDeep = "#0D6D8F",

  pearlWhite = "#F0F4F8",
  pearlWhiteBright = "#FFFFFF",
  pearlWhiteCore = "#F0F4F8",
  pearlWhiteDeep = "#D4DFE8",

  royalGold = "#FFD60A",
  royalGoldBright = "#FFEA70",
  royalGoldCore = "#FFD60A",
  royalGoldDeep = "#D9B400",

  atlanteanEmerald = "#10B981",
  atlanteanEmeraldBright = "#34D399",
  atlanteanEmeraldCore = "#10B981",

  seafoamGray = "#6B8C99",
  seafoamGrayLight = "#8AACB8",
  seafoamGrayDark = "#556F7A",

  crystalWhite = "#F0F8FA",
  crystalWhiteCore = "#F0F8FA",
  crystalWhiteBright = "#FAFEFF",

  tridentBlue = "#0077B6",
  tridentBlueBright = "#0096C7",
  tridentBlueCore = "#0077B6",

  tideRed = "#DC2626",
  tideRedBright = "#EF4444",
  tideRedCore = "#DC2626",

  currentGray = "#6B8C99",
  currentGrayLight = "#8AACB8",

  kelpGreen = "#059669",
  kelpGreenCore = "#059669",
  kelpGreenBright = "#10B981",

  biolumeViolet = "#8B5CF6",
  biolumeVioletCore = "#8B5CF6",

  abyssBlack = "#050C12",

  successGreen = "#10B981",
  errorRed = "#E63946",
  warningAmber = "#FFD60A",
  infoBlue = "#118AB2",

  seaweedGreenCore = "#10B981",
  anglerYellowCore = "#FFD60A",
  anemoneRedCore = "#E63946",

  coralPink = "#E63946",
  coralPinkBright = "#FF5A67",
  coralPinkCore = "#E63946",
  coralPinkDeep = "#C72A36",

  pressureWhite = "#F0F8FA",
  pressureWhiteCore = "#F0F8FA",
  pressureWhiteBright = "#FAFEFF",

  depthBlack = "#050C12",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.coralRedCore,
      insert = plt.aquaTealCore,
      visual = plt.oceanBlueCore,
      replace = plt.tideRedCore,
      command = plt.royalGoldCore,
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
      bg_search = plt.royalGoldDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.coralRedBright,
      header2 = plt.aquaTealBright,
      special = plt.royalGold,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.coralRedCore,
      picker = plt.royalGold,
      yank = plt.pearlWhiteBright,
      mark = plt.oceanBlue,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.coralRedBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.coralRedCore,
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
      accent1 = plt.coralRedCore,
      accent2 = plt.oceanBlueCore,
      accent3 = plt.aquaTealCore,
      accent4 = plt.royalGoldCore,
      accent5 = plt.pearlWhiteCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.coralRedBright,
      rainbow2 = plt.aquaTealBright,
      rainbow3 = plt.oceanBlueBright,
      rainbow4 = plt.royalGoldBright,
      rainbow5 = plt.pearlWhiteBright,
      rainbow6 = plt.atlanteanEmeraldBright,
      rainbow7 = plt.tridentBlueBright,
    },

    syn = {
      attribute = plt.royalGold,
      boolean = plt.oceanBlue,
      comment = plt.seafoamGray,
      constant = plt.crystalWhite,
      deprecated = plt.abyssBlack,
      func = plt.aquaTealCore,
      identifier = plt.fg_lightest,
      keyword = plt.coralRedCore,
      method = plt.aquaTealBright,
      number = plt.crystalWhite,
      operator = plt.pearlWhiteCore,
      parameter = plt.fg_mid,
      preproc = plt.royalGoldCore,
      punct = plt.fg_dark,
      regex = plt.biolumeViolet,
      statement = plt.coralRedCore,
      string = plt.aquaTealCore,
      symbol = plt.royalGold,
      type = plt.oceanBlueCore,
      variable = plt.fg_lightest,
      special = plt.royalGold,
      special2 = plt.tridentBlue,
      special3 = plt.atlanteanEmerald,
    },

    vcs = {
      added = plt.kelpGreenCore,
      removed = plt.tideRedCore,
      changed = plt.royalGoldCore,
    },

    diff = {
      add = plt.kelpGreenCore,
      change = plt.royalGoldCore,
      delete = plt.tideRedCore,
      text = plt.royalGold,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.royalGold,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.coralRedCore,
      green = plt.aquaTealCore,
      yellow = plt.royalGoldCore,
      blue = plt.oceanBlueCore,
      magenta = plt.coralRedCore,
      cyan = plt.aquaTealCore,
      white = plt.crystalWhiteCore,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.coralRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.aquaTealBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.royalGoldBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.oceanBlueBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.coralRedBright):brighten(0.15):to_hex(),
      cyan_bright = color(plt.aquaTealBright):brighten(0.15):to_hex(),
      white_bright = plt.crystalWhiteBright,
      indexed1 = plt.coralRed,
      indexed2 = plt.royalGold,
    },

    treesitter = {
      ["@comment"] = plt.seafoamGray,
      ["@comment.documentation"] = plt.seafoamGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.royalGoldBright,
      ["@comment.note"] = plt.royalGold,

      ["@constant"] = plt.crystalWhite,
      ["@constant.builtin"] = plt.crystalWhiteCore,
      ["@constant.macro"] = plt.royalGold,

      ["@string"] = plt.aquaTealCore,
      ["@string.documentation"] = plt.aquaTealCore,
      ["@string.regex"] = plt.biolumeViolet,
      ["@string.escape"] = plt.pearlWhiteBright,
      ["@string.special"] = plt.aquaTealBright,
      ["@string.special.symbol"] = plt.royalGold,
      ["@string.special.url"] = plt.oceanBlue,
      ["@string.special.path"] = plt.aquaTealCore,

      ["@character"] = plt.aquaTealCore,
      ["@character.special"] = plt.royalGold,

      ["@number"] = plt.crystalWhite,
      ["@number.float"] = plt.crystalWhiteCore,

      ["@boolean"] = plt.oceanBlue,

      ["@function"] = plt.aquaTealCore,
      ["@function.builtin"] = plt.aquaTealCore,
      ["@function.call"] = plt.aquaTealCore,
      ["@function.macro"] = plt.royalGoldCore,
      ["@function.method"] = plt.aquaTealBright,
      ["@function.method.call"] = plt.aquaTealBright,

      ["@constructor"] = plt.oceanBlueCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.coralRedCore,
      ["@keyword.coroutine"] = plt.royalGoldCore,
      ["@keyword.function"] = plt.coralRedCore,
      ["@keyword.operator"] = plt.pearlWhiteCore,
      ["@keyword.return"] = plt.coralRedCore,
      ["@keyword.import"] = plt.royalGoldCore,
      ["@keyword.storage"] = plt.coralRedCore,
      ["@keyword.repeat"] = plt.coralRedCore,
      ["@keyword.conditional"] = plt.coralRedCore,
      ["@keyword.exception"] = plt.tideRedCore,
      ["@keyword.directive"] = plt.royalGoldCore,
      ["@keyword.directive.define"] = plt.royalGoldCore,

      ["@conditional"] = plt.coralRedCore,
      ["@conditional.ternary"] = plt.coralRedCore,

      ["@repeat"] = plt.coralRedCore,

      ["@label"] = plt.royalGold,

      ["@operator"] = plt.pearlWhiteCore,

      ["@exception"] = plt.tideRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.coralRedBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.oceanBlueCore,
      ["@type.builtin"] = plt.oceanBlueCore,
      ["@type.definition"] = plt.oceanBlueCore,
      ["@type.qualifier"] = plt.coralRedCore,

      ["@attribute"] = plt.royalGold,
      ["@attribute.builtin"] = plt.royalGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.oceanBlueCore,
      ["@module.builtin"] = plt.oceanBlueCore,

      ["@namespace"] = plt.oceanBlueCore,
      ["@namespace.builtin"] = plt.oceanBlueCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.pearlWhiteCore,

      ["@tag"] = plt.coralRedCore,
      ["@tag.attribute"] = plt.royalGold,
      ["@tag.delimiter"] = plt.pearlWhiteCore,
      ["@tag.builtin"] = plt.coralRedCore,

      ["@markup.strong"] = { fg = plt.coralRedBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.seafoamGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.royalGold, underline = true },
      ["@markup.heading"] = plt.coralRedBright,
      ["@markup.heading.1"] = plt.coralRedBright,
      ["@markup.heading.2"] = plt.aquaTealBright,
      ["@markup.heading.3"] = plt.oceanBlueBright,
      ["@markup.heading.4"] = plt.royalGoldBright,
      ["@markup.heading.5"] = plt.atlanteanEmeraldBright,
      ["@markup.heading.6"] = plt.pearlWhiteBright,
      ["@markup.quote"] = plt.seafoamGray,
      ["@markup.math"] = plt.crystalWhite,
      ["@markup.link"] = plt.oceanBlue,
      ["@markup.link.label"] = plt.oceanBlueBright,
      ["@markup.link.url"] = plt.oceanBlue,
      ["@markup.raw"] = plt.aquaTealCore,
      ["@markup.raw.block"] = plt.aquaTealCore,
      ["@markup.list"] = plt.coralRedCore,
      ["@markup.list.checked"] = plt.kelpGreenCore,
      ["@markup.list.unchecked"] = plt.seafoamGray,

      ["@diff.plus"] = plt.kelpGreenCore,
      ["@diff.minus"] = plt.tideRedCore,
      ["@diff.delta"] = plt.royalGoldCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.oceanBlueCore,
      ["@constructor.javascript"] = plt.oceanBlueCore,
      ["@constructor.typescript"] = plt.oceanBlueCore,
      ["@namespace.rust"] = plt.oceanBlueCore,
      ["@type.qualifier.rust"] = plt.coralRedCore,
      ["@constant.macro.c"] = plt.royalGold,
      ["@constant.macro.cpp"] = plt.royalGold,
      ["@namespace.go"] = plt.oceanBlueCore,
      ["@property.css"] = plt.aquaTealBright,
      ["@type.css"] = plt.coralRedCore,
      ["@label.json"] = plt.royalGold,
      ["@field.yaml"] = plt.aquaTealBright,
      ["@property.toml"] = plt.aquaTealBright,
      ["@function.builtin.bash"] = plt.aquaTealCore,
      ["@string.regexp"] = plt.biolumeViolet,
      ["@character.special.regex"] = plt.royalGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.oceanBlueCore,
      ["@lsp.type.interface"] = plt.oceanBlueCore,
      ["@lsp.type.struct"] = plt.oceanBlueCore,
      ["@lsp.type.enum"] = plt.oceanBlueCore,
      ["@lsp.type.enumMember"] = plt.crystalWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.oceanBlueCore,

      ["@lsp.type.macro"] = plt.royalGold,
      ["@lsp.type.decorator"] = plt.royalGold,

      ["@lsp.type.builtinType"] = plt.oceanBlueCore,
      ["@lsp.type.selfParameter"] = plt.coralRedBright,
      ["@lsp.type.typeParameter"] = plt.oceanBlueCore,

      ["@lsp.type.array"] = plt.oceanBlueCore,
      ["@lsp.type.object"] = plt.oceanBlueCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.crystalWhiteCore,
      ["@lsp.type.enumConstant"] = plt.crystalWhiteCore,

      ["@lsp.type.event"] = plt.oceanBlueCore,
      ["@lsp.type.regexp"] = plt.biolumeViolet,
      ["@lsp.type.unresolvedReference"] = plt.oceanBlueCore,

      ["@lsp.mod.deprecated"] = { fg = plt.abyssBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.crystalWhiteCore,
      ["@lsp.mod.async"] = plt.coralRedCore,
      ["@lsp.mod.static"] = plt.coralRedBright,
      ["@lsp.mod.abstract"] = plt.oceanBlueCore,
      ["@lsp.mod.defaultLibrary"] = plt.oceanBlueCore,
      ["@lsp.mod.documentation"] = plt.seafoamGrayLight,
    },
  }
end

return {
  name = "Punk – Mera",
  author = "PrismPunk.nvim",
  description = "Queen of Atlantis — coral red hair, aqua teal waters, ocean blue royalty, pearl elegance.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.seafoamGray,
    base04 = palette.seafoamGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.tideRedCore,
    base09 = palette.royalGoldCore,
    base0A = palette.royalGoldCore,
    base0B = palette.aquaTealCore,
    base0C = palette.oceanBlueCore,
    base0D = palette.coralRedCore,
    base0E = palette.royalGoldCore,
    base0F = palette.biolumeVioletCore,
  },

  palette = palette,
  get = M.get,
}
