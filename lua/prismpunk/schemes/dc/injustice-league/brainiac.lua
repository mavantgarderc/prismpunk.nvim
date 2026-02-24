local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#050508",
  bg_darker = "#0D0D12",
  bg_dark = "#15151C",
  bg_mid = "#1D1D26",
  bg_light = "#252530",
  bg_lighter = "#2D2D3A",
  bg_lightest = "#353544",

  fg_lightest = "#E8F0E8",
  fg_light = "#D0E0D0",
  fg_mid = "#A8C0A8",
  fg_dark = "#809880",

  bg_alt1 = "#11111A",
  bg_alt2 = "#090910",
  bg_alt3 = "#191922",
  bg_alt4 = "#0E0E16",

  neuralGreen = "#70D8A8",
  brainGreen = "#80E8B8",
  synapseGreen = "#90F8C8",
  mindGreen = "#60C898",
  consciousGreen = "#50B888",

  coluanPurple = "#A888D8",
  alienPurple = "#B898E8",
  intellectPurple = "#C8A8F8",
  twelfthPurple = "#9878C8",
  advancedPurple = "#8868B8",

  dataMatrix = "#88D8B8",
  codeStream = "#98E8C8",
  digitalFlow = "#A8F8D8",
  matrixGreen = "#78C8A8",
  streamGreen = "#68B898",

  mindControl = "#B8A8E8",
  psychicPurple = "#C8B8F8",
  dominationViolet = "#D8C8FF",
  controlPurple = "#A898D8",
  mentalPurple = "#9888C8",

  skullGreen = "#78D8A8",
  shipPurple = "#A888C8",
  deathTech = "#88C8A8",
  fusionGreen = "#98D8B8",
  collectorGreen = "#68C898",

  circuitCyan = "#88C8D8",
  systemCyan = "#98D8E8",
  techCyan = "#A8E8F8",
  logicCyan = "#78B8C8",
  processCyan = "#68A8B8",

  alienTeal = "#78C8C8",
  otherworldTeal = "#88D8D8",
  nonhumanTeal = "#98E8E8",
  cosmicTeal = "#68B8B8",
  voidTeal = "#58A8A8",

  calculateGold = "#D8C888",
  logicGold = "#E8D898",
  computeGold = "#F8E8A8",
  coldGold = "#C8B878",
  calculusGold = "#B8A868",

  collectionBlue = "#8898D8",
  bottleBlue = "#98A8E8",
  specimenBlue = "#A8B8F8",
  preserveBlue = "#7888C8",
  archiveBlue = "#6878B8",

  probeRed = "#D88888",
  threatRed = "#E89898",
  analysisRed = "#F8A8A8",
  dangerRed = "#C87878",
  scanRed = "#B86868",

  upgradeGreen = "#88D898",
  evolveGreen = "#98E8A8",
  improveGreen = "#A8F8B8",
  progressGreen = "#78C888",
  enhanceGreen = "#68B878",

  sterileGray = "#A8A8B8",
  clinicalGray = "#B8B8C8",
  emotionlessGray = "#C8C8D8",
  coldGray = "#9898A8",
  logicalGray = "#888898",

  networkPurple = "#B898D8",
  connectedPurple = "#C8A8E8",
  hivePurple = "#D8B8F8",
  linkPurple = "#A888C8",
  nodePurple = "#9878B8",

  systemFailure = "#D88878",
  specimenEscape = "#C87868",
  criticalError = "#B86858",

  dataCollected = "#88D8A8",
  cityBottled = "#98E8B8",
  missionComplete = "#A8F8C8",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.neuralGreen,
      insert = plt.coluanPurple,
      visual = plt.dataMatrix,
      replace = plt.systemFailure,
      command = plt.calculateGold,
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
      bg_search = plt.calculateGold,
      bg_visual = plt.dataMatrix,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.neuralGreen,
      header2 = plt.coluanPurple,
      special = plt.mindControl,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.neuralGreen,
      indent = plt.bg_lighter,
      indent_scope = plt.neuralGreen,
      picker = plt.alienPurple,
      yank = plt.calculateGold,
      mark = plt.dataMatrix,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.neuralGreen,
        bg_alternate = plt.bg_darkest,
        indicator = plt.coluanPurple,
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
        fg_border = plt.mindGreen,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.neuralGreen,
      accent2 = plt.coluanPurple,
      accent3 = plt.dataMatrix,
      accent4 = plt.mindControl,
      accent5 = plt.circuitCyan,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.neuralGreen,
      rainbow2 = plt.coluanPurple,
      rainbow3 = plt.dataMatrix,
      rainbow4 = plt.mindControl,
      rainbow5 = plt.circuitCyan,
      rainbow6 = plt.calculateGold,
      rainbow7 = plt.collectionBlue,
    },

    syn = {
      attribute = plt.calculateGold,
      boolean = plt.neuralGreen,
      comment = plt.fg_dark,
      constant = plt.sterileGray,
      deprecated = plt.fg_mid,
      func = plt.dataMatrix,
      identifier = plt.fg_lightest,
      keyword = plt.neuralGreen,
      method = plt.codeStream,
      number = plt.logicGold,
      operator = plt.circuitCyan,
      parameter = plt.fg_mid,
      preproc = plt.coluanPurple,
      punct = plt.fg_mid,
      regex = plt.digitalFlow,
      statement = plt.neuralGreen,
      string = plt.dataMatrix,
      symbol = plt.calculateGold,
      type = plt.calculateGold,
      variable = plt.fg_lightest,
      special = plt.mindControl,
      special2 = plt.alienTeal,
      special3 = plt.networkPurple,
    },

    vcs = {
      added = plt.dataCollected,
      removed = plt.systemFailure,
      changed = plt.calculateGold,
    },

    diff = {
      add = plt.dataCollected,
      change = plt.calculateGold,
      delete = plt.systemFailure,
      text = plt.dataMatrix,
    },

    diag = {
      ok = plt.missionComplete,
      error = plt.systemFailure,
      warning = plt.probeRed,
      info = plt.circuitCyan,
      hint = plt.coluanPurple,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.probeRed,
      green = plt.neuralGreen,
      yellow = plt.calculateGold,
      blue = plt.collectionBlue,
      magenta = plt.coluanPurple,
      cyan = plt.circuitCyan,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.probeRed):brighten(0.2):to_hex(),
      green_bright = color(plt.neuralGreen):brighten(0.1):to_hex(),
      yellow_bright = color(plt.calculateGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.collectionBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.coluanPurple):brighten(0.2):to_hex(),
      cyan_bright = color(plt.circuitCyan):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.calculateGold,
      indexed2 = plt.neuralGreen,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.systemFailure,
      ["@comment.warning"] = plt.probeRed,
      ["@comment.todo"] = plt.calculateGold,
      ["@comment.note"] = plt.circuitCyan,

      ["@constant"] = plt.sterileGray,
      ["@constant.builtin"] = plt.sterileGray,
      ["@constant.macro"] = plt.calculateGold,

      ["@string"] = plt.dataMatrix,
      ["@string.documentation"] = plt.dataMatrix,
      ["@string.regex"] = plt.digitalFlow,
      ["@string.escape"] = plt.calculateGold,
      ["@string.special"] = plt.codeStream,
      ["@string.special.symbol"] = plt.logicGold,
      ["@string.special.url"] = plt.circuitCyan,
      ["@string.special.path"] = plt.dataMatrix,

      ["@character"] = plt.dataMatrix,
      ["@character.special"] = plt.calculateGold,

      ["@number"] = plt.logicGold,
      ["@number.float"] = plt.logicGold,

      ["@boolean"] = plt.neuralGreen,

      ["@function"] = plt.dataMatrix,
      ["@function.builtin"] = plt.dataMatrix,
      ["@function.call"] = plt.dataMatrix,
      ["@function.macro"] = plt.coluanPurple,
      ["@function.method"] = plt.codeStream,
      ["@function.method.call"] = plt.codeStream,

      ["@constructor"] = plt.calculateGold,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.neuralGreen,
      ["@keyword.coroutine"] = plt.brainGreen,
      ["@keyword.function"] = plt.neuralGreen,
      ["@keyword.operator"] = plt.circuitCyan,
      ["@keyword.return"] = plt.neuralGreen,
      ["@keyword.import"] = plt.coluanPurple,
      ["@keyword.storage"] = plt.neuralGreen,
      ["@keyword.repeat"] = plt.neuralGreen,
      ["@keyword.conditional"] = plt.neuralGreen,
      ["@keyword.exception"] = plt.systemFailure,
      ["@keyword.directive"] = plt.coluanPurple,
      ["@keyword.directive.define"] = plt.coluanPurple,

      ["@conditional"] = plt.neuralGreen,
      ["@conditional.ternary"] = plt.neuralGreen,

      ["@repeat"] = plt.neuralGreen,

      ["@label"] = plt.brainGreen,

      ["@operator"] = plt.circuitCyan,

      ["@exception"] = plt.systemFailure,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.synapseGreen,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.calculateGold,
      ["@type.builtin"] = plt.calculateGold,
      ["@type.definition"] = plt.calculateGold,
      ["@type.qualifier"] = plt.neuralGreen,

      ["@attribute"] = plt.calculateGold,
      ["@attribute.builtin"] = plt.calculateGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.calculateGold,
      ["@module.builtin"] = plt.calculateGold,

      ["@namespace"] = plt.calculateGold,
      ["@namespace.builtin"] = plt.calculateGold,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.circuitCyan,

      ["@tag"] = plt.neuralGreen,
      ["@tag.attribute"] = plt.calculateGold,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.neuralGreen,

      ["@markup.strong"] = { fg = plt.neuralGreen, bold = true },
      ["@markup.italic"] = { fg = plt.dataMatrix, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.mindControl, underline = true },
      ["@markup.heading"] = plt.neuralGreen,
      ["@markup.heading.1"] = plt.neuralGreen,
      ["@markup.heading.2"] = plt.coluanPurple,
      ["@markup.heading.3"] = plt.dataMatrix,
      ["@markup.heading.4"] = plt.mindControl,
      ["@markup.heading.5"] = plt.circuitCyan,
      ["@markup.heading.6"] = plt.calculateGold,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.calculateGold,
      ["@markup.link"] = plt.dataMatrix,
      ["@markup.link.label"] = plt.codeStream,
      ["@markup.link.url"] = plt.circuitCyan,
      ["@markup.raw"] = plt.dataMatrix,
      ["@markup.raw.block"] = plt.dataMatrix,
      ["@markup.list"] = plt.neuralGreen,
      ["@markup.list.checked"] = plt.dataCollected,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.dataCollected,
      ["@diff.minus"] = plt.systemFailure,
      ["@diff.delta"] = plt.calculateGold,

      ["@none"] = "none",
      ["@conceal"] = plt.coluanPurple,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.calculateGold,
      ["@constructor.javascript"] = plt.calculateGold,
      ["@constructor.typescript"] = plt.calculateGold,
      ["@namespace.rust"] = plt.calculateGold,
      ["@type.qualifier.rust"] = plt.neuralGreen,
      ["@constant.macro.c"] = plt.sterileGray,
      ["@constant.macro.cpp"] = plt.sterileGray,
      ["@namespace.go"] = plt.calculateGold,
      ["@property.css"] = plt.codeStream,
      ["@type.css"] = plt.neuralGreen,
      ["@label.json"] = plt.calculateGold,
      ["@field.yaml"] = plt.codeStream,
      ["@property.toml"] = plt.codeStream,
      ["@function.builtin.bash"] = plt.dataMatrix,
      ["@string.regexp"] = plt.digitalFlow,
      ["@character.special.regex"] = plt.calculateGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.calculateGold,
      ["@lsp.type.interface"] = plt.calculateGold,
      ["@lsp.type.struct"] = plt.calculateGold,
      ["@lsp.type.enum"] = plt.calculateGold,
      ["@lsp.type.enumMember"] = plt.sterileGray,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.calculateGold,

      ["@lsp.type.macro"] = plt.calculateGold,
      ["@lsp.type.decorator"] = plt.calculateGold,

      ["@lsp.type.builtinType"] = plt.calculateGold,
      ["@lsp.type.selfParameter"] = plt.synapseGreen,
      ["@lsp.type.typeParameter"] = plt.calculateGold,

      ["@lsp.type.array"] = plt.calculateGold,
      ["@lsp.type.object"] = plt.calculateGold,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.sterileGray,
      ["@lsp.type.enumConstant"] = plt.sterileGray,

      ["@lsp.type.event"] = plt.calculateGold,
      ["@lsp.type.regexp"] = plt.digitalFlow,
      ["@lsp.type.unresolvedReference"] = plt.calculateGold,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.sterileGray,
      ["@lsp.mod.async"] = plt.neuralGreen,
      ["@lsp.mod.static"] = plt.brainGreen,
      ["@lsp.mod.abstract"] = plt.calculateGold,
      ["@lsp.mod.defaultLibrary"] = plt.calculateGold,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Injustice League – Brainiac",
  author = "PrismPunk.nvim",
  description = "12th-level intellect, Coluan collector. Neural green networks, "
    .. "alien purple intelligence, data matrix streams. Mind control psychic, "
    .. "skull ship technology, bottle cities preserved. Cold calculation, emotionless logic, "
    .. "specimen collection. Resistance is futile—knowledge will be assimilated.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.systemFailure,
    base09 = palette.probeRed,
    base0A = palette.calculateGold,
    base0B = palette.neuralGreen,
    base0C = palette.circuitCyan,
    base0D = palette.collectionBlue,
    base0E = palette.coluanPurple,
    base0F = palette.mindControl,
  },

  palette = palette,
  get = M.get,
}
