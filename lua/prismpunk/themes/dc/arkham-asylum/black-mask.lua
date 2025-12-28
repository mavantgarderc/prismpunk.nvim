local color = require("prismpunk.utils.color")
local palette = require("prismpunk.palettes.dc.arkham-asylum.black-mask")

local M = {}

M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.torture_red,
      insert = plt.fear_white,
      visual = plt.switchblade_red,
      replace = plt.empire_red,
      command = plt.mafia_suit,
    },

    ui = {
      fg = plt.fear_white,
      fg_dim = plt.bone_white,
      fg_dimmer = plt.sionis_silver,
      fg_dark = plt.cold_concrete,
      fg_reverse = plt.void_black,

      bg_m4 = plt.underworld_glow,
      bg_m3 = plt.sionis_core,
      bg_m2 = plt.gotham_night,
      bg_m1 = plt.void_black,
      bg_dim = plt.void_black,
      bg = plt.void_black,
      bg_p1 = plt.gotham_night,
      bg_p2 = plt.sionis_core,
      bg_gutter = opts.gutter and plt.sionis_core or "none",
      bg_cursorline = plt.sionis_core,
      bg_cursorline_alt = plt.gotham_night,
      bg_search = plt.polished_steel,
      bg_visual = plt.switchblade_red,
      bg_statusline = plt.sionis_core,

      border = plt.torture_red, -- Signature red for identity
      header1 = plt.torture_red,
      header2 = plt.empire_red,
      special = plt.blood_mask,
      nontext = plt.bone_white, -- Better contrast
      whitespace = plt.cold_concrete, -- Better contrast
      win_separator = plt.torture_red, -- Signature red for identity
      indent = plt.gotham_night,
      indent_scope = plt.cold_concrete,
      picker = plt.fear_white,
      yank = plt.empire_red,
      mark = plt.switchblade_red,
      scrollbar = plt.sionis_core,

      tabline = {
        bg = plt.void_black,
        fg_selected = plt.fear_white,
        bg_selected = plt.sionis_core,
        fg_inactive = plt.bone_white, -- Better contrast
        bg_inactive = plt.void_black,
        fg_alternate = plt.torture_red,
        bg_alternate = plt.void_black,
        indicator = plt.polished_steel,
      },

      pmenu = {
        fg = plt.fear_white,
        fg_sel = "none",
        fg_border = plt.sionis_core,
        bg_border = plt.sionis_core,
        bg = plt.sionis_core,
        bg_sel = plt.gotham_night,
        bg_sbar = plt.sionis_core,
        bg_thumb = plt.torture_red, -- Signature red for identity
      },

      float = {
        fg = plt.fear_white,
        bg = plt.gotham_night,
        fg_border = plt.torture_red, -- Signature red for identity
        bg_border = plt.gotham_night,
      },
    },

    accent = {
      accent1 = plt.torture_red,
      accent2 = plt.mafia_suit,
      accent3 = plt.polished_steel,
      accent4 = plt.switchblade_red,
      accent5 = plt.cold_concrete,
      invert = plt.sionis_core,
    },

    rainbow = {
      rainbow1 = plt.torture_red,
      rainbow2 = plt.switchblade_red,
      rainbow3 = plt.empire_red,
      rainbow4 = plt.mafia_suit,
      rainbow5 = plt.cold_concrete,
      rainbow6 = plt.polished_steel,
      rainbow7 = plt.sionis_silver,
    },

    syn = {
      attribute = plt.fear_white,
      boolean = plt.switchblade_red,
      comment = plt.bone_white, -- Brighter for better contrast
      constant = plt.polished_steel,
      deprecated = plt.underworld_glow,
      func = plt.torture_red,
      identifier = plt.fear_white,
      keyword = plt.torture_red,
      method = plt.mafia_suit,
      number = plt.empire_red,
      operator = plt.cold_concrete,
      parameter = plt.fear_white, -- Brighter for better contrast
      preproc = plt.switchblade_red,
      punct = plt.fear_white,
      regex = plt.polished_steel,
      statement = plt.torture_red,
      string = plt.fear_white, -- Brighter for better contrast
      symbol = plt.fear_white,
      type = plt.mafia_suit,
      variable = plt.fear_white,
      special = plt.blood_mask,
      special2 = plt.cold_concrete,
      special3 = plt.empire_red,
    },

    vcs = { added = plt.cold_concrete, removed = plt.switchblade_red, changed = plt.polished_steel },
    diff = { add = plt.cold_concrete, change = plt.mafia_suit, delete = plt.empire_red, text = plt.torture_red },
    diag = {
      ok = plt.cold_concrete,
      error = plt.empire_red,
      warning = plt.switchblade_red,
      info = plt.torture_red,
      hint = plt.polished_steel,
    },

    term = {
      black = plt.void_black,
      red = plt.term_red,
      green = plt.term_gray,
      yellow = plt.term_gray,
      blue = plt.term_gray,
      magenta = plt.term_red,
      cyan = plt.term_white,
      white = plt.term_white,

      black_bright = color(plt.void_black):brighten(0.9):to_hex(),
      red_bright = plt.term_red_bright,
      green_bright = plt.term_gray_bright,
      yellow_bright = plt.term_gray_bright,
      blue_bright = plt.term_gray_bright,
      magenta_bright = plt.term_red_bright,
      cyan_bright = plt.term_white,
      white_bright = "#ffffff",
      indexed1 = plt.torture_red,
      indexed2 = plt.mafia_suit,
    },

    treesitter = {
      ["@comment"] = plt.sionis_silver,
      ["@comment.documentation"] = plt.bone_white,
      ["@comment.error"] = plt.empire_red,
      ["@comment.warning"] = plt.switchblade_red,
      ["@comment.todo"] = plt.torture_red,
      ["@comment.note"] = plt.cold_concrete,

      ["@constant"] = plt.polished_steel,
      ["@constant.builtin"] = plt.polished_steel,
      ["@constant.macro"] = plt.empire_red,

      ["@string"] = plt.sionis_silver,
      ["@string.documentation"] = plt.sionis_silver,
      ["@string.regex"] = plt.cold_concrete,
      ["@string.escape"] = plt.mafia_suit,
      ["@string.special"] = plt.switchblade_red,
      ["@string.special.symbol"] = plt.fear_white,
      ["@string.special.url"] = plt.mafia_suit,
      ["@string.special.path"] = plt.sionis_silver,

      ["@character"] = plt.sionis_silver,
      ["@character.special"] = plt.mafia_suit,

      ["@number"] = plt.empire_red,
      ["@number.float"] = plt.empire_red,

      ["@boolean"] = plt.switchblade_red,

      ["@function"] = plt.torture_red,
      ["@function.builtin"] = plt.torture_red,
      ["@function.call"] = plt.torture_red,
      ["@function.macro"] = plt.mafia_suit,
      ["@function.method"] = plt.mafia_suit,
      ["@function.method.call"] = plt.mafia_suit,

      ["@constructor"] = plt.fear_white,

      ["@parameter"] = plt.bone_white,
      ["@parameter.builtin"] = plt.fear_white,

      ["@keyword"] = plt.torture_red,
      ["@keyword.coroutine"] = plt.switchblade_red,
      ["@keyword.function"] = plt.torture_red,
      ["@keyword.operator"] = plt.cold_concrete,
      ["@keyword.return"] = plt.torture_red,
      ["@keyword.import"] = plt.polished_steel,
      ["@keyword.storage"] = plt.torture_red,
      ["@keyword.repeat"] = plt.torture_red,
      ["@keyword.conditional"] = plt.torture_red,
      ["@keyword.exception"] = plt.empire_red,
      ["@keyword.directive"] = plt.switchblade_red,
      ["@keyword.directive.define"] = plt.switchblade_red,

      ["@conditional"] = plt.torture_red,
      ["@conditional.ternary"] = plt.torture_red,

      ["@repeat"] = plt.torture_red,

      ["@label"] = plt.mafia_suit,

      ["@operator"] = plt.cold_concrete,

      ["@exception"] = plt.empire_red,

      ["@variable"] = plt.fear_white,
      ["@variable.builtin"] = plt.polished_steel,
      ["@variable.parameter"] = plt.bone_white,
      ["@variable.member"] = plt.fear_white,

      ["@type"] = plt.mafia_suit,
      ["@type.builtin"] = plt.mafia_suit,
      ["@type.definition"] = plt.mafia_suit,
      ["@type.qualifier"] = plt.torture_red,

      ["@attribute"] = plt.fear_white,
      ["@attribute.builtin"] = plt.mafia_suit,

      ["@property"] = plt.fear_white,
      ["@field"] = plt.fear_white,
      ["@module"] = plt.fear_white,
      ["@module.builtin"] = plt.fear_white,
      ["@namespace"] = plt.fear_white,
      ["@namespace.builtin"] = plt.fear_white,

      ["@punctuation.delimiter"] = plt.fear_white,
      ["@punctuation.bracket"] = plt.cold_concrete,
      ["@punctuation.special"] = plt.polished_steel,

      ["@tag"] = plt.torture_red,
      ["@tag.attribute"] = plt.mafia_suit,
      ["@tag.delimiter"] = plt.fear_white,
      ["@tag.builtin"] = plt.torture_red,

      ["@markup.strong"] = { fg = plt.torture_red, bold = true },
      ["@markup.italic"] = { fg = plt.fear_white, italic = true },
      ["@markup.strikethrough"] = { fg = plt.underworld_glow, strikethrough = true },
      ["@markup.underline"] = { fg = plt.switchblade_red, underline = true },
      ["@markup.heading"] = plt.torture_red,
      ["@markup.heading.1"] = plt.torture_red,
      ["@markup.heading.2"] = plt.switchblade_red,
      ["@markup.heading.3"] = plt.empire_red,
      ["@markup.heading.4"] = plt.mafia_suit,
      ["@markup.heading.5"] = plt.polished_steel,
      ["@markup.heading.6"] = plt.cold_concrete,
      ["@markup.quote"] = plt.sionis_silver,
      ["@markup.math"] = plt.cold_concrete,
      ["@markup.link"] = plt.polished_steel,
      ["@markup.link.label"] = plt.sionis_silver,
      ["@markup.link.url"] = plt.cold_concrete,
      ["@markup.raw"] = plt.sionis_silver,
      ["@markup.raw.block"] = plt.sionis_silver,
      ["@markup.list"] = plt.torture_red,
      ["@markup.list.checked"] = plt.cold_concrete,
      ["@markup.list.unchecked"] = plt.bone_white,

      ["@diff.plus"] = plt.cold_concrete,
      ["@diff.minus"] = plt.switchblade_red,
      ["@diff.delta"] = plt.polished_steel,

      ["@none"] = "none",
      ["@conceal"] = plt.polished_steel,
      ["@spell"] = plt.fear_white,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fear_white,
      ["@constructor.python"] = plt.torture_red,
      ["@constructor.javascript"] = plt.torture_red,
      ["@constructor.typescript"] = plt.torture_red,
      ["@namespace.rust"] = plt.fear_white,
      ["@type.qualifier.rust"] = plt.torture_red,
      ["@constant.macro.c"] = plt.empire_red,
      ["@constant.macro.cpp"] = plt.empire_red,
      ["@namespace.go"] = plt.fear_white,
      ["@property.css"] = plt.mafia_suit,
      ["@type.css"] = plt.torture_red,
      ["@label.json"] = plt.fear_white,
      ["@field.yaml"] = plt.bone_white,
      ["@property.toml"] = plt.bone_white,
      ["@function.builtin.bash"] = plt.mafia_suit,
      ["@string.regexp"] = plt.cold_concrete,
      ["@character.special.regex"] = plt.mafia_suit,
    },

    lsp = {
      ["@lsp.type.class"] = plt.mafia_suit,
      ["@lsp.type.interface"] = plt.mafia_suit,
      ["@lsp.type.struct"] = plt.mafia_suit,
      ["@lsp.type.enum"] = plt.mafia_suit,
      ["@lsp.type.enumMember"] = plt.polished_steel,
      ["@lsp.type.property"] = plt.fear_white,
      ["@lsp.type.namespace"] = plt.fear_white,

      ["@lsp.type.macro"] = plt.empire_red,
      ["@lsp.type.decorator"] = plt.torture_red,

      ["@lsp.type.builtinType"] = plt.mafia_suit,
      ["@lsp.type.selfParameter"] = plt.torture_red,
      ["@lsp.type.typeParameter"] = plt.mafia_suit,

      ["@lsp.type.array"] = plt.mafia_suit,
      ["@lsp.type.object"] = plt.mafia_suit,
      ["@lsp.type.key"] = plt.fear_white,
      ["@lsp.type.null"] = plt.polished_steel,
      ["@lsp.type.enumConstant"] = plt.polished_steel,

      ["@lsp.type.event"] = plt.mafia_suit,
      ["@lsp.type.regexp"] = plt.cold_concrete,
      ["@lsp.type.unresolvedReference"] = plt.empire_red,

      ["@lsp.mod.deprecated"] = { fg = plt.underworld_glow, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.polished_steel,
      ["@lsp.mod.async"] = plt.torture_red,
      ["@lsp.mod.static"] = plt.mafia_suit,
      ["@lsp.mod.abstract"] = plt.mafia_suit,
      ["@lsp.mod.defaultLibrary"] = plt.mafia_suit,
      ["@lsp.mod.documentation"] = plt.sionis_silver,
    },
  }
end

return {
  name = "Black Mask – Roman Sionis",
  author = "PrismPunk.nvim",
  description = "A carved obsidian mask and a heart full of sadistic rage."
    .. "Blood-red torture, cold mafia grays, and the glint of a switchblade in Gotham's underworld."
    .. "Roman Sionis doesn't just kill—he makes you beg first.",

  base16 = {
    base00 = palette.void_black,
    base01 = palette.gotham_night,
    base02 = palette.sionis_core,
    base03 = palette.underworld_glow,
    base04 = palette.cold_concrete,
    base05 = palette.bone_white,
    base06 = palette.fear_white,
    base07 = palette.fear_white,
    base08 = palette.switchblade_red,
    base09 = palette.empire_red,
    base0A = palette.polished_steel,
    base0B = palette.sionis_silver,
    base0C = palette.torture_red,
    base0D = palette.mafia_suit,
    base0E = palette.blood_mask,
    base0F = palette.obsidian_black,
  },

  palette = palette,
  get = M.get,
}