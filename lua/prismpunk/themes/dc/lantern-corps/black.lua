local color = require("prismpunk.utils.color")
local palette = require("prismpunk.palettes.dc.lantern-corps.black")

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.voidCore,
      insert = plt.necroticWill,
      visual = plt.voidBright,
      replace = plt.necroticRage,
      command = plt.necroticFear,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_dark,
      fg_dark = plt.bg_lightest,
      fg_reverse = plt.bg_alt1,
      bg_m4 = plt.bg_alt2,
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
      bg_search = plt.voidDeep,
      bg_visual = plt.bg_light,
      bg_statusline = plt.bg_light,
      border = plt.necroticRage, -- Signature rage red for contrast
      header1 = plt.voidCore,
      header2 = plt.voidBright,
      special = plt.necroticCompassion,
      nontext = plt.fg_dark, -- Better contrast
      whitespace = plt.bg_lightest,
      win_separator = plt.necroticRage, -- Signature rage red for contrast
      indent = plt.bg_lighter,
      indent_scope = plt.voidCore,
      picker = plt.necroticRage,
      yank = plt.voidBright,
      mark = plt.necroticCompassion,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_light, -- Better contrast
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.necroticLove,
        bg_alternate = plt.bg_darkest,
        indicator = plt.voidCore,
      },
      pmenu = {
        fg = plt.fg_lightest,
        fg_sel = "none",
        fg_border = plt.bg_lighter,
        bg_border = plt.bg_light,
        bg = plt.bg_light,
        bg_sel = plt.bg_lighter,
        bg_sbar = plt.bg_light,
        bg_thumb = plt.necroticRage, -- Signature rage red for contrast
      },
      float = {
        fg = plt.fg_light,
        bg = plt.bg_mid,
        fg_border = plt.necroticRage, -- Signature rage red for contrast
        bg_border = plt.bg_mid,
      },
    },

    accent = {
      accent1 = plt.voidCore,
      accent2 = plt.voidBright,
      accent3 = plt.necroticCompassion,
      accent4 = plt.zombieGray,
      accent5 = plt.necroticRage,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.necroticRage,
      rainbow2 = plt.necroticLove,
      rainbow3 = plt.necroticFear,
      rainbow4 = plt.necroticAvarice,
      rainbow5 = plt.necroticWill,
      rainbow6 = plt.necroticHope,
      rainbow7 = plt.necroticCompassion,
    },

    syn = {
      attribute = plt.necroticFear,
      boolean = plt.necroticCompassion,
      comment = plt.fg_light, -- Brighter for better contrast
      constant = plt.necroticAvarice,
      deprecated = plt.fg_mid,
      func = plt.necroticHope,
      identifier = plt.fg_lightest,
      keyword = plt.voidCore,
      method = plt.necroticHope,
      number = plt.necroticLove,
      operator = plt.necroticRage,
      parameter = plt.fg_light, -- Brighter for better contrast
      preproc = plt.voidBright,
      punct = plt.fg_light, -- Brighter for better contrast
      regex = plt.necroticFear,
      statement = plt.voidCore,
      string = plt.necroticWill,
      symbol = plt.necroticRage,
      type = plt.necroticCompassion,
      variable = plt.fg_lightest,
      special = plt.necroticFear,
      special2 = plt.necroticRage,
      special3 = plt.voidDeep,
    },

    vcs = {
      added = plt.necroticWill,
      removed = plt.necroticRage,
      changed = plt.necroticFear,
    },

    diff = {
      add = plt.necroticWill,
      change = plt.necroticFear,
      delete = plt.necroticRage,
      text = plt.necroticHope,
    },

    diag = {
      ok = plt.necroticWill,
      error = plt.necroticRage,
      warning = plt.necroticFear,
      info = plt.necroticHope,
      hint = plt.necroticCompassion,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.necroticRage,
      green = plt.necroticWill,
      yellow = plt.necroticFear,
      blue = plt.necroticHope,
      magenta = plt.necroticLove,
      cyan = plt.necroticCompassion,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.necroticRage):brighten(0.2):to_hex(),
      green_bright = color(plt.necroticWill):brighten(0.1):to_hex(),
      yellow_bright = color(plt.necroticFear):brighten(0.2):to_hex(),
      blue_bright = color(plt.necroticHope):brighten(0.3):to_hex(),
      magenta_bright = color(plt.necroticLove):brighten(0.2):to_hex(),
      cyan_bright = color(plt.necroticCompassion):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.necroticAvarice,
      indexed2 = plt.necroticRage,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.necroticRage,
      ["@comment.warning"] = plt.necroticFear,
      ["@comment.todo"] = plt.necroticHope,
      ["@comment.note"] = plt.necroticCompassion,

      ["@constant"] = plt.necroticAvarice,
      ["@constant.builtin"] = plt.necroticAvarice,
      ["@constant.macro"] = plt.necroticFear,

      ["@string"] = plt.necroticWill,
      ["@string.documentation"] = plt.necroticWill,
      ["@string.regex"] = plt.necroticFear,
      ["@string.escape"] = plt.necroticLove,
      ["@string.special"] = plt.necroticCompassion,
      ["@string.special.symbol"] = plt.necroticRage,
      ["@string.special.url"] = plt.necroticHope,
      ["@string.special.path"] = plt.necroticCompassion,

      ["@character"] = plt.necroticWill,
      ["@character.special"] = plt.necroticLove,

      ["@number"] = plt.necroticLove,
      ["@number.float"] = plt.necroticLove,

      ["@boolean"] = plt.necroticCompassion,

      ["@function"] = plt.necroticHope,
      ["@function.builtin"] = plt.necroticHope,
      ["@function.call"] = plt.necroticHope,
      ["@function.macro"] = plt.voidBright,
      ["@function.method"] = plt.necroticHope,
      ["@function.method.call"] = plt.necroticHope,

      ["@constructor"] = plt.necroticCompassion,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.voidCore,
      ["@keyword.coroutine"] = plt.voidBright,
      ["@keyword.function"] = plt.voidCore,
      ["@keyword.operator"] = plt.necroticRage,
      ["@keyword.return"] = plt.voidCore,
      ["@keyword.import"] = plt.voidBright,
      ["@keyword.storage"] = plt.voidCore,
      ["@keyword.repeat"] = plt.voidCore,
      ["@keyword.conditional"] = plt.voidCore,
      ["@keyword.exception"] = plt.necroticRage,
      ["@keyword.directive"] = plt.voidBright,
      ["@keyword.directive.define"] = plt.voidBright,

      ["@conditional"] = plt.voidCore,
      ["@conditional.ternary"] = plt.voidCore,

      ["@repeat"] = plt.voidCore,

      ["@label"] = plt.voidBright,

      ["@operator"] = plt.necroticRage,

      ["@exception"] = plt.necroticRage,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.voidBright,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.necroticCompassion,
      ["@type.builtin"] = plt.necroticCompassion,
      ["@type.definition"] = plt.necroticCompassion,
      ["@type.qualifier"] = plt.voidCore,

      ["@attribute"] = plt.necroticFear,
      ["@attribute.builtin"] = plt.necroticFear,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.necroticCompassion,
      ["@module.builtin"] = plt.necroticCompassion,

      ["@namespace"] = plt.necroticCompassion,
      ["@namespace.builtin"] = plt.necroticCompassion,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.necroticRage,

      ["@tag"] = plt.necroticRage,
      ["@tag.attribute"] = plt.necroticFear,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.necroticRage,

      ["@markup.strong"] = { fg = plt.voidBright, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.fg_light, underline = true },
      ["@markup.heading"] = plt.voidCore,
      ["@markup.heading.1"] = plt.necroticRage,
      ["@markup.heading.2"] = plt.necroticAvarice,
      ["@markup.heading.3"] = plt.necroticFear,
      ["@markup.heading.4"] = plt.necroticWill,
      ["@markup.heading.5"] = plt.necroticHope,
      ["@markup.heading.6"] = plt.necroticCompassion,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.necroticCompassion,
      ["@markup.link"] = plt.necroticHope,
      ["@markup.link.label"] = plt.necroticCompassion,
      ["@markup.link.url"] = plt.necroticHope,
      ["@markup.raw"] = plt.necroticWill,
      ["@markup.raw.block"] = plt.necroticWill,
      ["@markup.list"] = plt.necroticRage,
      ["@markup.list.checked"] = plt.necroticWill,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.necroticWill,
      ["@diff.minus"] = plt.necroticRage,
      ["@diff.delta"] = plt.necroticFear,

      ["@none"] = "none",
      ["@conceal"] = plt.voidDeep,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.necroticCompassion,
      ["@constructor.javascript"] = plt.necroticCompassion,
      ["@constructor.typescript"] = plt.necroticCompassion,
      ["@namespace.rust"] = plt.necroticCompassion,
      ["@type.qualifier.rust"] = plt.voidCore,
      ["@constant.macro.c"] = plt.necroticFear,
      ["@constant.macro.cpp"] = plt.necroticFear,
      ["@namespace.go"] = plt.necroticCompassion,
      ["@property.css"] = plt.necroticCompassion,
      ["@type.css"] = plt.necroticRage,
      ["@label.json"] = plt.necroticCompassion,
      ["@field.yaml"] = plt.necroticCompassion,
      ["@property.toml"] = plt.necroticCompassion,
      ["@function.builtin.bash"] = plt.necroticHope,
      ["@string.regexp"] = plt.necroticFear,
      ["@character.special.regex"] = plt.necroticLove,
    },

    lsp = {
      ["@lsp.type.class"] = plt.necroticCompassion,
      ["@lsp.type.interface"] = plt.necroticCompassion,
      ["@lsp.type.struct"] = plt.necroticCompassion,
      ["@lsp.type.enum"] = plt.necroticCompassion,
      ["@lsp.type.enumMember"] = plt.necroticAvarice,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.necroticCompassion,

      ["@lsp.type.macro"] = plt.necroticFear,
      ["@lsp.type.decorator"] = plt.necroticCompassion,

      ["@lsp.type.builtinType"] = plt.necroticCompassion,
      ["@lsp.type.selfParameter"] = plt.voidBright,
      ["@lsp.type.typeParameter"] = plt.necroticCompassion,

      ["@lsp.type.array"] = plt.necroticCompassion,
      ["@lsp.type.object"] = plt.necroticCompassion,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.necroticAvarice,
      ["@lsp.type.enumConstant"] = plt.necroticAvarice,

      ["@lsp.type.event"] = plt.necroticCompassion,
      ["@lsp.type.regexp"] = plt.necroticFear,
      ["@lsp.type.unresolvedReference"] = plt.necroticFear,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.necroticAvarice,
      ["@lsp.mod.async"] = plt.voidCore,
      ["@lsp.mod.static"] = plt.voidBright,
      ["@lsp.mod.abstract"] = plt.necroticCompassion,
      ["@lsp.mod.defaultLibrary"] = plt.necroticCompassion,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Lantern Corps – Black (Death)",
  author = "PrismPunk.nvim",
  description = "The blackest night falls from the skies, the darkness grows as all light dies. "
    .. "We crave your heart and your demise. By my black hand, the dead shall rise!",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.necroticRage,
    base09 = palette.necroticAvarice,
    base0A = palette.necroticFear,
    base0B = palette.necroticWill,
    base0C = palette.necroticCompassion,
    base0D = palette.necroticHope,
    base0E = palette.voidCore,
    base0F = palette.necroticLove,
  },

  palette = palette,
  get = M.get,
}