local color = require("prismpunk.utils.color")

local palette = {
  fearVoid = "#1A1400",
  terrorBlack = "#221C00",
  dreadDepth = "#332800",
  panicCore = "#443800",
  parallaxYellow = "#FFFF00",
  fearBattery = "#FFDD00",
  panicGold = "#FFBB00",
  screamYellow = "#FFAA00",
  nightmareGlow = "#FF8800",
  coldSweat = "#FFFF88",
  tremblingBone = "#FFFFAA",
  ghostPale = "#FFFFCC",
  pureTerror = "#FFFFFF",
  bloodFear = "#FF2244",
  term_red = "#FF4466",
  term_green = "#44FF88",
  term_blue = "#44AAFF",

  bg_darkest = "#1A1400",
  fg_lightest = "#FFFFCC",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.parallaxYellow,
      insert = plt.fearBattery,
      visual = plt.panicGold,
      replace = plt.bloodFear,
      command = plt.screamYellow,
    },

    ui = {
      fg = plt.tremblingBone,
      fg_dim = plt.ghostPale,
      fg_dimmer = plt.coldSweat,
      fg_dark = plt.nightmareGlow,
      fg_reverse = plt.fearVoid,

      bg_m4 = plt.panicCore,
      bg_m3 = plt.dreadDepth,
      bg_m2 = plt.terrorBlack,
      bg_m1 = plt.fearVoid,
      bg_dim = plt.fearVoid,
      bg = plt.fearVoid,
      bg_p1 = plt.terrorBlack,
      bg_p2 = plt.dreadDepth,
      bg_gutter = opts.gutter and plt.dreadDepth or "none",
      bg_cursorline = plt.dreadDepth,
      bg_cursorline_alt = plt.terrorBlack,
      bg_search = plt.bloodFear,
      bg_visual = plt.panicGold,
      bg_statusline = plt.dreadDepth,

      border = plt.parallaxYellow,
      header1 = plt.parallaxYellow,
      header2 = plt.fearBattery,
      special = plt.screamYellow,
      nontext = plt.terrorBlack,
      whitespace = plt.panicCore,
      win_separator = plt.parallaxYellow,
      indent = plt.terrorBlack,
      indent_scope = plt.nightmareGlow,
      picker = plt.bloodFear,
      yank = plt.parallaxYellow,
      mark = plt.screamYellow,
      scrollbar = plt.dreadDepth,

      tabline = {
        bg = plt.fearVoid,
        fg_selected = plt.parallaxYellow,
        bg_selected = plt.dreadDepth,
        fg_inactive = plt.coldSweat,
        bg_inactive = plt.fearVoid,
        fg_alternate = plt.screamYellow,
        bg_alternate = plt.fearVoid,
        indicator = plt.fearBattery,
      },

      pmenu = {
        fg = plt.tremblingBone,
        fg_sel = "none",
        fg_border = plt.dreadDepth,
        bg_border = plt.dreadDepth,
        bg = plt.dreadDepth,
        bg_sel = plt.terrorBlack,
        bg_sbar = plt.dreadDepth,
        bg_thumb = plt.parallaxYellow,
      },

      float = {
        fg = plt.tremblingBone,
        bg = plt.terrorBlack,
        fg_border = plt.dreadDepth,
        bg_border = plt.terrorBlack,
      },
    },

    accent = {
      accent1 = plt.parallaxYellow,
      accent2 = plt.fearBattery,
      accent3 = plt.panicGold,
      accent4 = plt.screamYellow,
      accent5 = plt.nightmareGlow,
      invert = plt.dreadDepth,
    },

    rainbow = {
      rainbow1 = plt.parallaxYellow,
      rainbow2 = plt.fearBattery,
      rainbow3 = plt.panicGold,
      rainbow4 = plt.screamYellow,
      rainbow5 = plt.nightmareGlow,
      rainbow6 = plt.bloodFear,
      rainbow7 = plt.bloodFear,
    },

    syn = {
      attribute = plt.nightmareGlow,
      boolean = plt.parallaxYellow,
      comment = plt.coldSweat,
      constant = plt.pureTerror,
      deprecated = plt.dreadDepth,
      func = plt.fearBattery,
      identifier = plt.tremblingBone,
      keyword = plt.parallaxYellow,
      method = plt.panicGold,
      number = plt.pureTerror,
      operator = plt.bloodFear,
      parameter = plt.ghostPale,
      preproc = plt.bloodFear,
      punct = plt.coldSweat,
      regex = plt.screamYellow,
      statement = plt.parallaxYellow,
      string = plt.pureTerror,
      symbol = plt.nightmareGlow,
      type = plt.pureTerror,
      variable = plt.tremblingBone,
      special = plt.screamYellow,
      special2 = plt.bloodFear,
      special3 = plt.panicGold,
    },

    vcs = {
      added = plt.nightmareGlow,
      removed = plt.bloodFear,
      changed = plt.screamYellow,
    },

    diff = {
      add = plt.nightmareGlow,
      change = plt.screamYellow,
      delete = plt.bloodFear,
      text = plt.panicGold,
    },

    diag = {
      ok = plt.screamYellow,
      error = plt.bloodFear,
      warning = plt.bloodFear,
      info = plt.panicGold,
      hint = plt.nightmareGlow,
    },

    term = {
      black = plt.fearVoid,
      red = plt.term_red,
      green = plt.term_green,
      yellow = plt.parallaxYellow,
      blue = plt.term_blue,
      magenta = "#ff66ff",
      cyan = "#44ffcc",
      white = plt.pureTerror,

      black_bright = color(plt.fearVoid):brighten(0.7):to_hex(),
      red_bright = color(plt.term_red):brighten(0.2):to_hex(),
      green_bright = color(plt.term_green):brighten(0.1):to_hex(),
      yellow_bright = "#ffff44",
      blue_bright = color(plt.term_blue):brighten(0.3):to_hex(),
      magenta_bright = "#ff88ff",
      cyan_bright = "#88ffee",
      white_bright = plt.pureTerror,
      indexed1 = plt.bloodFear,
      indexed2 = plt.screamYellow,
    },

    treesitter = {
      ["@comment"] = plt.coldSweat,
      ["@comment.documentation"] = plt.ghostPale,
      ["@comment.error"] = plt.bloodFear,
      ["@comment.warning"] = plt.bloodFear,
      ["@comment.todo"] = plt.screamYellow,
      ["@comment.note"] = plt.panicGold,

      ["@constant"] = plt.pureTerror,
      ["@constant.builtin"] = plt.pureTerror,
      ["@constant.macro"] = plt.nightmareGlow,

      ["@string"] = plt.pureTerror,
      ["@string.documentation"] = plt.pureTerror,
      ["@string.regex"] = plt.screamYellow,
      ["@string.escape"] = plt.bloodFear,
      ["@string.special"] = plt.nightmareGlow,
      ["@string.special.symbol"] = plt.bloodFear,
      ["@string.special.url"] = plt.panicGold,
      ["@string.special.path"] = plt.pureTerror,

      ["@character"] = plt.pureTerror,
      ["@character.special"] = plt.bloodFear,

      ["@number"] = plt.pureTerror,
      ["@number.float"] = plt.pureTerror,

      ["@boolean"] = plt.parallaxYellow,

      ["@function"] = plt.fearBattery,
      ["@function.builtin"] = plt.fearBattery,
      ["@function.call"] = plt.fearBattery,
      ["@function.macro"] = plt.screamYellow,
      ["@function.method"] = plt.panicGold,
      ["@function.method.call"] = plt.panicGold,

      ["@constructor"] = plt.parallaxYellow,

      ["@parameter"] = plt.ghostPale,
      ["@parameter.builtin"] = plt.tremblingBone,

      ["@keyword"] = plt.parallaxYellow,
      ["@keyword.coroutine"] = plt.panicGold,
      ["@keyword.function"] = plt.parallaxYellow,
      ["@keyword.operator"] = plt.bloodFear,
      ["@keyword.return"] = plt.parallaxYellow,
      ["@keyword.import"] = plt.screamYellow,
      ["@keyword.storage"] = plt.parallaxYellow,
      ["@keyword.repeat"] = plt.parallaxYellow,
      ["@keyword.conditional"] = plt.parallaxYellow,
      ["@keyword.exception"] = plt.bloodFear,
      ["@keyword.directive"] = plt.screamYellow,
      ["@keyword.directive.define"] = plt.screamYellow,

      ["@conditional"] = plt.parallaxYellow,
      ["@conditional.ternary"] = plt.parallaxYellow,

      ["@repeat"] = plt.parallaxYellow,

      ["@label"] = plt.panicGold,

      ["@operator"] = plt.bloodFear,

      ["@exception"] = plt.bloodFear,

      ["@variable"] = plt.tremblingBone,
      ["@variable.builtin"] = plt.parallaxYellow,
      ["@variable.parameter"] = plt.ghostPale,
      ["@variable.member"] = plt.tremblingBone,

      ["@type"] = plt.pureTerror,
      ["@type.builtin"] = plt.pureTerror,
      ["@type.definition"] = plt.pureTerror,
      ["@type.qualifier"] = plt.parallaxYellow,

      ["@attribute"] = plt.nightmareGlow,
      ["@attribute.builtin"] = plt.screamYellow,

      ["@property"] = plt.tremblingBone,

      ["@field"] = plt.tremblingBone,

      ["@module"] = plt.tremblingBone,
      ["@module.builtin"] = plt.tremblingBone,

      ["@namespace"] = plt.tremblingBone,
      ["@namespace.builtin"] = plt.tremblingBone,

      ["@punctuation.delimiter"] = plt.coldSweat,
      ["@punctuation.bracket"] = plt.coldSweat,
      ["@punctuation.special"] = plt.bloodFear,

      ["@tag"] = plt.parallaxYellow,
      ["@tag.attribute"] = plt.screamYellow,
      ["@tag.delimiter"] = plt.coldSweat,
      ["@tag.builtin"] = plt.parallaxYellow,

      ["@markup.strong"] = { fg = plt.parallaxYellow, bold = true },
      ["@markup.italic"] = { fg = plt.tremblingBone, italic = true },
      ["@markup.strikethrough"] = { fg = plt.dreadDepth, strikethrough = true },
      ["@markup.underline"] = { fg = plt.bloodFear, underline = true },
      ["@markup.heading"] = plt.parallaxYellow,
      ["@markup.heading.1"] = plt.parallaxYellow,
      ["@markup.heading.2"] = plt.fearBattery,
      ["@markup.heading.3"] = plt.panicGold,
      ["@markup.heading.4"] = plt.screamYellow,
      ["@markup.heading.5"] = plt.nightmareGlow,
      ["@markup.heading.6"] = plt.bloodFear,
      ["@markup.quote"] = plt.coldSweat,
      ["@markup.math"] = plt.panicGold,
      ["@markup.link"] = plt.screamYellow,
      ["@markup.link.label"] = plt.panicGold,
      ["@markup.link.url"] = plt.screamYellow,
      ["@markup.raw"] = plt.pureTerror,
      ["@markup.raw.block"] = plt.pureTerror,
      ["@markup.list"] = plt.parallaxYellow,
      ["@markup.list.checked"] = plt.nightmareGlow,
      ["@markup.list.unchecked"] = plt.coldSweat,

      ["@diff.plus"] = plt.nightmareGlow,
      ["@diff.minus"] = plt.bloodFear,
      ["@diff.delta"] = plt.screamYellow,

      ["@none"] = "none",
      ["@conceal"] = plt.panicGold,
      ["@spell"] = plt.tremblingBone,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.tremblingBone,
      ["@constructor.python"] = plt.parallaxYellow,
      ["@constructor.javascript"] = plt.parallaxYellow,
      ["@constructor.typescript"] = plt.parallaxYellow,
      ["@namespace.rust"] = plt.tremblingBone,
      ["@type.qualifier.rust"] = plt.parallaxYellow,
      ["@constant.macro.c"] = plt.nightmareGlow,
      ["@constant.macro.cpp"] = plt.nightmareGlow,
      ["@namespace.go"] = plt.tremblingBone,
      ["@property.css"] = plt.panicGold,
      ["@type.css"] = plt.parallaxYellow,
      ["@label.json"] = plt.tremblingBone,
      ["@field.yaml"] = plt.panicGold,
      ["@property.toml"] = plt.panicGold,
      ["@function.builtin.bash"] = plt.fearBattery,
      ["@string.regexp"] = plt.screamYellow,
      ["@character.special.regex"] = plt.bloodFear,
    },

    lsp = {
      ["@lsp.type.class"] = plt.pureTerror,
      ["@lsp.type.interface"] = plt.pureTerror,
      ["@lsp.type.struct"] = plt.pureTerror,
      ["@lsp.type.enum"] = plt.pureTerror,
      ["@lsp.type.enumMember"] = plt.screamYellow,
      ["@lsp.type.property"] = plt.tremblingBone,
      ["@lsp.type.namespace"] = plt.tremblingBone,

      ["@lsp.type.macro"] = plt.nightmareGlow,
      ["@lsp.type.decorator"] = plt.parallaxYellow,

      ["@lsp.type.builtinType"] = plt.pureTerror,
      ["@lsp.type.selfParameter"] = plt.parallaxYellow,
      ["@lsp.type.typeParameter"] = plt.pureTerror,

      ["@lsp.type.array"] = plt.pureTerror,
      ["@lsp.type.object"] = plt.pureTerror,
      ["@lsp.type.key"] = plt.tremblingBone,
      ["@lsp.type.null"] = plt.pureTerror,
      ["@lsp.type.enumConstant"] = plt.screamYellow,

      ["@lsp.type.event"] = plt.pureTerror,
      ["@lsp.type.regexp"] = plt.screamYellow,
      ["@lsp.type.unresolvedReference"] = plt.bloodFear,

      ["@lsp.mod.deprecated"] = { fg = plt.dreadDepth, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.pureTerror,
      ["@lsp.mod.async"] = plt.parallaxYellow,
      ["@lsp.mod.static"] = plt.panicGold,
      ["@lsp.mod.abstract"] = plt.pureTerror,
      ["@lsp.mod.defaultLibrary"] = plt.pureTerror,
      ["@lsp.mod.documentation"] = plt.ghostPale,
    },
  }
end

return {
  name = "Emotional Entity – Parallax (Fear)",
  author = "PrismPunk.nvim",
  description = "The insect-headed god of fear. "
    .. "The living embodiment of terror that corrupted the greatest Green Lantern. "
    .. "Yellow light that makes willpower shatter.",

  base16 = {
    base00 = palette.fearVoid,
    base01 = palette.terrorBlack,
    base02 = palette.dreadDepth,
    base03 = palette.panicCore,
    base04 = palette.coldSweat,
    base05 = palette.ghostPale,
    base06 = palette.tremblingBone,
    base07 = palette.pureTerror,
    base08 = palette.bloodFear,
    base09 = palette.bloodFear,
    base0A = palette.screamYellow,
    base0B = palette.nightmareGlow,
    base0C = palette.panicGold,
    base0D = palette.parallaxYellow,
    base0E = palette.fearBattery,
    base0F = palette.nightmareGlow,
  },

  palette = palette,
  get = M.get,
}
