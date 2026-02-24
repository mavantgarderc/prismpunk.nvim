local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0D0D0D",
  bg_darker = "#141414",
  bg_dark = "#1B1B1B",
  bg_mid = "#222222",
  bg_light = "#2A2A2A",
  bg_lighter = "#333333",
  bg_lightest = "#3D3D3D",

  fg_lightest = "#E8E8F0",
  fg_light = "#D0D0E0",
  fg_mid = "#B8B8D0",
  fg_dark = "#A0A0C0",

  bg_alt1 = "#161616",
  bg_alt2 = "#101010",
  bg_alt3 = "#1E1E1E",
  bg_alt4 = "#121212",

  mutationPurpleCore = "#9D4EDD",
  mutationPurple = "#9D4EDD",
  mutationPurpleBright = "#C77DFF",
  mutationPurpleDeep = "#7B2CBF",

  resurrectionGreen = "#00FF7F",
  resurrectionGreenBright = "#5AFFAA",
  resurrectionGreenCore = "#00FF7F",
  resurrectionGreenDeep = "#00D96B",

  chaosRed = "#DC143C",
  chaosRedBright = "#FF1744",
  chaosRedCore = "#DC143C",
  chaosRedDeep = "#B71C1C",

  fluxBlue = "#4169E1",
  fluxBlueBright = "#6A8FF5",
  fluxBlueCore = "#4169E1",
  fluxBlueDeep = "#2149C1",

  deathGray = "#708090",
  deathGrayBright = "#90A0B0",
  deathGrayCore = "#708090",
  deathGrayDeep = "#5A6A78",

  shiftWhite = "#E8E8F0",
  shiftWhiteBright = "#FFFFFF",
  shiftWhiteCore = "#E8E8F0",

  voidGray = "#606060",
  voidGrayLight = "#787878",
  voidGrayDark = "#484848",

  cycleOrange = "#FF8C00",
  cycleOrangeBright = "#FFAA33",
  cycleOrangeCore = "#FF8C00",

  mortalRed = "#8B0000",
  mortalRedBright = "#B71C1C",
  mortalRedCore = "#8B0000",

  dimensionViolet = "#8B5CF6",
  dimensionVioletBright = "#A78BFA",
  dimensionVioletCore = "#8B5CF6",

  evolutionCyan = "#00CED1",
  evolutionCyanBright = "#5FDEDF",
  evolutionCyanCore = "#00CED1",

  currentGray = "#606060",
  currentGrayLight = "#787878",

  rebirthGreen = "#32CD32",
  rebirthGreenCore = "#32CD32",
  rebirthGreenBright = "#5AFF5A",

  unstableViolet = "#9370DB",
  unstableVioletCore = "#9370DB",

  absoluteBlack = "#0D0D0D",

  successGreen = "#32CD32",
  errorRed = "#DC143C",
  warningAmber = "#FF8C00",
  infoBlue = "#4169E1",

  seaweedGreenCore = "#32CD32",
  anglerYellowCore = "#FF8C00",
  anemoneRedCore = "#DC143C",

  coralPink = "#9D4EDD",
  coralPinkBright = "#C77DFF",
  coralPinkCore = "#9D4EDD",
  coralPinkDeep = "#7B2CBF",

  pressureWhite = "#E8E8F0",
  pressureWhiteCore = "#E8E8F0",
  pressureWhiteBright = "#FFFFFF",

  depthBlack = "#0D0D0D",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.mutationPurpleCore,
      insert = plt.resurrectionGreenCore,
      visual = plt.chaosRedCore,
      replace = plt.mortalRedCore,
      command = plt.fluxBlueCore,
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
      bg_search = plt.cycleOrangeDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.mutationPurpleBright,
      header2 = plt.resurrectionGreenBright,
      special = plt.dimensionViolet,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.mutationPurpleCore,
      picker = plt.evolutionCyan,
      yank = plt.shiftWhiteBright,
      mark = plt.dimensionViolet,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.mutationPurpleBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.mutationPurpleCore,
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
      accent1 = plt.mutationPurpleCore,
      accent2 = plt.resurrectionGreenCore,
      accent3 = plt.chaosRedCore,
      accent4 = plt.fluxBlueCore,
      accent5 = plt.deathGrayCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.mutationPurpleBright,
      rainbow2 = plt.resurrectionGreenBright,
      rainbow3 = plt.chaosRedBright,
      rainbow4 = plt.fluxBlueBright,
      rainbow5 = plt.deathGrayBright,
      rainbow6 = plt.evolutionCyanBright,
      rainbow7 = plt.dimensionVioletBright,
    },

    syn = {
      attribute = plt.evolutionCyan,
      boolean = plt.chaosRed,
      comment = plt.voidGray,
      constant = plt.shiftWhite,
      deprecated = plt.absoluteBlack,
      func = plt.resurrectionGreenCore,
      identifier = plt.fg_lightest,
      keyword = plt.mutationPurpleCore,
      method = plt.resurrectionGreenBright,
      number = plt.shiftWhite,
      operator = plt.fluxBlueCore,
      parameter = plt.fg_mid,
      preproc = plt.dimensionVioletCore,
      punct = plt.fg_dark,
      regex = plt.unstableViolet,
      statement = plt.mutationPurpleCore,
      string = plt.resurrectionGreenCore,
      symbol = plt.evolutionCyan,
      type = plt.chaosRedCore,
      variable = plt.fg_lightest,
      special = plt.dimensionViolet,
      special2 = plt.deathGray,
      special3 = plt.cycleOrange,
    },

    vcs = {
      added = plt.rebirthGreenCore,
      removed = plt.mortalRedCore,
      changed = plt.cycleOrangeCore,
    },

    diff = {
      add = plt.rebirthGreenCore,
      change = plt.cycleOrangeCore,
      delete = plt.mortalRedCore,
      text = plt.dimensionViolet,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.dimensionViolet,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.chaosRedCore,
      green = plt.resurrectionGreenCore,
      yellow = plt.cycleOrangeCore,
      blue = plt.fluxBlueCore,
      magenta = plt.mutationPurpleCore,
      cyan = plt.evolutionCyanCore,
      white = plt.shiftWhiteCore,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.chaosRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.resurrectionGreenBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.cycleOrangeBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.fluxBlueBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.mutationPurpleBright):brighten(0.15):to_hex(),
      cyan_bright = color(plt.evolutionCyanBright):brighten(0.15):to_hex(),
      white_bright = plt.shiftWhiteBright,
      indexed1 = plt.mutationPurple,
      indexed2 = plt.resurrectionGreen,
    },

    treesitter = {
      ["@comment"] = plt.voidGray,
      ["@comment.documentation"] = plt.voidGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.cycleOrangeBright,
      ["@comment.note"] = plt.dimensionViolet,

      ["@constant"] = plt.shiftWhite,
      ["@constant.builtin"] = plt.shiftWhiteCore,
      ["@constant.macro"] = plt.evolutionCyan,

      ["@string"] = plt.resurrectionGreenCore,
      ["@string.documentation"] = plt.resurrectionGreenCore,
      ["@string.regex"] = plt.unstableViolet,
      ["@string.escape"] = plt.mutationPurpleBright,
      ["@string.special"] = plt.resurrectionGreenBright,
      ["@string.special.symbol"] = plt.evolutionCyan,
      ["@string.special.url"] = plt.fluxBlue,
      ["@string.special.path"] = plt.resurrectionGreenCore,

      ["@character"] = plt.resurrectionGreenCore,
      ["@character.special"] = plt.evolutionCyan,

      ["@number"] = plt.shiftWhite,
      ["@number.float"] = plt.shiftWhiteCore,

      ["@boolean"] = plt.chaosRed,

      ["@function"] = plt.resurrectionGreenCore,
      ["@function.builtin"] = plt.resurrectionGreenCore,
      ["@function.call"] = plt.resurrectionGreenCore,
      ["@function.macro"] = plt.dimensionVioletCore,
      ["@function.method"] = plt.resurrectionGreenBright,
      ["@function.method.call"] = plt.resurrectionGreenBright,

      ["@constructor"] = plt.chaosRedCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.mutationPurpleCore,
      ["@keyword.coroutine"] = plt.dimensionVioletCore,
      ["@keyword.function"] = plt.mutationPurpleCore,
      ["@keyword.operator"] = plt.fluxBlueCore,
      ["@keyword.return"] = plt.mutationPurpleCore,
      ["@keyword.import"] = plt.dimensionVioletCore,
      ["@keyword.storage"] = plt.mutationPurpleCore,
      ["@keyword.repeat"] = plt.mutationPurpleCore,
      ["@keyword.conditional"] = plt.mutationPurpleCore,
      ["@keyword.exception"] = plt.mortalRedCore,
      ["@keyword.directive"] = plt.dimensionVioletCore,
      ["@keyword.directive.define"] = plt.dimensionVioletCore,

      ["@conditional"] = plt.mutationPurpleCore,
      ["@conditional.ternary"] = plt.mutationPurpleCore,

      ["@repeat"] = plt.mutationPurpleCore,

      ["@label"] = plt.evolutionCyan,

      ["@operator"] = plt.fluxBlueCore,

      ["@exception"] = plt.mortalRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.mutationPurpleBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.chaosRedCore,
      ["@type.builtin"] = plt.chaosRedCore,
      ["@type.definition"] = plt.chaosRedCore,
      ["@type.qualifier"] = plt.mutationPurpleCore,

      ["@attribute"] = plt.evolutionCyan,
      ["@attribute.builtin"] = plt.evolutionCyan,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.chaosRedCore,
      ["@module.builtin"] = plt.chaosRedCore,

      ["@namespace"] = plt.chaosRedCore,
      ["@namespace.builtin"] = plt.chaosRedCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.fluxBlueCore,

      ["@tag"] = plt.mutationPurpleCore,
      ["@tag.attribute"] = plt.evolutionCyan,
      ["@tag.delimiter"] = plt.fluxBlueCore,
      ["@tag.builtin"] = plt.mutationPurpleCore,

      ["@markup.strong"] = { fg = plt.mutationPurpleBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.voidGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.dimensionViolet, underline = true },
      ["@markup.heading"] = plt.mutationPurpleBright,
      ["@markup.heading.1"] = plt.mutationPurpleBright,
      ["@markup.heading.2"] = plt.resurrectionGreenBright,
      ["@markup.heading.3"] = plt.chaosRedBright,
      ["@markup.heading.4"] = plt.fluxBlueBright,
      ["@markup.heading.5"] = plt.evolutionCyanBright,
      ["@markup.heading.6"] = plt.dimensionVioletBright,
      ["@markup.quote"] = plt.voidGray,
      ["@markup.math"] = plt.shiftWhite,
      ["@markup.link"] = plt.fluxBlue,
      ["@markup.link.label"] = plt.fluxBlueBright,
      ["@markup.link.url"] = plt.fluxBlue,
      ["@markup.raw"] = plt.resurrectionGreenCore,
      ["@markup.raw.block"] = plt.resurrectionGreenCore,
      ["@markup.list"] = plt.mutationPurpleCore,
      ["@markup.list.checked"] = plt.rebirthGreenCore,
      ["@markup.list.unchecked"] = plt.voidGray,

      ["@diff.plus"] = plt.rebirthGreenCore,
      ["@diff.minus"] = plt.mortalRedCore,
      ["@diff.delta"] = plt.cycleOrangeCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.chaosRedCore,
      ["@constructor.javascript"] = plt.chaosRedCore,
      ["@constructor.typescript"] = plt.chaosRedCore,
      ["@namespace.rust"] = plt.chaosRedCore,
      ["@type.qualifier.rust"] = plt.mutationPurpleCore,
      ["@constant.macro.c"] = plt.evolutionCyan,
      ["@constant.macro.cpp"] = plt.evolutionCyan,
      ["@namespace.go"] = plt.chaosRedCore,
      ["@property.css"] = plt.resurrectionGreenBright,
      ["@type.css"] = plt.mutationPurpleCore,
      ["@label.json"] = plt.evolutionCyan,
      ["@field.yaml"] = plt.resurrectionGreenBright,
      ["@property.toml"] = plt.resurrectionGreenBright,
      ["@function.builtin.bash"] = plt.resurrectionGreenCore,
      ["@string.regexp"] = plt.unstableViolet,
      ["@character.special.regex"] = plt.evolutionCyan,
    },

    lsp = {
      ["@lsp.type.class"] = plt.chaosRedCore,
      ["@lsp.type.interface"] = plt.chaosRedCore,
      ["@lsp.type.struct"] = plt.chaosRedCore,
      ["@lsp.type.enum"] = plt.chaosRedCore,
      ["@lsp.type.enumMember"] = plt.shiftWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.chaosRedCore,

      ["@lsp.type.macro"] = plt.evolutionCyan,
      ["@lsp.type.decorator"] = plt.evolutionCyan,

      ["@lsp.type.builtinType"] = plt.chaosRedCore,
      ["@lsp.type.selfParameter"] = plt.mutationPurpleBright,
      ["@lsp.type.typeParameter"] = plt.chaosRedCore,

      ["@lsp.type.array"] = plt.chaosRedCore,
      ["@lsp.type.object"] = plt.chaosRedCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.shiftWhiteCore,
      ["@lsp.type.enumConstant"] = plt.shiftWhiteCore,

      ["@lsp.type.event"] = plt.chaosRedCore,
      ["@lsp.type.regexp"] = plt.unstableViolet,
      ["@lsp.type.unresolvedReference"] = plt.chaosRedCore,

      ["@lsp.mod.deprecated"] = { fg = plt.absoluteBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.shiftWhiteCore,
      ["@lsp.mod.async"] = plt.mutationPurpleCore,
      ["@lsp.mod.static"] = plt.mutationPurpleBright,
      ["@lsp.mod.abstract"] = plt.chaosRedCore,
      ["@lsp.mod.defaultLibrary"] = plt.chaosRedCore,
      ["@lsp.mod.documentation"] = plt.voidGrayLight,
    },
  }
end

return {
  name = "Injustice League – Multi-Man",
  author = "PrismPunk.nvim",
  description = "Endless death/rebirth cycle — mutation purple, resurrection green, chaos red, flux unstable.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.voidGray,
    base04 = palette.voidGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.mortalRedCore,
    base09 = palette.cycleOrangeCore,
    base0A = palette.evolutionCyanCore,
    base0B = palette.resurrectionGreenCore,
    base0C = palette.fluxBlueCore,
    base0D = palette.mutationPurpleCore,
    base0E = palette.chaosRedCore,
    base0F = palette.unstableVioletCore,
  },

  palette = palette,
  get = M.get,
}
