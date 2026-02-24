local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#0A0A0A",
  bg_darker = "#1A1A1A",
  bg_dark = "#2A2A2A",
  bg_mid = "#3A3A3A",
  bg_light = "#4A4A4A",
  bg_lighter = "#5A5A5A",
  bg_lightest = "#6A6A6A",

  fg_lightest = "#D8D8D8",
  fg_light = "#B8B8B8",
  fg_mid = "#787878",
  fg_dark = "#585858",

  bg_alt1 = "#151515",
  bg_alt2 = "#050505",
  bg_alt3 = "#252525",
  bg_alt4 = "#0F0F0F",

  voidCore = "#8C8C8C",
  voidGlow = "#6C6C6C",
  voidBright = "#ACACAC",
  voidDeep = "#4C4C4C",
  voidDark = "#2C2C2C",

  corruptedWill = "#8CAC8C",
  corruptedHope = "#8C8CAC",
  corruptedRage = "#AC8C8C",
  corruptedFear = "#ACAC8C",
  corruptedLove = "#AC8CAC",
  corruptedAvarice = "#AC9C8C",
  corruptedCompassion = "#9C8CAC",

  entropyEffect = "#7C7C7C",
  nullField = "#6C8C8C",
  decayPattern = "#8C7C7C",

  accent_red = "#AC8C8C",
  accent_pink = "#AC8C9C",
  accent_yellow = "#ACAC8C",
  accent_orange = "#AC9C8C",
  accent_green = "#8CAC8C",
  accent_blue = "#8C8CAC",
  accent_violet = "#9C8CAC",
  accent_aqua = "#8CACAC",
}

local M = {}

---@param opts table
---@param plt table
---@return table
---@diagnostic disable-next-line: redefined-local
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.voidCore,
      insert = plt.corruptedWill,
      visual = plt.nullField,
      replace = plt.corruptedRage,
      command = plt.voidBright,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_dark,
      fg_dimmer = plt.bg_alt3,
      fg_dark = plt.bg_alt2,
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
      bg_search = plt.voidGlow,
      bg_visual = plt.nullField,
      bg_statusline = plt.entropyEffect,
      border = plt.bg_alt4,
      header1 = plt.voidCore,
      header2 = plt.decayPattern,
      special = plt.entropyEffect,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.voidCore,
      indent = plt.bg_lighter,
      indent_scope = plt.voidGlow,
      picker = plt.corruptedRage,
      yank = plt.corruptedWill,
      mark = plt.corruptedHope,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.voidBright,
        bg_alternate = plt.bg_darkest,
        indicator = plt.decayPattern,
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
      accent1 = plt.voidCore,
      accent2 = plt.voidBright,
      accent3 = plt.decayPattern,
      accent4 = plt.fg_mid,
      accent5 = plt.corruptedRage,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.corruptedRage,
      rainbow2 = plt.corruptedAvarice,
      rainbow3 = plt.corruptedFear,
      rainbow4 = plt.corruptedWill,
      rainbow5 = plt.corruptedHope,
      rainbow6 = plt.corruptedCompassion,
      rainbow7 = plt.corruptedLove,
    },

    syn = {
      attribute = plt.accent_yellow,
      boolean = plt.corruptedAvarice,
      comment = plt.fg_dark,
      constant = plt.corruptedAvarice,
      deprecated = plt.fg_mid,
      func = plt.corruptedHope,
      identifier = plt.fg_lightest,
      keyword = plt.voidCore,
      method = plt.corruptedWill,
      number = plt.corruptedAvarice,
      operator = plt.corruptedRage,
      parameter = plt.fg_mid,
      preproc = plt.corruptedLove,
      punct = plt.fg_mid,
      regex = plt.corruptedFear,
      statement = plt.voidCore,
      string = plt.corruptedWill,
      symbol = plt.corruptedRage,
      type = plt.corruptedHope,
      variable = plt.fg_mid,
      special = plt.corruptedFear,
      special2 = plt.corruptedRage,
      special3 = plt.voidDeep,
    },

    vcs = {
      added = plt.corruptedWill,
      removed = plt.corruptedRage,
      changed = plt.corruptedFear,
    },

    diff = {
      add = plt.corruptedWill,
      change = plt.corruptedFear,
      delete = plt.corruptedRage,
      text = plt.corruptedHope,
    },

    diag = {
      ok = plt.corruptedWill,
      error = plt.corruptedRage,
      warning = plt.corruptedFear,
      info = plt.corruptedHope,
      hint = plt.corruptedCompassion,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.corruptedRage,
      green = plt.corruptedWill,
      yellow = plt.corruptedFear,
      blue = plt.corruptedHope,
      magenta = plt.corruptedLove,
      cyan = plt.decayPattern,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.corruptedRage):brighten(0.2):to_hex(),
      green_bright = color(plt.corruptedWill):brighten(0.1):to_hex(),
      yellow_bright = color(plt.corruptedFear):brighten(0.2):to_hex(),
      blue_bright = color(plt.corruptedHope):brighten(0.3):to_hex(),
      magenta_bright = color(plt.corruptedLove):brighten(0.2):to_hex(),
      cyan_bright = color(plt.decayPattern):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.voidBright,
      indexed2 = plt.corruptedRage,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.corruptedRage,
      ["@comment.warning"] = plt.corruptedFear,
      ["@comment.todo"] = plt.corruptedHope,
      ["@comment.note"] = plt.corruptedCompassion,

      ["@constant"] = plt.corruptedAvarice,
      ["@constant.builtin"] = plt.corruptedAvarice,
      ["@constant.macro"] = plt.corruptedFear,

      ["@string"] = plt.corruptedWill,
      ["@string.documentation"] = plt.corruptedWill,
      ["@string.regex"] = plt.corruptedFear,
      ["@string.escape"] = plt.corruptedLove,
      ["@string.special"] = plt.corruptedCompassion,
      ["@string.special.symbol"] = plt.corruptedRage,
      ["@string.special.url"] = plt.decayPattern,
      ["@string.special.path"] = plt.nullField,

      ["@character"] = plt.corruptedWill,
      ["@character.special"] = plt.corruptedLove,

      ["@number"] = plt.corruptedAvarice,
      ["@number.float"] = plt.corruptedAvarice,

      ["@boolean"] = plt.corruptedAvarice,

      ["@function"] = plt.corruptedHope,
      ["@function.builtin"] = plt.corruptedHope,
      ["@function.call"] = plt.corruptedHope,
      ["@function.macro"] = plt.corruptedLove,
      ["@function.method"] = plt.corruptedWill,
      ["@function.method.call"] = plt.corruptedWill,

      ["@constructor"] = plt.corruptedHope,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.voidCore,
      ["@keyword.coroutine"] = plt.voidBright,
      ["@keyword.function"] = plt.voidCore,
      ["@keyword.operator"] = plt.corruptedRage,
      ["@keyword.return"] = plt.voidCore,
      ["@keyword.import"] = plt.corruptedLove,
      ["@keyword.storage"] = plt.voidCore,
      ["@keyword.repeat"] = plt.voidCore,
      ["@keyword.conditional"] = plt.voidCore,
      ["@keyword.exception"] = plt.corruptedRage,
      ["@keyword.directive"] = plt.corruptedLove,
      ["@keyword.directive.define"] = plt.corruptedLove,

      ["@conditional"] = plt.voidCore,
      ["@conditional.ternary"] = plt.voidCore,

      ["@repeat"] = plt.voidCore,

      ["@label"] = plt.voidBright,

      ["@operator"] = plt.corruptedRage,

      ["@exception"] = plt.corruptedRage,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.voidBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.corruptedHope,
      ["@type.builtin"] = plt.corruptedHope,
      ["@type.definition"] = plt.corruptedHope,
      ["@type.qualifier"] = plt.voidCore,

      ["@attribute"] = plt.accent_yellow,
      ["@attribute.builtin"] = plt.corruptedFear,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.corruptedHope,
      ["@module.builtin"] = plt.corruptedHope,

      ["@namespace"] = plt.corruptedHope,
      ["@namespace.builtin"] = plt.corruptedHope,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.corruptedRage,

      ["@tag"] = plt.corruptedRage,
      ["@tag.attribute"] = plt.accent_yellow,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.corruptedRage,

      ["@markup.strong"] = { fg = plt.voidBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.fg_light, underline = true },
      ["@markup.heading"] = plt.voidCore,
      ["@markup.heading.1"] = plt.corruptedRage,
      ["@markup.heading.2"] = plt.corruptedAvarice,
      ["@markup.heading.3"] = plt.corruptedFear,
      ["@markup.heading.4"] = plt.corruptedWill,
      ["@markup.heading.5"] = plt.corruptedHope,
      ["@markup.heading.6"] = plt.corruptedCompassion,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.corruptedHope,
      ["@markup.link"] = plt.decayPattern,
      ["@markup.link.label"] = plt.corruptedHope,
      ["@markup.link.url"] = plt.nullField,
      ["@markup.raw"] = plt.corruptedWill,
      ["@markup.raw.block"] = plt.corruptedWill,
      ["@markup.list"] = plt.corruptedRage,
      ["@markup.list.checked"] = plt.corruptedWill,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.corruptedWill,
      ["@diff.minus"] = plt.corruptedRage,
      ["@diff.delta"] = plt.corruptedFear,

      ["@none"] = "none",
      ["@conceal"] = plt.voidDeep,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.corruptedHope,
      ["@constructor.javascript"] = plt.corruptedHope,
      ["@constructor.typescript"] = plt.corruptedHope,
      ["@namespace.rust"] = plt.corruptedHope,
      ["@type.qualifier.rust"] = plt.voidCore,
      ["@constant.macro.c"] = plt.corruptedFear,
      ["@constant.macro.cpp"] = plt.corruptedFear,
      ["@namespace.go"] = plt.corruptedHope,
      ["@property.css"] = plt.corruptedHope,
      ["@type.css"] = plt.corruptedRage,
      ["@label.json"] = plt.corruptedHope,
      ["@field.yaml"] = plt.corruptedHope,
      ["@property.toml"] = plt.corruptedHope,
      ["@function.builtin.bash"] = plt.corruptedHope,
      ["@string.regexp"] = plt.corruptedFear,
      ["@character.special.regex"] = plt.corruptedLove,
    },

    lsp = {
      ["@lsp.type.class"] = plt.corruptedHope,
      ["@lsp.type.interface"] = plt.corruptedHope,
      ["@lsp.type.struct"] = plt.corruptedHope,
      ["@lsp.type.enum"] = plt.corruptedHope,
      ["@lsp.type.enumMember"] = plt.corruptedAvarice,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.corruptedHope,

      ["@lsp.type.macro"] = plt.corruptedFear,
      ["@lsp.type.decorator"] = plt.corruptedHope,

      ["@lsp.type.builtinType"] = plt.corruptedHope,
      ["@lsp.type.selfParameter"] = plt.voidBright,
      ["@lsp.type.typeParameter"] = plt.corruptedHope,

      ["@lsp.type.array"] = plt.corruptedHope,
      ["@lsp.type.object"] = plt.corruptedHope,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.corruptedAvarice,
      ["@lsp.type.enumConstant"] = plt.corruptedAvarice,

      ["@lsp.type.event"] = plt.corruptedHope,
      ["@lsp.type.regexp"] = plt.corruptedFear,
      ["@lsp.type.unresolvedReference"] = plt.corruptedFear,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.corruptedAvarice,
      ["@lsp.mod.async"] = plt.voidCore,
      ["@lsp.mod.static"] = plt.voidBright,
      ["@lsp.mod.abstract"] = plt.corruptedHope,
      ["@lsp.mod.defaultLibrary"] = plt.corruptedHope,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Lantern Corps - Phantom (Corrupted)",
  author = "PrismPunk.nvim",
  description = "In Desperate Day, In Hopeless Night,"
    .. "The Phantom Ring is our last light."
    .. "We yearn for power, strength and might, "
    .. "I seize the ring, that is my right!",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.corruptedRage,
    base09 = palette.corruptedAvarice,
    base0A = palette.corruptedFear,
    base0B = palette.corruptedWill,
    base0C = palette.decayPattern,
    base0D = palette.voidCore,
    base0E = palette.voidDeep,
    base0F = palette.voidBright,
  },

  palette = palette,
  get = M.get,
}
