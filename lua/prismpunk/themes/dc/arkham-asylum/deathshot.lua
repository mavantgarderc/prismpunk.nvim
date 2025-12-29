local color = require("prismpunk.utils.color")
local palette = require("prismpunk.palettes.dc.arkham-asylum.deathshot")

local M = {}

M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.red_dot,
      insert = plt.contract_white,
      visual = plt.killshot_red,
      replace = plt.arterial_red,
      command = plt.gunmetal,
    },

    ui = {
      fg = plt.contract_white,
      fg_dim = plt.sterile_white,
      fg_dimmer = plt.target_paper,
      fg_dark = plt.cold_scope,
      fg_reverse = plt.void_black,

      bg_m4 = plt.killzone_glow,
      bg_m3 = plt.lawton_core,
      bg_m2 = plt.scope_night,
      bg_m1 = plt.void_black,
      bg_dim = plt.void_black,
      bg = plt.void_black,
      bg_p1 = plt.scope_night,
      bg_p2 = plt.lawton_core,
      bg_gutter = opts.gutter and plt.lawton_core or "none",
      bg_cursorline = plt.lawton_core,
      bg_cursorline_alt = plt.scope_night,
      bg_search = plt.barrel_steel,
      bg_visual = plt.killshot_red,
      bg_statusline = plt.lawton_core,

      border = plt.red_dot, -- Signature red dot for identity
      header1 = plt.red_dot,
      header2 = plt.gunmetal,
      special = plt.contract_red,
      nontext = plt.sterile_white, -- Better contrast
      whitespace = plt.cold_scope, -- Better contrast
      win_separator = plt.red_dot, -- Signature red dot for identity
      indent = plt.scope_night,
      indent_scope = plt.cold_scope,
      picker = plt.contract_white,
      yank = plt.arterial_red,
      mark = plt.killshot_red,
      scrollbar = plt.lawton_core,

      tabline = {
        bg = plt.void_black,
        fg_selected = plt.contract_white,
        bg_selected = plt.lawton_core,
        fg_inactive = plt.sterile_white, -- Better contrast
        bg_inactive = plt.void_black,
        fg_alternate = plt.red_dot,
        bg_alternate = plt.void_black,
        indicator = plt.barrel_steel,
      },

      pmenu = {
        fg = plt.contract_white,
        fg_sel = "none",
        fg_border = plt.lawton_core,
        bg_border = plt.lawton_core,
        bg = plt.lawton_core,
        bg_sel = plt.scope_night,
        bg_sbar = plt.lawton_core,
        bg_thumb = plt.red_dot, -- Signature red dot for identity
      },

      float = {
        fg = plt.contract_white,
        bg = plt.scope_night,
        fg_border = plt.red_dot, -- Signature red dot for identity
        bg_border = plt.scope_night,
      },
    },

    accent = {
      accent1 = plt.red_dot,
      accent2 = plt.gunmetal,
      accent3 = plt.tactical_gray,
      accent4 = plt.killshot_red,
      accent5 = plt.cold_scope,
      invert = plt.lawton_core,
    },

    rainbow = {
      rainbow1 = plt.red_dot,
      rainbow2 = plt.contract_red,
      rainbow3 = plt.killshot_red,
      rainbow4 = plt.gunmetal,
      rainbow5 = plt.barrel_steel,
      rainbow6 = plt.tactical_gray,
      rainbow7 = plt.cold_scope,
    },

    syn = {
      attribute = plt.contract_white,
      boolean = plt.killshot_red,
      comment = plt.sterile_white, -- Brighter for better contrast
      constant = plt.tactical_gray,
      deprecated = plt.killzone_glow,
      func = plt.red_dot,
      identifier = plt.contract_white,
      keyword = plt.red_dot,
      method = plt.gunmetal,
      number = plt.arterial_red,
      operator = plt.cold_scope,
      parameter = plt.contract_white, -- Brighter for better contrast
      preproc = plt.killshot_red,
      punct = plt.contract_white,
      regex = plt.barrel_steel,
      statement = plt.red_dot,
      string = plt.contract_white, -- Brighter for better contrast
      symbol = plt.contract_white,
      type = plt.gunmetal,
      variable = plt.contract_white,
      special = plt.contract_red,
      special2 = plt.cold_scope,
      special3 = plt.arterial_red,
    },

    vcs = { added = plt.cold_scope, removed = plt.killshot_red, changed = plt.tactical_gray },
    diff = { add = plt.cold_scope, change = plt.gunmetal, delete = plt.arterial_red, text = plt.red_dot },
    diag = {
      ok = plt.cold_scope,
      error = plt.arterial_red,
      warning = plt.killshot_red,
      info = plt.red_dot,
      hint = plt.tactical_gray,
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
      indexed1 = plt.red_dot,
      indexed2 = plt.gunmetal,
    },

    treesitter = {
      ["@comment"] = plt.target_paper,
      ["@comment.documentation"] = plt.sterile_white,
      ["@comment.error"] = plt.arterial_red,
      ["@comment.warning"] = plt.killshot_red,
      ["@comment.todo"] = plt.red_dot,
      ["@comment.note"] = plt.cold_scope,

      ["@constant"] = plt.tactical_gray,
      ["@constant.builtin"] = plt.tactical_gray,
      ["@constant.macro"] = plt.arterial_red,

      ["@string"] = plt.tactical_gray,
      ["@string.documentation"] = plt.tactical_gray,
      ["@string.regex"] = plt.barrel_steel,
      ["@string.escape"] = plt.gunmetal,
      ["@string.special"] = plt.killshot_red,
      ["@string.special.symbol"] = plt.contract_white,
      ["@string.special.url"] = plt.tactical_gray,
      ["@string.special.path"] = plt.tactical_gray,

      ["@character"] = plt.tactical_gray,
      ["@character.special"] = plt.gunmetal,

      ["@number"] = plt.arterial_red,
      ["@number.float"] = plt.arterial_red,

      ["@boolean"] = plt.killshot_red,

      ["@function"] = plt.red_dot,
      ["@function.builtin"] = plt.red_dot,
      ["@function.call"] = plt.red_dot,
      ["@function.macro"] = plt.gunmetal,
      ["@function.method"] = plt.gunmetal,
      ["@function.method.call"] = plt.gunmetal,

      ["@constructor"] = plt.contract_white,

      ["@parameter"] = plt.sterile_white,
      ["@parameter.builtin"] = plt.contract_white,

      ["@keyword"] = plt.red_dot,
      ["@keyword.coroutine"] = plt.killshot_red,
      ["@keyword.function"] = plt.red_dot,
      ["@keyword.operator"] = plt.cold_scope,
      ["@keyword.return"] = plt.red_dot,
      ["@keyword.import"] = plt.tactical_gray,
      ["@keyword.storage"] = plt.red_dot,
      ["@keyword.repeat"] = plt.red_dot,
      ["@keyword.conditional"] = plt.red_dot,
      ["@keyword.exception"] = plt.arterial_red,
      ["@keyword.directive"] = plt.killshot_red,
      ["@keyword.directive.define"] = plt.killshot_red,

      ["@conditional"] = plt.red_dot,
      ["@conditional.ternary"] = plt.red_dot,

      ["@repeat"] = plt.red_dot,

      ["@label"] = plt.tactical_gray,

      ["@operator"] = plt.cold_scope,

      ["@exception"] = plt.arterial_red,

      ["@variable"] = plt.contract_white,
      ["@variable.builtin"] = plt.tactical_gray,
      ["@variable.parameter"] = plt.sterile_white,
      ["@variable.member"] = plt.contract_white,

      ["@type"] = plt.gunmetal,
      ["@type.builtin"] = plt.gunmetal,
      ["@type.definition"] = plt.gunmetal,
      ["@type.qualifier"] = plt.red_dot,

      ["@attribute"] = plt.contract_white,
      ["@attribute.builtin"] = plt.tactical_gray,

      ["@property"] = plt.contract_white,
      ["@field"] = plt.contract_white,
      ["@module"] = plt.contract_white,
      ["@module.builtin"] = plt.contract_white,
      ["@namespace"] = plt.contract_white,
      ["@namespace.builtin"] = plt.contract_white,

      ["@punctuation.delimiter"] = plt.contract_white,
      ["@punctuation.bracket"] = plt.cold_scope,
      ["@punctuation.special"] = plt.barrel_steel,

      ["@tag"] = plt.red_dot,
      ["@tag.attribute"] = plt.tactical_gray,
      ["@tag.delimiter"] = plt.contract_white,
      ["@tag.builtin"] = plt.red_dot,

      ["@markup.strong"] = { fg = plt.red_dot, bold = true },
      ["@markup.italic"] = { fg = plt.contract_white, italic = true },
      ["@markup.strikethrough"] = { fg = plt.killzone_glow, strikethrough = true },
      ["@markup.underline"] = { fg = plt.killshot_red, underline = true },
      ["@markup.heading"] = plt.red_dot,
      ["@markup.heading.1"] = plt.red_dot,
      ["@markup.heading.2"] = plt.contract_red,
      ["@markup.heading.3"] = plt.killshot_red,
      ["@markup.heading.4"] = plt.gunmetal,
      ["@markup.heading.5"] = plt.tactical_gray,
      ["@markup.heading.6"] = plt.cold_scope,
      ["@markup.quote"] = plt.target_paper,
      ["@markup.math"] = plt.cold_scope,
      ["@markup.link"] = plt.tactical_gray,
      ["@markup.link.label"] = plt.sterile_white,
      ["@markup.link.url"] = plt.cold_scope,
      ["@markup.raw"] = plt.tactical_gray,
      ["@markup.raw.block"] = plt.tactical_gray,
      ["@markup.list"] = plt.red_dot,
      ["@markup.list.checked"] = plt.cold_scope,
      ["@markup.list.unchecked"] = plt.sterile_white,

      ["@diff.plus"] = plt.cold_scope,
      ["@diff.minus"] = plt.killshot_red,
      ["@diff.delta"] = plt.tactical_gray,

      ["@none"] = "none",
      ["@conceal"] = plt.tactical_gray,
      ["@spell"] = plt.contract_white,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.contract_white,
      ["@constructor.python"] = plt.red_dot,
      ["@constructor.javascript"] = plt.red_dot,
      ["@constructor.typescript"] = plt.red_dot,
      ["@namespace.rust"] = plt.contract_white,
      ["@type.qualifier.rust"] = plt.red_dot,
      ["@constant.macro.c"] = plt.arterial_red,
      ["@constant.macro.cpp"] = plt.arterial_red,
      ["@namespace.go"] = plt.contract_white,
      ["@property.css"] = plt.tactical_gray,
      ["@type.css"] = plt.red_dot,
      ["@label.json"] = plt.contract_white,
      ["@field.yaml"] = plt.sterile_white,
      ["@property.toml"] = plt.sterile_white,
      ["@function.builtin.bash"] = plt.gunmetal,
      ["@string.regexp"] = plt.barrel_steel,
      ["@character.special.regex"] = plt.cold_scope,
    },

    lsp = {
      ["@lsp.type.class"] = plt.gunmetal,
      ["@lsp.type.interface"] = plt.gunmetal,
      ["@lsp.type.struct"] = plt.gunmetal,
      ["@lsp.type.enum"] = plt.gunmetal,
      ["@lsp.type.enumMember"] = plt.tactical_gray,
      ["@lsp.type.property"] = plt.contract_white,
      ["@lsp.type.namespace"] = plt.contract_white,

      ["@lsp.type.macro"] = plt.arterial_red,
      ["@lsp.type.decorator"] = plt.red_dot,

      ["@lsp.type.builtinType"] = plt.gunmetal,
      ["@lsp.type.selfParameter"] = plt.red_dot,
      ["@lsp.type.typeParameter"] = plt.gunmetal,

      ["@lsp.type.array"] = plt.gunmetal,
      ["@lsp.type.object"] = plt.gunmetal,
      ["@lsp.type.key"] = plt.contract_white,
      ["@lsp.type.null"] = plt.tactical_gray,
      ["@lsp.type.enumConstant"] = plt.tactical_gray,

      ["@lsp.type.event"] = plt.gunmetal,
      ["@lsp.type.regexp"] = plt.barrel_steel,
      ["@lsp.type.unresolvedReference"] = plt.arterial_red,

      ["@lsp.mod.deprecated"] = { fg = plt.killzone_glow, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.tactical_gray,
      ["@lsp.mod.async"] = plt.red_dot,
      ["@lsp.mod.static"] = plt.gunmetal,
      ["@lsp.mod.abstract"] = plt.gunmetal,
      ["@lsp.mod.defaultLibrary"] = plt.gunmetal,
      ["@lsp.mod.documentation"] = plt.target_paper,
    },
  }
end

return {
  name = "Deathshot – Floyd Lawton",
  author = "PrismPunk.nvim",
  description = "One man. One rifle. One bullet. Zero mercy. "
    .. "Cold gunmetal, blood-red targeting laser, and the sterile white of a signed death warrant."
    .. "Floyd Lawton never misses.",

  base16 = {
    base00 = palette.void_black,
    base01 = palette.scope_night,
    base02 = palette.lawton_core,
    base03 = palette.killzone_glow,
    base04 = palette.cold_scope,
    base05 = palette.sterile_white,
    base06 = palette.contract_white,
    base07 = palette.contract_white,
    base08 = palette.killshot_red,
    base09 = palette.arterial_red,
    base0A = palette.tactical_gray,
    base0B = palette.cold_scope,
    base0C = palette.red_dot,
    base0D = palette.gunmetal,
    base0E = palette.contract_red,
    base0F = palette.barrel_steel,
  },

  palette = palette,
  get = M.get,
}
