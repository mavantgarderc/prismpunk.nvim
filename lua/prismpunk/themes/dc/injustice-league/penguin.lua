local color = require("prismpunk.utils.color")
local palette = require("prismpunk.palettes.dc.injustice-league.penguin")

local M = {}

M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.cobblepot_gold,
      insert = plt.ember_orange,
      visual = plt.cobblepot_purple,
      replace = plt.blood_money,
      command = plt.iceberg_teal,
    },

    ui = {
      fg = plt.monocle_gold,
      fg_dim = plt.dirty_gold,
      fg_dimmer = plt.cobblepot_gold,
      fg_dark = plt.umbrella_shadow,
      fg_reverse = plt.void_black,

      bg_m4 = plt.cigarette_glow,
      bg_m3 = plt.cobblepot_core,
      bg_m2 = plt.lounge_void,
      bg_m1 = plt.void_black,
      bg_dim = plt.void_black,
      bg = plt.void_black,
      bg_p1 = plt.lounge_void,
      bg_p2 = plt.cobblepot_core,
      bg_gutter = opts.gutter and plt.cobblepot_core or "none",
      bg_cursorline = plt.cobblepot_core,
      bg_cursorline_alt = plt.lounge_void,
      bg_search = plt.cigar_fire,
      bg_visual = plt.regime_orange,
      bg_statusline = plt.cobblepot_core,

      border = plt.cobblepot_gold, -- Signature gold for identity
      header1 = plt.cobblepot_gold,
      header2 = plt.ember_orange,
      special = plt.cobblepot_purple,
      nontext = plt.dirty_gold, -- Better contrast
      whitespace = plt.monocle_glass, -- Better contrast
      win_separator = plt.cobblepot_gold, -- Signature gold for identity
      indent = plt.lounge_void,
      indent_scope = plt.monocle_glass,
      picker = plt.monocle_gold,
      yank = plt.blood_money,
      mark = plt.ember_orange,
      scrollbar = plt.cobblepot_core,

      tabline = {
        bg = plt.void_black,
        fg_selected = plt.monocle_gold,
        bg_selected = plt.cobblepot_core,
        fg_inactive = plt.dirty_gold, -- Better contrast
        bg_inactive = plt.void_black,
        fg_alternate = plt.cobblepot_gold,
        bg_alternate = plt.void_black,
        indicator = plt.ember_orange,
      },

      pmenu = {
        fg = plt.monocle_gold,
        fg_sel = "none",
        fg_border = plt.cobblepot_core,
        bg_border = plt.cobblepot_core,
        bg = plt.cobblepot_core,
        bg_sel = plt.lounge_void,
        bg_sbar = plt.cobblepot_core,
        bg_thumb = plt.cobblepot_gold, -- Signature gold for identity
      },

      float = {
        fg = plt.monocle_gold,
        bg = plt.lounge_void,
        fg_border = plt.cobblepot_gold, -- Signature gold for identity
        bg_border = plt.lounge_void,
      },
    },

    accent = {
      accent1 = plt.cobblepot_gold,
      accent2 = plt.ember_orange,
      accent3 = plt.cobblepot_purple,
      accent4 = plt.iceberg_teal,
      accent5 = plt.blood_money,
      invert = plt.cobblepot_core,
    },

    rainbow = {
      rainbow1 = plt.cobblepot_gold,
      rainbow2 = plt.dirty_gold,
      rainbow3 = plt.monocle_gold,
      rainbow4 = plt.cobblepot_purple,
      rainbow5 = plt.imperial_violet,
      rainbow6 = plt.ember_orange,
      rainbow7 = plt.blood_money,
    },

    syn = {
      attribute = plt.monocle_gold,
      boolean = plt.ember_orange,
      comment = plt.dirty_gold, -- Brighter for better contrast
      constant = plt.dirty_gold,
      deprecated = plt.cigarette_glow,
      func = plt.cobblepot_gold,
      identifier = plt.monocle_gold,
      keyword = plt.cobblepot_gold,
      method = plt.cobblepot_purple,
      number = plt.cigar_fire,
      operator = plt.iceberg_teal,
      parameter = plt.dirty_gold, -- Brighter for better contrast
      preproc = plt.blood_money,
      punct = plt.dirty_gold,
      regex = plt.frozen_cash,
      statement = plt.cobblepot_gold,
      string = plt.arctic_money, -- Brighter for better contrast
      symbol = plt.monocle_gold,
      type = plt.cobblepot_purple,
      variable = plt.monocle_gold,
      special = plt.regime_orange,
      special2 = plt.iceberg_teal,
      special3 = plt.ember_orange,
    },

    vcs = { added = plt.arctic_money, removed = plt.blood_money, changed = plt.cobblepot_purple },
    diff = { add = plt.arctic_money, change = plt.iceberg_teal, delete = plt.ember_orange, text = plt.cigar_fire },
    diag = {
      ok = plt.arctic_money,
      error = plt.ember_orange,
      warning = plt.cobblepot_gold,
      info = plt.cobblepot_purple,
      hint = plt.dirty_teal,
    },

    term = {
      black = plt.void_black,
      red = plt.term_red,
      green = plt.term_green,
      yellow = plt.term_gold,
      blue = plt.term_blue,
      magenta = plt.term_purple,
      cyan = plt.term_cyan,
      white = plt.monocle_gold,

      black_bright = color(plt.void_black):brighten(0.9):to_hex(),
      red_bright = plt.term_red_bright,
      green_bright = plt.term_green_bright,
      yellow_bright = plt.term_gold_bright,
      blue_bright = plt.term_blue_bright,
      magenta_bright = plt.term_purple_bright,
      cyan_bright = plt.term_cyan_bright,
      white_bright = "#ffffff",
      indexed1 = plt.cobblepot_gold,
      indexed2 = plt.ember_orange,
    },

    treesitter = {
      ["@comment"] = plt.monocle_glass,
      ["@comment.documentation"] = plt.dirty_gold,
      ["@comment.error"] = plt.ember_orange,
      ["@comment.warning"] = plt.cigar_fire,
      ["@comment.todo"] = plt.cobblepot_gold,
      ["@comment.note"] = plt.iceberg_teal,

      ["@constant"] = plt.dirty_gold,
      ["@constant.builtin"] = plt.dirty_gold,
      ["@constant.macro"] = plt.cigar_fire,

      ["@string"] = plt.arctic_money,
      ["@string.documentation"] = plt.arctic_money,
      ["@string.regex"] = plt.frozen_cash,
      ["@string.escape"] = plt.iceberg_teal,
      ["@string.special"] = plt.blood_money,
      ["@string.special.symbol"] = plt.monocle_gold,
      ["@string.special.url"] = plt.cobblepot_purple,
      ["@string.special.path"] = plt.arctic_money,

      ["@character"] = plt.arctic_money,
      ["@character.special"] = plt.iceberg_teal,

      ["@number"] = plt.cigar_fire,
      ["@number.float"] = plt.cigar_fire,

      ["@boolean"] = plt.blood_money,

      ["@function"] = plt.cobblepot_gold,
      ["@function.builtin"] = plt.cobblepot_gold,
      ["@function.call"] = plt.cobblepot_gold,
      ["@function.macro"] = plt.cobblepot_purple,
      ["@function.method"] = plt.cobblepot_purple,
      ["@function.method.call"] = plt.cobblepot_purple,

      ["@constructor"] = plt.monocle_gold,

      ["@parameter"] = plt.monocle_glass,
      ["@parameter.builtin"] = plt.monocle_gold,

      ["@keyword"] = plt.cobblepot_gold,
      ["@keyword.coroutine"] = plt.blood_money,
      ["@keyword.function"] = plt.cobblepot_gold,
      ["@keyword.operator"] = plt.iceberg_teal,
      ["@keyword.return"] = plt.cobblepot_gold,
      ["@keyword.import"] = plt.arctic_money,
      ["@keyword.storage"] = plt.cobblepot_gold,
      ["@keyword.repeat"] = plt.cobblepot_gold,
      ["@keyword.conditional"] = plt.cobblepot_gold,
      ["@keyword.exception"] = plt.regime_orange,
      ["@keyword.directive"] = plt.blood_money,
      ["@keyword.directive.define"] = plt.blood_money,

      ["@conditional"] = plt.cobblepot_gold,
      ["@conditional.ternary"] = plt.cobblepot_gold,

      ["@repeat"] = plt.cobblepot_gold,

      ["@label"] = plt.cobblepot_purple,

      ["@operator"] = plt.iceberg_teal,

      ["@exception"] = plt.regime_orange,

      ["@variable"] = plt.monocle_gold,
      ["@variable.builtin"] = plt.dirty_gold,
      ["@variable.parameter"] = plt.monocle_glass,
      ["@variable.member"] = plt.monocle_gold,

      ["@type"] = plt.cobblepot_purple,
      ["@type.builtin"] = plt.cobblepot_purple,
      ["@type.definition"] = plt.cobblepot_purple,
      ["@type.qualifier"] = plt.cobblepot_gold,

      ["@attribute"] = plt.monocle_gold,
      ["@attribute.builtin"] = plt.cobblepot_purple,

      ["@property"] = plt.monocle_gold,
      ["@field"] = plt.monocle_gold,
      ["@module"] = plt.monocle_gold,
      ["@module.builtin"] = plt.monocle_gold,
      ["@namespace"] = plt.monocle_gold,
      ["@namespace.builtin"] = plt.monocle_gold,

      ["@punctuation.delimiter"] = plt.dirty_gold,
      ["@punctuation.bracket"] = plt.monocle_glass,
      ["@punctuation.special"] = plt.iceberg_teal,

      ["@tag"] = plt.cobblepot_gold,
      ["@tag.attribute"] = plt.cobblepot_purple,
      ["@tag.delimiter"] = plt.dirty_gold,
      ["@tag.builtin"] = plt.cobblepot_gold,

      ["@markup.strong"] = { fg = plt.cobblepot_gold, bold = true },
      ["@markup.italic"] = { fg = plt.monocle_gold, italic = true },
      ["@markup.strikethrough"] = { fg = plt.cigarette_glow, strikethrough = true },
      ["@markup.underline"] = { fg = plt.ember_orange, underline = true },
      ["@markup.heading"] = plt.cobblepot_gold,
      ["@markup.heading.1"] = plt.cobblepot_gold,
      ["@markup.heading.2"] = plt.dirty_gold,
      ["@markup.heading.3"] = plt.monocle_gold,
      ["@markup.heading.4"] = plt.cobblepot_purple,
      ["@markup.heading.5"] = plt.iceberg_teal,
      ["@markup.heading.6"] = plt.ember_orange,
      ["@markup.quote"] = plt.monocle_glass,
      ["@markup.math"] = plt.frozen_cash,
      ["@markup.link"] = plt.arctic_money,
      ["@markup.link.label"] = plt.cigar_fire,
      ["@markup.link.url"] = plt.cobblepot_purple,
      ["@markup.raw"] = plt.arctic_money,
      ["@markup.raw.block"] = plt.arctic_money,
      ["@markup.list"] = plt.cobblepot_gold,
      ["@markup.list.checked"] = plt.arctic_money,
      ["@markup.list.unchecked"] = plt.monocle_glass,

      ["@diff.plus"] = plt.arctic_money,
      ["@diff.minus"] = plt.blood_money,
      ["@diff.delta"] = plt.cobblepot_purple,

      ["@none"] = "none",
      ["@conceal"] = plt.dirty_gold,
      ["@spell"] = plt.monocle_gold,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.monocle_gold,
      ["@constructor.python"] = plt.cobblepot_gold,
      ["@constructor.javascript"] = plt.cobblepot_gold,
      ["@constructor.typescript"] = plt.cobblepot_gold,
      ["@namespace.rust"] = plt.monocle_gold,
      ["@type.qualifier.rust"] = plt.cobblepot_gold,
      ["@constant.macro.c"] = plt.cigar_fire,
      ["@constant.macro.cpp"] = plt.cigar_fire,
      ["@namespace.go"] = plt.monocle_gold,
      ["@property.css"] = plt.cobblepot_purple,
      ["@type.css"] = plt.cobblepot_gold,
      ["@label.json"] = plt.monocle_gold,
      ["@field.yaml"] = plt.monocle_glass,
      ["@property.toml"] = plt.monocle_glass,
      ["@function.builtin.bash"] = plt.cobblepot_purple,
      ["@string.regexp"] = plt.frozen_cash,
      ["@character.special.regex"] = plt.iceberg_teal,
    },

    lsp = {
      ["@lsp.type.class"] = plt.cobblepot_purple,
      ["@lsp.type.interface"] = plt.cobblepot_purple,
      ["@lsp.type.struct"] = plt.cobblepot_purple,
      ["@lsp.type.enum"] = plt.cobblepot_purple,
      ["@lsp.type.enumMember"] = plt.dirty_gold,
      ["@lsp.type.property"] = plt.monocle_gold,
      ["@lsp.type.namespace"] = plt.monocle_gold,

      ["@lsp.type.macro"] = plt.cigar_fire,
      ["@lsp.type.decorator"] = plt.cobblepot_gold,

      ["@lsp.type.builtinType"] = plt.cobblepot_purple,
      ["@lsp.type.selfParameter"] = plt.cobblepot_gold,
      ["@lsp.type.typeParameter"] = plt.cobblepot_purple,

      ["@lsp.type.array"] = plt.cobblepot_purple,
      ["@lsp.type.object"] = plt.cobblepot_purple,
      ["@lsp.type.key"] = plt.monocle_gold,
      ["@lsp.type.null"] = plt.dirty_gold,
      ["@lsp.type.enumConstant"] = plt.dirty_gold,

      ["@lsp.type.event"] = plt.cobblepot_purple,
      ["@lsp.type.regexp"] = plt.frozen_cash,
      ["@lsp.type.unresolvedReference"] = plt.ember_orange,

      ["@lsp.mod.deprecated"] = { fg = plt.cigarette_glow, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.dirty_gold,
      ["@lsp.mod.async"] = plt.cobblepot_gold,
      ["@lsp.mod.static"] = plt.cobblepot_purple,
      ["@lsp.mod.abstract"] = plt.cobblepot_purple,
      ["@lsp.mod.defaultLibrary"] = plt.cobblepot_purple,
      ["@lsp.mod.documentation"] = plt.monocle_glass,
    },
  }
end

return {
  name = "Injustice Penguin – Emperor of Crime",
  author = "PrismPunk.nvim",
  description = "In the One Earth Regime, the Penguin doesn’t waddle. He rules. "
    .. "Gold monocle. Purple waistcoat. A cigar in one hand, the city in the other.",

  base16 = {
    base00 = palette.void_black,
    base01 = palette.lounge_void,
    base02 = palette.cobblepot_core,
    base03 = palette.cigarette_glow,
    base04 = palette.monocle_glass,
    base05 = palette.dirty_gold,
    base06 = palette.monocle_gold,
    base07 = palette.emperor_bright,
    base08 = palette.ember_orange,
    base09 = palette.cigar_fire,
    base0A = palette.cobblepot_gold,
    base0B = palette.iceberg_teal,
    base0C = palette.arctic_money,
    base0D = palette.cobblepot_purple,
    base0E = palette.imperial_violet,
    base0F = palette.blood_money,
  },

  palette = palette,
  get = M.get,
}
