local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0A0A0C",
  bg_darker = "#121214",
  bg_dark = "#1A1A1E",
  bg_mid = "#222228",
  bg_light = "#2A2A32",
  bg_lighter = "#32323C",
  bg_lightest = "#3A3A46",

  fg_lightest = "#F0F0F5",
  fg_light = "#D8D8E0",
  fg_mid = "#B0B0C0",
  fg_dark = "#8888A0",

  bg_alt1 = "#16161A",
  bg_alt2 = "#0E0E10",
  bg_alt3 = "#1E1E24",
  bg_alt4 = "#12121A",

  fairPlayWhite = "#F5F5FA",
  pureWhite = "#FFFFFF",
  justiceWhite = "#ECECF5",
  cleanWhite = "#E8E8F0",
  sharpWhite = "#DCDCE8",

  terrificBlack = "#1A1A1E",
  sleekBlack = "#0F0F12",
  professionalBlack = "#252528",
  sharpBlack = "#18181C",
  preciseBlack = "#0C0C0E",

  tSphereRed = "#E85D5D",
  sphereCore = "#F56B6B",
  aiRed = "#FF7979",
  orbEnergy = "#D84F4F",
  techRed = "#CC4141",

  holoBlue = "#5BA8D8",
  displayBlue = "#6BB8E8",
  interfaceBlue = "#7BC8F8",
  digitalBlue = "#4B98C8",
  projectionBlue = "#3B88B8",

  intelligenceGold = "#D8B870",
  geniusGold = "#E8C880",
  olympicGold = "#F8D890",
  achievementGold = "#C8A860",
  medalGold = "#B89850",

  dataGreen = "#70B88B",
  codeGreen = "#80C89B",
  analysisGreen = "#90D8AB",
  logicGreen = "#60A87B",
  streamGreen = "#50986B",

  techCyan = "#70C8C8",
  calcCyan = "#80D8D8",
  interfaceCyan = "#90E8E8",
  digitalCyan = "#60B8B8",
  processCyan = "#50A8A8",

  precisionGray = "#A0A0B0",
  analyticalGray = "#B0B0C0",
  measuredGray = "#C0C0D0",
  neutralGray = "#9090A0",
  logicGray = "#808090",

  quantumSilver = "#B8C0D0",
  advancedSilver = "#C8D0E0",
  edgeSilver = "#D8E0F0",
  futureGray = "#A8B0C0",
  innovationSilver = "#98A0B0",

  olympicBronze = "#C89870",
  achievementBronze = "#D8A880",
  medalBronze = "#E8B890",
  bronzeGlow = "#B88860",
  honorBronze = "#A87850",

  fairPlayGreen = "#70A890",
  justiceLogic = "#80B8A0",
  intellectGreen = "#90C8B0",
  reasonGreen = "#60987A",
  methodGreen = "#50886A",

  systemCritical = "#E85D5D",
  logicError = "#D84F4F",
  criticalRed = "#CC4141",

  problemSolved = "#70B88B",
  missionComplete = "#80C89B",
  solutionGreen = "#90D8AB",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.fairPlayWhite,
      insert = plt.holoBlue,
      visual = plt.dataGreen,
      replace = plt.tSphereRed,
      command = plt.intelligenceGold,
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
      bg_search = plt.intelligenceGold,
      bg_visual = plt.dataGreen,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.fairPlayWhite,
      header2 = plt.intelligenceGold,
      special = plt.holoBlue,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.precisionGray,
      indent = plt.bg_lighter,
      indent_scope = plt.holoBlue,
      picker = plt.tSphereRed,
      yank = plt.intelligenceGold,
      mark = plt.techCyan,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.fairPlayWhite,
        bg_alternate = plt.bg_darkest,
        indicator = plt.holoBlue,
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
        fg_border = plt.digitalBlue,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.fairPlayWhite,
      accent2 = plt.holoBlue,
      accent3 = plt.intelligenceGold,
      accent4 = plt.dataGreen,
      accent5 = plt.tSphereRed,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.fairPlayWhite,
      rainbow2 = plt.holoBlue,
      rainbow3 = plt.intelligenceGold,
      rainbow4 = plt.dataGreen,
      rainbow5 = plt.techCyan,
      rainbow6 = plt.tSphereRed,
      rainbow7 = plt.quantumSilver,
    },

    syn = {
      attribute = plt.intelligenceGold,
      boolean = plt.fairPlayWhite,
      comment = plt.fg_dark,
      constant = plt.pureWhite,
      deprecated = plt.fg_mid,
      func = plt.holoBlue,
      identifier = plt.fg_lightest,
      keyword = plt.fairPlayWhite,
      method = plt.digitalBlue,
      number = plt.olympicGold,
      operator = plt.techCyan,
      parameter = plt.fg_mid,
      preproc = plt.dataGreen,
      punct = plt.fg_mid,
      regex = plt.analysisGreen,
      statement = plt.fairPlayWhite,
      string = plt.holoBlue,
      symbol = plt.intelligenceGold,
      type = plt.intelligenceGold,
      variable = plt.fg_lightest,
      special = plt.quantumSilver,
      special2 = plt.tSphereRed,
      special3 = plt.fairPlayGreen,
    },

    vcs = {
      added = plt.dataGreen,
      removed = plt.systemCritical,
      changed = plt.intelligenceGold,
    },

    diff = {
      add = plt.dataGreen,
      change = plt.intelligenceGold,
      delete = plt.systemCritical,
      text = plt.holoBlue,
    },

    diag = {
      ok = plt.problemSolved,
      error = plt.systemCritical,
      warning = plt.olympicBronze,
      info = plt.displayBlue,
      hint = plt.techCyan,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.tSphereRed,
      green = plt.dataGreen,
      yellow = plt.intelligenceGold,
      blue = plt.holoBlue,
      magenta = plt.quantumSilver,
      cyan = plt.techCyan,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.tSphereRed):brighten(0.2):to_hex(),
      green_bright = color(plt.dataGreen):brighten(0.1):to_hex(),
      yellow_bright = color(plt.intelligenceGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.holoBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.quantumSilver):brighten(0.2):to_hex(),
      cyan_bright = color(plt.techCyan):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.intelligenceGold,
      indexed2 = plt.holoBlue,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.systemCritical,
      ["@comment.warning"] = plt.olympicBronze,
      ["@comment.todo"] = plt.intelligenceGold,
      ["@comment.note"] = plt.techCyan,

      ["@constant"] = plt.pureWhite,
      ["@constant.builtin"] = plt.pureWhite,
      ["@constant.macro"] = plt.intelligenceGold,

      ["@string"] = plt.holoBlue,
      ["@string.documentation"] = plt.holoBlue,
      ["@string.regex"] = plt.analysisGreen,
      ["@string.escape"] = plt.intelligenceGold,
      ["@string.special"] = plt.displayBlue,
      ["@string.special.symbol"] = plt.olympicGold,
      ["@string.special.url"] = plt.projectionBlue,
      ["@string.special.path"] = plt.holoBlue,

      ["@character"] = plt.holoBlue,
      ["@character.special"] = plt.intelligenceGold,

      ["@number"] = plt.olympicGold,
      ["@number.float"] = plt.olympicGold,

      ["@boolean"] = plt.fairPlayWhite,

      ["@function"] = plt.holoBlue,
      ["@function.builtin"] = plt.holoBlue,
      ["@function.call"] = plt.holoBlue,
      ["@function.macro"] = plt.dataGreen,
      ["@function.method"] = plt.digitalBlue,
      ["@function.method.call"] = plt.digitalBlue,

      ["@constructor"] = plt.intelligenceGold,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.fairPlayWhite,
      ["@keyword.coroutine"] = plt.cleanWhite,
      ["@keyword.function"] = plt.fairPlayWhite,
      ["@keyword.operator"] = plt.techCyan,
      ["@keyword.return"] = plt.fairPlayWhite,
      ["@keyword.import"] = plt.dataGreen,
      ["@keyword.storage"] = plt.fairPlayWhite,
      ["@keyword.repeat"] = plt.fairPlayWhite,
      ["@keyword.conditional"] = plt.fairPlayWhite,
      ["@keyword.exception"] = plt.systemCritical,
      ["@keyword.directive"] = plt.dataGreen,
      ["@keyword.directive.define"] = plt.dataGreen,

      ["@conditional"] = plt.fairPlayWhite,
      ["@conditional.ternary"] = plt.fairPlayWhite,

      ["@repeat"] = plt.fairPlayWhite,

      ["@label"] = plt.cleanWhite,

      ["@operator"] = plt.techCyan,

      ["@exception"] = plt.systemCritical,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.justiceWhite,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.intelligenceGold,
      ["@type.builtin"] = plt.intelligenceGold,
      ["@type.definition"] = plt.intelligenceGold,
      ["@type.qualifier"] = plt.fairPlayWhite,

      ["@attribute"] = plt.intelligenceGold,
      ["@attribute.builtin"] = plt.intelligenceGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.intelligenceGold,
      ["@module.builtin"] = plt.intelligenceGold,

      ["@namespace"] = plt.intelligenceGold,
      ["@namespace.builtin"] = plt.intelligenceGold,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.techCyan,

      ["@tag"] = plt.fairPlayWhite,
      ["@tag.attribute"] = plt.intelligenceGold,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.fairPlayWhite,

      ["@markup.strong"] = { fg = plt.fairPlayWhite, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.holoBlue, underline = true },
      ["@markup.heading"] = plt.fairPlayWhite,
      ["@markup.heading.1"] = plt.fairPlayWhite,
      ["@markup.heading.2"] = plt.intelligenceGold,
      ["@markup.heading.3"] = plt.holoBlue,
      ["@markup.heading.4"] = plt.dataGreen,
      ["@markup.heading.5"] = plt.techCyan,
      ["@markup.heading.6"] = plt.quantumSilver,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.intelligenceGold,
      ["@markup.link"] = plt.holoBlue,
      ["@markup.link.label"] = plt.digitalBlue,
      ["@markup.link.url"] = plt.projectionBlue,
      ["@markup.raw"] = plt.holoBlue,
      ["@markup.raw.block"] = plt.holoBlue,
      ["@markup.list"] = plt.fairPlayWhite,
      ["@markup.list.checked"] = plt.problemSolved,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.dataGreen,
      ["@diff.minus"] = plt.systemCritical,
      ["@diff.delta"] = plt.intelligenceGold,

      ["@none"] = "none",
      ["@conceal"] = plt.dataGreen,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.intelligenceGold,
      ["@constructor.javascript"] = plt.intelligenceGold,
      ["@constructor.typescript"] = plt.intelligenceGold,
      ["@namespace.rust"] = plt.intelligenceGold,
      ["@type.qualifier.rust"] = plt.fairPlayWhite,
      ["@constant.macro.c"] = plt.pureWhite,
      ["@constant.macro.cpp"] = plt.pureWhite,
      ["@namespace.go"] = plt.intelligenceGold,
      ["@property.css"] = plt.digitalBlue,
      ["@type.css"] = plt.fairPlayWhite,
      ["@label.json"] = plt.intelligenceGold,
      ["@field.yaml"] = plt.digitalBlue,
      ["@property.toml"] = plt.digitalBlue,
      ["@function.builtin.bash"] = plt.holoBlue,
      ["@string.regexp"] = plt.analysisGreen,
      ["@character.special.regex"] = plt.intelligenceGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.intelligenceGold,
      ["@lsp.type.interface"] = plt.intelligenceGold,
      ["@lsp.type.struct"] = plt.intelligenceGold,
      ["@lsp.type.enum"] = plt.intelligenceGold,
      ["@lsp.type.enumMember"] = plt.pureWhite,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.intelligenceGold,

      ["@lsp.type.macro"] = plt.intelligenceGold,
      ["@lsp.type.decorator"] = plt.intelligenceGold,

      ["@lsp.type.builtinType"] = plt.intelligenceGold,
      ["@lsp.type.selfParameter"] = plt.justiceWhite,
      ["@lsp.type.typeParameter"] = plt.intelligenceGold,

      ["@lsp.type.array"] = plt.intelligenceGold,
      ["@lsp.type.object"] = plt.intelligenceGold,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.pureWhite,
      ["@lsp.type.enumConstant"] = plt.pureWhite,

      ["@lsp.type.event"] = plt.intelligenceGold,
      ["@lsp.type.regexp"] = plt.analysisGreen,
      ["@lsp.type.unresolvedReference"] = plt.intelligenceGold,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.pureWhite,
      ["@lsp.mod.async"] = plt.fairPlayWhite,
      ["@lsp.mod.static"] = plt.cleanWhite,
      ["@lsp.mod.abstract"] = plt.intelligenceGold,
      ["@lsp.mod.defaultLibrary"] = plt.intelligenceGold,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Justice League – Mr. Terrific",
  author = "PrismPunk.nvim",
  description = "Third-smartest man alive. Michael Holt, genius inventor, Olympic athlete. "
    .. "Fair Play white and black, T-sphere red tech, holographic blue displays, intelligence gold. "
    .. "Data green analysis, tech cyan interfaces. No superpowers—pure excellence.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.systemCritical,
    base09 = palette.olympicBronze,
    base0A = palette.intelligenceGold,
    base0B = palette.dataGreen,
    base0C = palette.techCyan,
    base0D = palette.holoBlue,
    base0E = palette.quantumSilver,
    base0F = palette.fairPlayWhite,
  },

  palette = palette,
  get = M.get,
}
