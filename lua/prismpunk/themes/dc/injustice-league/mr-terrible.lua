local color = require("prismpunk.utils.color")
local palette = require("prismpunk.palettes.dc.injustice-league.mr-terrible")

local M = {}

M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.regime_gold,
      insert = plt.neural_red,
      visual = plt.holt_teal,
      replace = plt.control_pulse,
      command = plt.terffic_teal,
    },

    ui = {
      fg = plt.obedience_gold,
      fg_dim = plt.control_gold,
      fg_dimmer = plt.regime_gold,
      fg_dark = plt.circuit_silver,
      fg_reverse = plt.void_black,

      bg_m4 = plt.neural_glow,
      bg_m3 = plt.control_core,
      bg_m2 = plt.regime_void,
      bg_m1 = plt.void_black,
      bg_dim = plt.void_black,
      bg = plt.void_black,
      bg_p1 = plt.regime_void,
      bg_p2 = plt.control_core,
      bg_gutter = opts.gutter and plt.control_core or "none",
      bg_cursorline = plt.control_core,
      bg_cursorline_alt = plt.regime_void,
      bg_search = plt.mind_lock,
      bg_visual = plt.regime_red,
      bg_statusline = plt.control_core,

      border = plt.holt_teal, -- Signature teal for identity
      header1 = plt.regime_gold,
      header2 = plt.neural_red,
      special = plt.holt_teal,
      nontext = plt.circuit_silver, -- Better contrast
      whitespace = plt.steel_grey, -- Better contrast
      win_separator = plt.holt_teal, -- Signature teal for identity
      indent = plt.regime_void,
      indent_scope = plt.steel_grey,
      picker = plt.obedience_gold,
      yank = plt.control_pulse,
      mark = plt.neural_red,
      scrollbar = plt.control_core,

      tabline = {
        bg = plt.void_black,
        fg_selected = plt.obedience_gold,
        bg_selected = plt.control_core,
        fg_inactive = plt.circuit_silver, -- Better contrast
        bg_inactive = plt.void_black,
        fg_alternate = plt.regime_gold,
        bg_alternate = plt.void_black,
        indicator = plt.neural_red,
      },

      pmenu = {
        fg = plt.obedience_gold,
        fg_sel = "none",
        fg_border = plt.control_core,
        bg_border = plt.control_core,
        bg = plt.control_core,
        bg_sel = plt.regime_void,
        bg_sbar = plt.control_core,
        bg_thumb = plt.holt_teal, -- Signature teal for identity
      },

      float = {
        fg = plt.obedience_gold,
        bg = plt.regime_void,
        fg_border = plt.holt_teal, -- Signature teal for identity
        bg_border = plt.regime_void,
      },
    },

    accent = {
      accent1 = plt.regime_gold,
      accent2 = plt.neural_red,
      accent3 = plt.holt_teal,
      accent4 = plt.terffic_teal,
      accent5 = plt.control_pulse,
      invert = plt.control_core,
    },

    rainbow = {
      rainbow1 = plt.regime_gold,
      rainbow2 = plt.control_gold,
      rainbow3 = plt.obedience_gold,
      rainbow4 = plt.holt_teal,
      rainbow5 = plt.cold_logic,
      rainbow6 = plt.neural_red,
      rainbow7 = plt.control_pulse,
    },

    syn = {
      attribute = plt.obedience_gold,
      boolean = plt.neural_red,
      comment = plt.circuit_silver, -- Brighter for better contrast
      constant = plt.control_gold,
      deprecated = plt.neural_glow,
      func = plt.regime_gold,
      identifier = plt.obedience_gold,
      keyword = plt.regime_gold,
      method = plt.holt_teal,
      number = plt.mind_lock,
      operator = plt.terffic_teal,
      parameter = plt.circuit_silver, -- Brighter for better contrast
      preproc = plt.regime_red,
      punct = plt.control_gold,
      regex = plt.cold_logic,
      statement = plt.regime_gold,
      string = plt.nanite_cyan, -- Bright for contrast
      symbol = plt.obedience_gold,
      type = plt.holt_teal,
      variable = plt.obedience_gold,
      special = plt.control_pulse,
      special2 = plt.terffic_teal,
      special3 = plt.neural_red,
    },

    vcs = { added = plt.nanite_cyan, removed = plt.regime_red, changed = plt.holt_teal },
    diff = { add = plt.nanite_cyan, change = plt.cold_logic, delete = plt.regime_red, text = plt.control_pulse },
    diag = {
      ok = plt.nanite_cyan,
      error = plt.neural_red,
      warning = plt.regime_gold,
      info = plt.holt_teal,
      hint = plt.terffic_teal,
    },

    term = {
      black = plt.void_black,
      red = plt.term_red,
      green = plt.term_green,
      yellow = plt.term_gold,
      blue = plt.term_blue,
      magenta = plt.term_purple,
      cyan = plt.term_cyan,
      white = plt.obedience_gold,

      black_bright = color(plt.void_black):brighten(0.9):to_hex(),
      red_bright = plt.term_red_bright,
      green_bright = plt.term_green_bright,
      yellow_bright = plt.term_gold_bright,
      blue_bright = plt.term_blue_bright,
      magenta_bright = plt.term_purple_bright,
      cyan_bright = plt.term_cyan_bright,
      white_bright = "#ffffff",
      indexed1 = plt.regime_gold,
      indexed2 = plt.neural_red,
    },

    treesitter = {
      ["@comment"] = plt.steel_grey,
      ["@comment.documentation"] = plt.control_gold,
      ["@comment.error"] = plt.neural_red,
      ["@comment.warning"] = plt.regime_gold,
      ["@comment.todo"] = plt.holt_teal,
      ["@comment.note"] = plt.terffic_teal,

      ["@constant"] = plt.control_gold,
      ["@constant.builtin"] = plt.control_gold,
      ["@constant.macro"] = plt.mind_lock,

      ["@string"] = plt.nanite_cyan,
      ["@string.documentation"] = plt.nanite_cyan,
      ["@string.regex"] = plt.cold_logic,
      ["@string.escape"] = plt.terffic_teal,
      ["@string.special"] = plt.regime_red,
      ["@string.special.symbol"] = plt.obedience_gold,
      ["@string.special.url"] = plt.holt_teal,
      ["@string.special.path"] = plt.nanite_cyan,

      ["@character"] = plt.nanite_cyan,
      ["@character.special"] = plt.terffic_teal,

      ["@number"] = plt.mind_lock,
      ["@number.float"] = plt.mind_lock,

      ["@boolean"] = plt.regime_red,

      ["@function"] = plt.regime_gold,
      ["@function.builtin"] = plt.regime_gold,
      ["@function.call"] = plt.regime_gold,
      ["@function.macro"] = plt.holt_teal,
      ["@function.method"] = plt.holt_teal,
      ["@function.method.call"] = plt.holt_teal,

      ["@constructor"] = plt.obedience_gold,

      ["@parameter"] = plt.steel_grey,
      ["@parameter.builtin"] = plt.obedience_gold,

      ["@keyword"] = plt.regime_gold,
      ["@keyword.coroutine"] = plt.regime_red,
      ["@keyword.function"] = plt.regime_gold,
      ["@keyword.operator"] = plt.terffic_teal,
      ["@keyword.return"] = plt.regime_gold,
      ["@keyword.import"] = plt.nanite_cyan,
      ["@keyword.storage"] = plt.regime_gold,
      ["@keyword.repeat"] = plt.regime_gold,
      ["@keyword.conditional"] = plt.regime_gold,
      ["@keyword.exception"] = plt.control_pulse,
      ["@keyword.directive"] = plt.regime_red,
      ["@keyword.directive.define"] = plt.regime_red,

      ["@conditional"] = plt.regime_gold,
      ["@conditional.ternary"] = plt.regime_gold,

      ["@repeat"] = plt.regime_gold,

      ["@label"] = plt.holt_teal,

      ["@operator"] = plt.terffic_teal,

      ["@exception"] = plt.control_pulse,

      ["@variable"] = plt.obedience_gold,
      ["@variable.builtin"] = plt.control_gold,
      ["@variable.parameter"] = plt.steel_grey,
      ["@variable.member"] = plt.obedience_gold,

      ["@type"] = plt.holt_teal,
      ["@type.builtin"] = plt.holt_teal,
      ["@type.definition"] = plt.holt_teal,
      ["@type.qualifier"] = plt.regime_gold,

      ["@attribute"] = plt.obedience_gold,
      ["@attribute.builtin"] = plt.holt_teal,

      ["@property"] = plt.obedience_gold,
      ["@field"] = plt.obedience_gold,
      ["@module"] = plt.obedience_gold,
      ["@module.builtin"] = plt.obedience_gold,
      ["@namespace"] = plt.obedience_gold,
      ["@namespace.builtin"] = plt.obedience_gold,

      ["@punctuation.delimiter"] = plt.control_gold,
      ["@punctuation.bracket"] = plt.steel_grey,
      ["@punctuation.special"] = plt.terffic_teal,

      ["@tag"] = plt.regime_gold,
      ["@tag.attribute"] = plt.holt_teal,
      ["@tag.delimiter"] = plt.control_gold,
      ["@tag.builtin"] = plt.regime_gold,

      ["@markup.strong"] = { fg = plt.regime_gold, bold = true },
      ["@markup.italic"] = { fg = plt.obedience_gold, italic = true },
      ["@markup.strikethrough"] = { fg = plt.neural_glow, strikethrough = true },
      ["@markup.underline"] = { fg = plt.neural_red, underline = true },
      ["@markup.heading"] = plt.regime_gold,
      ["@markup.heading.1"] = plt.regime_gold,
      ["@markup.heading.2"] = plt.control_gold,
      ["@markup.heading.3"] = plt.obedience_gold,
      ["@markup.heading.4"] = plt.holt_teal,
      ["@markup.heading.5"] = plt.terffic_teal,
      ["@markup.heading.6"] = plt.neural_red,
      ["@markup.quote"] = plt.steel_grey,
      ["@markup.math"] = plt.cold_logic,
      ["@markup.link"] = plt.terffic_teal,
      ["@markup.link.label"] = plt.control_pulse,
      ["@markup.link.url"] = plt.holt_teal,
      ["@markup.raw"] = plt.nanite_cyan,
      ["@markup.raw.block"] = plt.nanite_cyan,
      ["@markup.list"] = plt.regime_gold,
      ["@markup.list.checked"] = plt.nanite_cyan,
      ["@markup.list.unchecked"] = plt.steel_grey,

      ["@diff.plus"] = plt.nanite_cyan,
      ["@diff.minus"] = plt.regime_red,
      ["@diff.delta"] = plt.holt_teal,

      ["@none"] = "none",
      ["@conceal"] = plt.control_gold,
      ["@spell"] = plt.obedience_gold,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.obedience_gold,
      ["@constructor.python"] = plt.regime_gold,
      ["@constructor.javascript"] = plt.regime_gold,
      ["@constructor.typescript"] = plt.regime_gold,
      ["@namespace.rust"] = plt.obedience_gold,
      ["@type.qualifier.rust"] = plt.regime_gold,
      ["@constant.macro.c"] = plt.mind_lock,
      ["@constant.macro.cpp"] = plt.mind_lock,
      ["@namespace.go"] = plt.obedience_gold,
      ["@property.css"] = plt.holt_teal,
      ["@type.css"] = plt.regime_gold,
      ["@label.json"] = plt.obedience_gold,
      ["@field.yaml"] = plt.steel_grey,
      ["@property.toml"] = plt.steel_grey,
      ["@function.builtin.bash"] = plt.holt_teal,
      ["@string.regexp"] = plt.cold_logic,
      ["@character.special.regex"] = plt.terffic_teal,
    },

    lsp = {
      ["@lsp.type.class"] = plt.holt_teal,
      ["@lsp.type.interface"] = plt.holt_teal,
      ["@lsp.type.struct"] = plt.holt_teal,
      ["@lsp.type.enum"] = plt.holt_teal,
      ["@lsp.type.enumMember"] = plt.control_gold,
      ["@lsp.type.property"] = plt.obedience_gold,
      ["@lsp.type.namespace"] = plt.obedience_gold,

      ["@lsp.type.macro"] = plt.mind_lock,
      ["@lsp.type.decorator"] = plt.regime_gold,

      ["@lsp.type.builtinType"] = plt.holt_teal,
      ["@lsp.type.selfParameter"] = plt.regime_gold,
      ["@lsp.type.typeParameter"] = plt.holt_teal,

      ["@lsp.type.array"] = plt.holt_teal,
      ["@lsp.type.object"] = plt.holt_teal,
      ["@lsp.type.key"] = plt.obedience_gold,
      ["@lsp.type.null"] = plt.control_gold,
      ["@lsp.type.enumConstant"] = plt.control_gold,

      ["@lsp.type.event"] = plt.holt_teal,
      ["@lsp.type.regexp"] = plt.cold_logic,
      ["@lsp.type.unresolvedReference"] = plt.neural_red,

      ["@lsp.mod.deprecated"] = { fg = plt.neural_glow, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.control_gold,
      ["@lsp.mod.async"] = plt.regime_gold,
      ["@lsp.mod.static"] = plt.holt_teal,
      ["@lsp.mod.abstract"] = plt.holt_teal,
      ["@lsp.mod.defaultLibrary"] = plt.holt_teal,
      ["@lsp.mod.documentation"] = plt.steel_grey,
    },
  }
end

return {
  name = "Injustice Mr. Terrific – Regime Enforcer",
  author = "PrismPunk.nvim",
  description = "Fair Play is obsolete. Order is mandatory. "
    .. "The third-smartest man alive now runs the neural network that keeps the world in line.",

  base16 = {
    base00 = palette.void_black,
    base01 = palette.regime_void,
    base02 = palette.control_core,
    base03 = palette.neural_glow,
    base04 = palette.steel_grey,
    base05 = palette.control_gold,
    base06 = palette.obedience_gold,
    base07 = palette.dictator_bright,
    base08 = palette.neural_red,
    base09 = palette.regime_gold,
    base0A = palette.holt_teal,
    base0B = palette.terrfic_teal,
    base0C = palette.nanite_cyan,
    base0D = palette.cold_logic,
    base0E = palette.control_pulse,
    base0F = palette.mind_lock,
  },

  palette = palette,
  get = M.get,
}