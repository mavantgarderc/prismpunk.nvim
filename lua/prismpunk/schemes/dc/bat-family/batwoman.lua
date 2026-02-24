local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#0D0809",
  bg_darker = "#140E10",
  bg_dark = "#1C1417",
  bg_mid = "#241B1E",
  bg_light = "#2D2225",
  bg_lighter = "#36292D",
  bg_lightest = "#3F3135",

  fg_lightest = "#F5E8EB",
  fg_light = "#E0CDD3",
  fg_mid = "#CBB2BB",
  fg_dark = "#B697A3",

  bg_alt1 = "#161012",
  bg_alt2 = "#0F0A0B",
  bg_alt3 = "#1F1619",
  bg_alt4 = "#11090C",

  crimsonRedCore = "#DC143C",
  crimsonRed = "#DC143C",
  crimsonRedBright = "#FF1744",
  crimsonRedDeep = "#B71C1C",

  scarletOrange = "#FF4500",
  scarletOrangeBright = "#FF6347",
  scarletOrangeCore = "#FF4500",
  scarletOrangeDeep = "#D93F00",

  tacticalGray = "#708090",
  tacticalGrayBright = "#90A0B0",
  tacticalGrayCore = "#708090",
  tacticalGrayDeep = "#5A6A78",

  fierceMagenta = "#E91E63",
  fierceMagentaBright = "#FF4081",
  fierceMagentaCore = "#E91E63",
  fierceMagentaDeep = "#C2185B",

  bloodRed = "#8B0000",
  bloodRedBright = "#B71C1C",
  bloodRedCore = "#8B0000",
  bloodRedDeep = "#6B0000",

  combatWhite = "#F5E8EB",
  combatWhiteCore = "#F5E8EB",
  combatWhiteBright = "#FFF5F7",

  shadowGray = "#6B6570",
  shadowGrayLight = "#857F8A",
  shadowGrayDark = "#54505A",

  rubyRed = "#E0115F",
  rubyRedBright = "#FF1773",
  rubyRedCore = "#E0115F",

  garnetRed = "#B22222",
  garnetRedBright = "#CD5C5C",
  garnetRedCore = "#B22222",

  warningRed = "#FF0000",
  warningRedBright = "#FF3333",
  warningRedCore = "#FF0000",

  currentGray = "#6B6570",
  currentGrayLight = "#857F8A",

  missionGreen = "#4CAF50",
  missionGreenCore = "#4CAF50",
  missionGreenBright = "#66BB6A",

  stealthViolet = "#9C27B0",
  stealthVioletCore = "#9C27B0",

  voidBlack = "#0D0809",

  successGreen = "#4CAF50",
  errorRed = "#DC143C",
  warningAmber = "#FF4500",
  infoBlue = "#708090",

  seaweedGreenCore = "#4CAF50",
  anglerYellowCore = "#FF4500",
  anemoneRedCore = "#DC143C",

  coralPink = "#E91E63",
  coralPinkBright = "#FF4081",
  coralPinkCore = "#E91E63",
  coralPinkDeep = "#C2185B",

  pressureWhite = "#F5E8EB",
  pressureWhiteCore = "#F5E8EB",
  pressureWhiteBright = "#FFF5F7",

  depthBlack = "#0D0809",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.crimsonRedCore,
      insert = plt.scarletOrangeCore,
      visual = plt.fierceMagentaCore,
      replace = plt.warningRedCore,
      command = plt.tacticalGrayCore,
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
      bg_search = plt.scarletOrangeDeep,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.currentGray,
      header1 = plt.crimsonRedBright,
      header2 = plt.scarletOrangeBright,
      special = plt.fierceMagenta,
      nontext = plt.bg_lightest,
      whitespace = plt.bg_lightest,
      win_separator = plt.currentGray,
      indent = plt.bg_lighter,
      indent_scope = plt.crimsonRedCore,
      picker = plt.fierceMagenta,
      yank = plt.combatWhiteBright,
      mark = plt.bloodRed,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_dark,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.crimsonRedBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.crimsonRedCore,
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
      accent1 = plt.crimsonRedCore,
      accent2 = plt.fierceMagentaCore,
      accent3 = plt.scarletOrangeCore,
      accent4 = plt.tacticalGrayCore,
      accent5 = plt.bloodRedCore,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.crimsonRedBright,
      rainbow2 = plt.scarletOrangeBright,
      rainbow3 = plt.fierceMagentaBright,
      rainbow4 = plt.tacticalGrayBright,
      rainbow5 = plt.rubyRedBright,
      rainbow6 = plt.garnetRedBright,
      rainbow7 = plt.bloodRedBright,
    },

    syn = {
      attribute = plt.fierceMagenta,
      boolean = plt.tacticalGray,
      comment = plt.shadowGray,
      constant = plt.combatWhite,
      deprecated = plt.voidBlack,
      func = plt.scarletOrangeCore,
      identifier = plt.fg_lightest,
      keyword = plt.crimsonRedCore,
      method = plt.scarletOrangeBright,
      number = plt.combatWhite,
      operator = plt.fierceMagentaCore,
      parameter = plt.fg_mid,
      preproc = plt.bloodRedCore,
      punct = plt.fg_dark,
      regex = plt.stealthViolet,
      statement = plt.crimsonRedCore,
      string = plt.scarletOrangeCore,
      symbol = plt.fierceMagenta,
      type = plt.tacticalGrayCore,
      variable = plt.fg_lightest,
      special = plt.fierceMagenta,
      special2 = plt.rubyRed,
      special3 = plt.garnetRed,
    },

    vcs = {
      added = plt.missionGreenCore,
      removed = plt.warningRedCore,
      changed = plt.scarletOrangeCore,
    },

    diff = {
      add = plt.missionGreenCore,
      change = plt.scarletOrangeCore,
      delete = plt.warningRedCore,
      text = plt.fierceMagenta,
    },

    diag = {
      ok = plt.successGreen,
      error = plt.errorRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.fierceMagenta,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.crimsonRedCore,
      green = plt.missionGreenCore,
      yellow = plt.scarletOrangeCore,
      blue = plt.tacticalGrayCore,
      magenta = plt.fierceMagentaCore,
      cyan = plt.rubyRedCore,
      white = plt.combatWhiteCore,
      black_bright = color(plt.bg_darker):brighten(0.5):to_hex(),
      red_bright = color(plt.crimsonRedBright):brighten(0.15):to_hex(),
      green_bright = color(plt.missionGreenBright):brighten(0.15):to_hex(),
      yellow_bright = color(plt.scarletOrangeBright):brighten(0.15):to_hex(),
      blue_bright = color(plt.tacticalGrayBright):brighten(0.18):to_hex(),
      magenta_bright = color(plt.fierceMagentaBright):brighten(0.15):to_hex(),
      cyan_bright = color(plt.rubyRedBright):brighten(0.15):to_hex(),
      white_bright = plt.combatWhiteBright,
      indexed1 = plt.crimsonRed,
      indexed2 = plt.fierceMagenta,
    },

    treesitter = {
      ["@comment"] = plt.shadowGray,
      ["@comment.documentation"] = plt.shadowGrayLight,
      ["@comment.error"] = plt.errorRed,
      ["@comment.warning"] = plt.warningAmber,
      ["@comment.todo"] = plt.fierceMagentaBright,
      ["@comment.note"] = plt.fierceMagenta,

      ["@constant"] = plt.combatWhite,
      ["@constant.builtin"] = plt.combatWhiteCore,
      ["@constant.macro"] = plt.fierceMagenta,

      ["@string"] = plt.scarletOrangeCore,
      ["@string.documentation"] = plt.scarletOrangeCore,
      ["@string.regex"] = plt.stealthViolet,
      ["@string.escape"] = plt.fierceMagentaBright,
      ["@string.special"] = plt.scarletOrangeBright,
      ["@string.special.symbol"] = plt.fierceMagenta,
      ["@string.special.url"] = plt.tacticalGray,
      ["@string.special.path"] = plt.scarletOrangeCore,

      ["@character"] = plt.scarletOrangeCore,
      ["@character.special"] = plt.fierceMagenta,

      ["@number"] = plt.combatWhite,
      ["@number.float"] = plt.combatWhiteCore,

      ["@boolean"] = plt.tacticalGray,

      ["@function"] = plt.scarletOrangeCore,
      ["@function.builtin"] = plt.scarletOrangeCore,
      ["@function.call"] = plt.scarletOrangeCore,
      ["@function.macro"] = plt.bloodRedCore,
      ["@function.method"] = plt.scarletOrangeBright,
      ["@function.method.call"] = plt.scarletOrangeBright,

      ["@constructor"] = plt.tacticalGrayCore,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.crimsonRedCore,
      ["@keyword.coroutine"] = plt.bloodRedCore,
      ["@keyword.function"] = plt.crimsonRedCore,
      ["@keyword.operator"] = plt.fierceMagentaCore,
      ["@keyword.return"] = plt.crimsonRedCore,
      ["@keyword.import"] = plt.bloodRedCore,
      ["@keyword.storage"] = plt.crimsonRedCore,
      ["@keyword.repeat"] = plt.crimsonRedCore,
      ["@keyword.conditional"] = plt.crimsonRedCore,
      ["@keyword.exception"] = plt.warningRedCore,
      ["@keyword.directive"] = plt.bloodRedCore,
      ["@keyword.directive.define"] = plt.bloodRedCore,

      ["@conditional"] = plt.crimsonRedCore,
      ["@conditional.ternary"] = plt.crimsonRedCore,

      ["@repeat"] = plt.crimsonRedCore,

      ["@label"] = plt.fierceMagenta,

      ["@operator"] = plt.fierceMagentaCore,

      ["@exception"] = plt.warningRedCore,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.crimsonRedBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.tacticalGrayCore,
      ["@type.builtin"] = plt.tacticalGrayCore,
      ["@type.definition"] = plt.tacticalGrayCore,
      ["@type.qualifier"] = plt.crimsonRedCore,

      ["@attribute"] = plt.fierceMagenta,
      ["@attribute.builtin"] = plt.fierceMagenta,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.tacticalGrayCore,
      ["@module.builtin"] = plt.tacticalGrayCore,

      ["@namespace"] = plt.tacticalGrayCore,
      ["@namespace.builtin"] = plt.tacticalGrayCore,

      ["@punctuation.delimiter"] = plt.fg_dark,
      ["@punctuation.bracket"] = plt.fg_dark,
      ["@punctuation.special"] = plt.fierceMagentaCore,

      ["@tag"] = plt.crimsonRedCore,
      ["@tag.attribute"] = plt.fierceMagenta,
      ["@tag.delimiter"] = plt.fierceMagentaCore,
      ["@tag.builtin"] = plt.crimsonRedCore,

      ["@markup.strong"] = { fg = plt.crimsonRedBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.shadowGray, strikethrough = true },
      ["@markup.underline"] = { fg = plt.fierceMagenta, underline = true },
      ["@markup.heading"] = plt.crimsonRedBright,
      ["@markup.heading.1"] = plt.crimsonRedBright,
      ["@markup.heading.2"] = plt.scarletOrangeBright,
      ["@markup.heading.3"] = plt.fierceMagentaBright,
      ["@markup.heading.4"] = plt.tacticalGrayBright,
      ["@markup.heading.5"] = plt.rubyRedBright,
      ["@markup.heading.6"] = plt.garnetRedBright,
      ["@markup.quote"] = plt.shadowGray,
      ["@markup.math"] = plt.combatWhite,
      ["@markup.link"] = plt.tacticalGray,
      ["@markup.link.label"] = plt.tacticalGrayBright,
      ["@markup.link.url"] = plt.tacticalGray,
      ["@markup.raw"] = plt.scarletOrangeCore,
      ["@markup.raw.block"] = plt.scarletOrangeCore,
      ["@markup.list"] = plt.crimsonRedCore,
      ["@markup.list.checked"] = plt.missionGreenCore,
      ["@markup.list.unchecked"] = plt.shadowGray,

      ["@diff.plus"] = plt.missionGreenCore,
      ["@diff.minus"] = plt.warningRedCore,
      ["@diff.delta"] = plt.scarletOrangeCore,

      ["@none"] = "none",
      ["@conceal"] = plt.bg_lightest,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.tacticalGrayCore,
      ["@constructor.javascript"] = plt.tacticalGrayCore,
      ["@constructor.typescript"] = plt.tacticalGrayCore,
      ["@namespace.rust"] = plt.tacticalGrayCore,
      ["@type.qualifier.rust"] = plt.crimsonRedCore,
      ["@constant.macro.c"] = plt.fierceMagenta,
      ["@constant.macro.cpp"] = plt.fierceMagenta,
      ["@namespace.go"] = plt.tacticalGrayCore,
      ["@property.css"] = plt.scarletOrangeBright,
      ["@type.css"] = plt.crimsonRedCore,
      ["@label.json"] = plt.fierceMagenta,
      ["@field.yaml"] = plt.scarletOrangeBright,
      ["@property.toml"] = plt.scarletOrangeBright,
      ["@function.builtin.bash"] = plt.scarletOrangeCore,
      ["@string.regexp"] = plt.stealthViolet,
      ["@character.special.regex"] = plt.fierceMagenta,
    },

    lsp = {
      ["@lsp.type.class"] = plt.tacticalGrayCore,
      ["@lsp.type.interface"] = plt.tacticalGrayCore,
      ["@lsp.type.struct"] = plt.tacticalGrayCore,
      ["@lsp.type.enum"] = plt.tacticalGrayCore,
      ["@lsp.type.enumMember"] = plt.combatWhiteCore,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.tacticalGrayCore,

      ["@lsp.type.macro"] = plt.fierceMagenta,
      ["@lsp.type.decorator"] = plt.fierceMagenta,

      ["@lsp.type.builtinType"] = plt.tacticalGrayCore,
      ["@lsp.type.selfParameter"] = plt.crimsonRedBright,
      ["@lsp.type.typeParameter"] = plt.tacticalGrayCore,

      ["@lsp.type.array"] = plt.tacticalGrayCore,
      ["@lsp.type.object"] = plt.tacticalGrayCore,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.combatWhiteCore,
      ["@lsp.type.enumConstant"] = plt.combatWhiteCore,

      ["@lsp.type.event"] = plt.tacticalGrayCore,
      ["@lsp.type.regexp"] = plt.stealthViolet,
      ["@lsp.type.unresolvedReference"] = plt.tacticalGrayCore,

      ["@lsp.mod.deprecated"] = { fg = plt.voidBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.combatWhiteCore,
      ["@lsp.mod.async"] = plt.crimsonRedCore,
      ["@lsp.mod.static"] = plt.crimsonRedBright,
      ["@lsp.mod.abstract"] = plt.tacticalGrayCore,
      ["@lsp.mod.defaultLibrary"] = plt.tacticalGrayCore,
      ["@lsp.mod.documentation"] = plt.shadowGrayLight,
    },
  }
end

return {
  name = "Punk – Batwoman",
  author = "PrismPunk.nvim",
  description = "Kate Kane's fierce vigilance — crimson red, scarlet orange, tactical precision, bold power.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.shadowGray,
    base04 = palette.shadowGrayLight,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.warningRedCore,
    base09 = palette.scarletOrangeCore,
    base0A = palette.fierceMagentaCore,
    base0B = palette.scarletOrangeCore,
    base0C = palette.tacticalGrayCore,
    base0D = palette.crimsonRedCore,
    base0E = palette.bloodRedCore,
    base0F = palette.stealthVioletCore,
  },

  palette = palette,
  get = M.get,
}
