local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0604",
  bg_darker = "#120A08",
  bg_dark = "#1A0F0C",
  bg_mid = "#221410",
  bg_light = "#2A1814",
  bg_lighter = "#321D18",
  bg_lightest = "#3A211C",

  fg_lightest = "#FFE8D6",
  fg_light = "#F5D4B8",
  fg_mid = "#C09876",
  fg_dark = "#8B6F54",

  bg_alt1 = "#140906",
  bg_alt2 = "#0D0503",
  bg_alt3 = "#1C0D09",
  bg_alt4 = "#160B07",

  fusionCore = "#FF6B2C",
  fusionFlame = "#FF8243",
  fusionBurst = "#FFA366",
  fusionHeat = "#E85A1F",
  fusionEmber = "#CC4D19",

  atomicYellow = "#FFBA3D",
  atomicGold = "#FFD670",
  atomicSpark = "#FFE699",
  atomicCharge = "#E89F20",
  atomicCore = "#CC8A15",

  molecularBlue = "#4A9FD8",
  molecularCyan = "#5CB8E6",
  molecularShift = "#7FCFFF",
  molecularFlux = "#3D8BC2",
  molecularStable = "#2E7AAD",

  matrixPurple = "#B47FD8",
  matrixViolet = "#9966CC",
  matrixAura = "#C299E6",
  matrixMind = "#8856B8",
  matrixFusion = "#6D42A3",

  criticalRed = "#E63946",
  meltdownRed = "#CC2936",
  warningOrange = "#FF7F50",

  stableGreen = "#6FCF97",
  fusionGreen = "#52B87A",
  balanceGreen = "#8FE6B5",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.fusionCore,
      insert = plt.atomicYellow,
      visual = plt.molecularBlue,
      replace = plt.criticalRed,
      command = plt.matrixPurple,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_dark,
      fg_dark = plt.bg_lightest,
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
      bg_cursorline = plt.bg_mid,
      bg_cursorline_alt = plt.bg_light,
      bg_search = plt.atomicYellow,
      bg_visual = plt.molecularBlue,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.fusionCore,
      header2 = plt.atomicYellow,
      special = plt.molecularCyan,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.fusionCore,
      indent = plt.bg_lighter,
      indent_scope = plt.fusionFlame,
      picker = plt.matrixPurple,
      yank = plt.atomicGold,
      mark = plt.molecularBlue,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.fusionCore,
        bg_alternate = plt.bg_darkest,
        indicator = plt.atomicYellow,
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
        bg = plt.bg_mid,
        fg_border = plt.bg_lighter,
        bg_border = plt.bg_mid,
      },
    },

    accent = {
      accent1 = plt.fusionCore,
      accent2 = plt.atomicYellow,
      accent3 = plt.molecularBlue,
      accent4 = plt.matrixPurple,
      accent5 = plt.fusionFlame,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.fusionCore,
      rainbow2 = plt.atomicYellow,
      rainbow3 = plt.atomicGold,
      rainbow4 = plt.molecularCyan,
      rainbow5 = plt.molecularBlue,
      rainbow6 = plt.matrixPurple,
      rainbow7 = plt.criticalRed,
    },

    syn = {
      attribute = plt.atomicYellow,
      boolean = plt.fusionCore,
      comment = plt.fg_dark,
      constant = plt.atomicCharge,
      deprecated = plt.fg_mid,
      func = plt.atomicYellow,
      identifier = plt.fg_lightest,
      keyword = plt.fusionCore,
      method = plt.molecularBlue,
      number = plt.atomicGold,
      operator = plt.fusionFlame,
      parameter = plt.fg_mid,
      preproc = plt.matrixPurple,
      punct = plt.fg_mid,
      regex = plt.atomicYellow,
      statement = plt.fusionCore,
      string = plt.molecularCyan,
      symbol = plt.atomicYellow,
      type = plt.atomicYellow,
      variable = plt.fg_lightest,
      special = plt.matrixViolet,
      special2 = plt.fusionBurst,
      special3 = plt.molecularShift,
    },

    vcs = {
      added = plt.stableGreen,
      removed = plt.criticalRed,
      changed = plt.atomicYellow,
    },

    diff = {
      add = plt.stableGreen,
      change = plt.atomicYellow,
      delete = plt.criticalRed,
      text = plt.fusionCore,
    },

    diag = {
      ok = plt.stableGreen,
      error = plt.criticalRed,
      warning = plt.warningOrange,
      info = plt.molecularBlue,
      hint = plt.matrixPurple,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.fusionCore,
      green = plt.stableGreen,
      yellow = plt.atomicYellow,
      blue = plt.molecularBlue,
      magenta = plt.matrixPurple,
      cyan = plt.molecularCyan,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.fusionCore):brighten(0.2):to_hex(),
      green_bright = color(plt.stableGreen):brighten(0.1):to_hex(),
      yellow_bright = color(plt.atomicYellow):brighten(0.2):to_hex(),
      blue_bright = color(plt.molecularBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.matrixPurple):brighten(0.2):to_hex(),
      cyan_bright = color(plt.molecularCyan):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.atomicYellow,
      indexed2 = plt.fusionCore,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.criticalRed,
      ["@comment.warning"] = plt.warningOrange,
      ["@comment.todo"] = plt.fusionCore,
      ["@comment.note"] = plt.atomicYellow,

      ["@constant"] = plt.atomicCharge,
      ["@constant.builtin"] = plt.atomicCharge,
      ["@constant.macro"] = plt.atomicYellow,

      ["@string"] = plt.molecularCyan,
      ["@string.documentation"] = plt.molecularCyan,
      ["@string.regex"] = plt.atomicYellow,
      ["@string.escape"] = plt.matrixPurple,
      ["@string.special"] = plt.molecularShift,
      ["@string.special.symbol"] = plt.atomicSpark,
      ["@string.special.url"] = plt.molecularBlue,
      ["@string.special.path"] = plt.molecularCyan,

      ["@character"] = plt.molecularCyan,
      ["@character.special"] = plt.matrixPurple,

      ["@number"] = plt.atomicGold,
      ["@number.float"] = plt.atomicGold,

      ["@boolean"] = plt.fusionCore,

      ["@function"] = plt.atomicYellow,
      ["@function.builtin"] = plt.atomicYellow,
      ["@function.call"] = plt.atomicYellow,
      ["@function.macro"] = plt.matrixPurple,
      ["@function.method"] = plt.molecularBlue,
      ["@function.method.call"] = plt.molecularBlue,

      ["@constructor"] = plt.atomicYellow,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.fusionCore,
      ["@keyword.coroutine"] = plt.fusionFlame,
      ["@keyword.function"] = plt.fusionCore,
      ["@keyword.operator"] = plt.fusionFlame,
      ["@keyword.return"] = plt.fusionCore,
      ["@keyword.import"] = plt.atomicYellow,
      ["@keyword.storage"] = plt.fusionCore,
      ["@keyword.repeat"] = plt.fusionCore,
      ["@keyword.conditional"] = plt.fusionCore,
      ["@keyword.exception"] = plt.criticalRed,
      ["@keyword.directive"] = plt.matrixPurple,
      ["@keyword.directive.define"] = plt.matrixPurple,

      ["@conditional"] = plt.fusionCore,
      ["@conditional.ternary"] = plt.fusionCore,

      ["@repeat"] = plt.fusionCore,

      ["@label"] = plt.fusionFlame,

      ["@operator"] = plt.fusionFlame,

      ["@exception"] = plt.criticalRed,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.fusionBurst,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.atomicYellow,
      ["@type.builtin"] = plt.atomicYellow,
      ["@type.definition"] = plt.atomicYellow,
      ["@type.qualifier"] = plt.fusionCore,

      ["@attribute"] = plt.atomicYellow,
      ["@attribute.builtin"] = plt.atomicYellow,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.atomicYellow,
      ["@module.builtin"] = plt.atomicYellow,

      ["@namespace"] = plt.atomicYellow,
      ["@namespace.builtin"] = plt.atomicYellow,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.fusionFlame,

      ["@tag"] = plt.atomicYellow,
      ["@tag.attribute"] = plt.atomicYellow,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.atomicYellow,

      ["@markup.strong"] = { fg = plt.fusionCore, bold = true },
      ["@markup.italic"] = { fg = plt.molecularCyan, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.fg_light, underline = true },
      ["@markup.heading"] = plt.fusionCore,
      ["@markup.heading.1"] = plt.fusionCore,
      ["@markup.heading.2"] = plt.atomicYellow,
      ["@markup.heading.3"] = plt.atomicGold,
      ["@markup.heading.4"] = plt.molecularCyan,
      ["@markup.heading.5"] = plt.molecularBlue,
      ["@markup.heading.6"] = plt.matrixPurple,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.atomicYellow,
      ["@markup.link"] = plt.atomicYellow,
      ["@markup.link.label"] = plt.molecularBlue,
      ["@markup.link.url"] = plt.molecularCyan,
      ["@markup.raw"] = plt.molecularCyan,
      ["@markup.raw.block"] = plt.molecularCyan,
      ["@markup.list"] = plt.atomicYellow,
      ["@markup.list.checked"] = plt.stableGreen,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.stableGreen,
      ["@diff.minus"] = plt.criticalRed,
      ["@diff.delta"] = plt.atomicYellow,

      ["@none"] = "none",
      ["@conceal"] = plt.matrixPurple,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.atomicYellow,
      ["@constructor.javascript"] = plt.atomicYellow,
      ["@constructor.typescript"] = plt.atomicYellow,
      ["@namespace.rust"] = plt.atomicYellow,
      ["@type.qualifier.rust"] = plt.fusionCore,
      ["@constant.macro.c"] = plt.atomicCharge,
      ["@constant.macro.cpp"] = plt.atomicCharge,
      ["@namespace.go"] = plt.atomicYellow,
      ["@property.css"] = plt.molecularCyan,
      ["@type.css"] = plt.atomicYellow,
      ["@label.json"] = plt.atomicYellow,
      ["@field.yaml"] = plt.molecularCyan,
      ["@property.toml"] = plt.molecularCyan,
      ["@function.builtin.bash"] = plt.atomicYellow,
      ["@string.regexp"] = plt.atomicYellow,
      ["@character.special.regex"] = plt.matrixPurple,
    },

    lsp = {
      ["@lsp.type.class"] = plt.atomicYellow,
      ["@lsp.type.interface"] = plt.atomicYellow,
      ["@lsp.type.struct"] = plt.atomicYellow,
      ["@lsp.type.enum"] = plt.atomicYellow,
      ["@lsp.type.enumMember"] = plt.fusionCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.atomicYellow,

      ["@lsp.type.macro"] = plt.atomicCharge,
      ["@lsp.type.decorator"] = plt.atomicYellow,

      ["@lsp.type.builtinType"] = plt.atomicYellow,
      ["@lsp.type.selfParameter"] = plt.fusionBurst,
      ["@lsp.type.typeParameter"] = plt.atomicYellow,

      ["@lsp.type.array"] = plt.atomicYellow,
      ["@lsp.type.object"] = plt.atomicYellow,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.fusionCore,
      ["@lsp.type.enumConstant"] = plt.fusionCore,

      ["@lsp.type.event"] = plt.atomicYellow,
      ["@lsp.type.regexp"] = plt.atomicYellow,
      ["@lsp.type.unresolvedReference"] = plt.atomicYellow,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.fusionCore,
      ["@lsp.mod.async"] = plt.fusionCore,
      ["@lsp.mod.static"] = plt.fusionFlame,
      ["@lsp.mod.abstract"] = plt.atomicYellow,
      ["@lsp.mod.defaultLibrary"] = plt.atomicYellow,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Firestorm",
  author = "PrismPunk.nvim",
  description = "Nuclear fusion unleashed. Ronnie Raymond and Professor Stein merged into one—atomic fire, "
    .. "molecular transmutation, and quantum energy. Orange flames meet golden sparks, cyan shifts, "
    .. "and purple intellect. The Nuclear Man burns bright.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.criticalRed,
    base09 = palette.atomicCharge,
    base0A = palette.atomicYellow,
    base0B = palette.stableGreen,
    base0C = palette.molecularCyan,
    base0D = palette.molecularBlue,
    base0E = palette.matrixPurple,
    base0F = palette.fusionCore,
  },

  palette = palette,
  get = M.get,
}
