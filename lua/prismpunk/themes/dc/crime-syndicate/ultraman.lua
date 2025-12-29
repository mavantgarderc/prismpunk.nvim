local color = require("prismpunk.utils.color")
local palette = require("prismpunk.palettes.dc.crime-syndicate.ultraman")

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.enslaverBlue,
      insert = plt.kryptoniteGreen,
      visual = plt.tyrannyRed,
      replace = plt.solarFlare,
      command = plt.despotGold,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_dark,
      fg_dark = plt.bg_lightest,
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
      bg_search = plt.kryptoniteGreen,
      bg_visual = plt.dreadPurple,
      bg_statusline = plt.bg_light,
      border = plt.tyrannyRed, -- Signature red for tyranny
      header1 = plt.despotGold,
      header2 = plt.tyrannyRed,
      special = plt.subjugationTeal,
      nontext = plt.fg_dark, -- Better contrast
      whitespace = plt.bg_lightest,
      win_separator = plt.tyrannyRed, -- Signature red for tyranny
      indent = plt.bg_lighter,
      indent_scope = plt.enslaverBlue,
      picker = plt.atrocityOrange,
      yank = plt.despotGold,
      mark = plt.subjugationTeal,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_light, -- Better contrast
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.despotGold,
        bg_alternate = plt.bg_darkest,
        indicator = plt.solarFlare,
      },
      pmenu = {
        fg = plt.fg_lightest,
        fg_sel = "none",
        fg_border = plt.bg_lighter,
        bg_border = plt.bg_light,
        bg = plt.bg_light,
        bg_sel = plt.bg_lighter,
        bg_sbar = plt.bg_light,
        bg_thumb = plt.tyrannyRed, -- Signature red for tyranny
      },
      float = {
        fg = plt.fg_light,
        bg = plt.bg_mid,
        fg_border = plt.tyrannyRed, -- Signature red for tyranny
        bg_border = plt.bg_mid,
      },
    },

    accent = {
      accent1 = plt.despotGold,
      accent2 = plt.enslaverBlue,
      accent3 = plt.kryptoniteGreen,
      accent4 = plt.tyrannyRed,
      accent5 = plt.dominionViolet,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.despotGold,
      rainbow2 = plt.enslaverBlue,
      rainbow3 = plt.tyrannyRed,
      rainbow4 = plt.kryptoniteGreen,
      rainbow5 = plt.dominionViolet,
      rainbow6 = plt.subjugationTeal,
      rainbow7 = plt.atrocityOrange,
    },

    syn = {
      attribute = plt.atrocityOrange,
      boolean = plt.kryptoniteGreen,
      comment = plt.fg_light, -- Brighter for better contrast
      constant = plt.despotGold,
      deprecated = plt.fg_mid,
      func = plt.enslaverBlue,
      identifier = plt.fg_lightest,
      keyword = plt.tyrannyRed,
      method = plt.dominionViolet,
      number = plt.solarFlare,
      operator = plt.subjugationTeal,
      parameter = plt.fg_light, -- Brighter for better contrast
      preproc = plt.enslaverBlue,
      punct = plt.fg_light, -- Brighter for better contrast
      regex = plt.atrocityOrange,
      statement = plt.tyrannyRed,
      string = plt.despotGold,
      symbol = plt.subjugationTeal,
      type = plt.fg_lightest,
      variable = plt.fg_lightest,
      special = plt.atrocityOrange,
      special2 = plt.tyrannyRed,
      special3 = plt.enslaverBlue,
    },

    vcs = {
      added = plt.kryptoniteGreen,
      removed = plt.tyrannyRed,
      changed = plt.despotGold,
    },

    diff = {
      add = plt.kryptoniteGreen,
      change = plt.despotGold,
      delete = plt.tyrannyRed,
      text = plt.dominionViolet,
    },

    diag = {
      ok = plt.kryptoniteGreen,
      error = plt.tyrannyRed,
      warning = plt.atrocityOrange,
      info = plt.enslaverBlue,
      hint = plt.subjugationTeal,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.tyrannyRed,
      green = plt.kryptoniteGreen,
      yellow = plt.despotGold,
      blue = plt.enslaverBlue,
      magenta = plt.dominionViolet,
      cyan = plt.subjugationTeal,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.tyrannyRed):brighten(0.2):to_hex(),
      green_bright = color(plt.kryptoniteGreen):brighten(0.1):to_hex(),
      yellow_bright = color(plt.despotGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.enslaverBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.dominionViolet):brighten(0.2):to_hex(),
      cyan_bright = color(plt.subjugationTeal):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.despotGold,
      indexed2 = plt.tyrannyRed,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.tyrannyRed,
      ["@comment.warning"] = plt.atrocityOrange,
      ["@comment.todo"] = plt.despotGold,
      ["@comment.note"] = plt.subjugationTeal,

      ["@constant"] = plt.despotGold,
      ["@constant.builtin"] = plt.despotGold,
      ["@constant.macro"] = plt.atrocityOrange,

      ["@string"] = plt.despotGold,
      ["@string.documentation"] = plt.despotGold,
      ["@string.regex"] = plt.atrocityOrange,
      ["@string.escape"] = plt.solarFlare,
      ["@string.special"] = plt.subjugationTeal,
      ["@string.special.symbol"] = plt.subjugationTeal,
      ["@string.special.url"] = plt.dreadPurple,
      ["@string.special.path"] = plt.despotGold,

      ["@character"] = plt.despotGold,
      ["@character.special"] = plt.solarFlare,

      ["@number"] = plt.solarFlare,
      ["@number.float"] = plt.solarFlare,

      ["@boolean"] = plt.kryptoniteGreen,

      ["@function"] = plt.enslaverBlue,
      ["@function.builtin"] = plt.enslaverBlue,
      ["@function.call"] = plt.enslaverBlue,
      ["@function.macro"] = plt.dominionViolet,
      ["@function.method"] = plt.dominionViolet,
      ["@function.method.call"] = plt.dominionViolet,

      ["@constructor"] = plt.fg_lightest,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.tyrannyRed,
      ["@keyword.coroutine"] = plt.dreadPurple,
      ["@keyword.function"] = plt.tyrannyRed,
      ["@keyword.operator"] = plt.subjugationTeal,
      ["@keyword.return"] = plt.tyrannyRed,
      ["@keyword.import"] = plt.enslaverBlue,
      ["@keyword.storage"] = plt.tyrannyRed,
      ["@keyword.repeat"] = plt.tyrannyRed,
      ["@keyword.conditional"] = plt.tyrannyRed,
      ["@keyword.exception"] = plt.tyrannyRed,
      ["@keyword.directive"] = plt.enslaverBlue,
      ["@keyword.directive.define"] = plt.enslaverBlue,

      ["@conditional"] = plt.tyrannyRed,
      ["@conditional.ternary"] = plt.tyrannyRed,

      ["@repeat"] = plt.tyrannyRed,

      ["@label"] = plt.dreadPurple,

      ["@operator"] = plt.subjugationTeal,

      ["@exception"] = plt.tyrannyRed,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.dreadPurple,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.fg_lightest,
      ["@type.builtin"] = plt.fg_lightest,
      ["@type.definition"] = plt.fg_lightest,
      ["@type.qualifier"] = plt.tyrannyRed,

      ["@attribute"] = plt.atrocityOrange,
      ["@attribute.builtin"] = plt.atrocityOrange,

      ["@property"] = plt.fg_light,
      ["@field"] = plt.fg_light,

      ["@module"] = plt.fg_lightest,
      ["@module.builtin"] = plt.fg_lightest,

      ["@namespace"] = plt.fg_lightest,
      ["@namespace.builtin"] = plt.fg_lightest,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.subjugationTeal,

      ["@tag"] = plt.tyrannyRed,
      ["@tag.attribute"] = plt.atrocityOrange,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.tyrannyRed,

      ["@markup.strong"] = { fg = plt.despotGold, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.subjugationTeal, underline = true },
      ["@markup.heading"] = plt.despotGold,
      ["@markup.heading.1"] = plt.despotGold,
      ["@markup.heading.2"] = plt.solarFlare,
      ["@markup.heading.3"] = plt.tyrannyRed,
      ["@markup.heading.4"] = plt.enslaverBlue,
      ["@markup.heading.5"] = plt.dominionViolet,
      ["@markup.heading.6"] = plt.dreadPurple,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.subjugationTeal,
      ["@markup.link"] = plt.dreadPurple,
      ["@markup.link.label"] = plt.subjugationTeal,
      ["@markup.link.url"] = plt.dreadPurple,
      ["@markup.raw"] = plt.despotGold,
      ["@markup.raw.block"] = plt.despotGold,
      ["@markup.list"] = plt.tyrannyRed,
      ["@markup.list.checked"] = plt.kryptoniteGreen,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.kryptoniteGreen,
      ["@diff.minus"] = plt.tyrannyRed,
      ["@diff.delta"] = plt.despotGold,

      ["@none"] = "none",
      ["@conceal"] = plt.dominionViolet,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.fg_lightest,
      ["@constructor.javascript"] = plt.fg_lightest,
      ["@constructor.typescript"] = plt.fg_lightest,
      ["@namespace.rust"] = plt.fg_lightest,
      ["@type.qualifier.rust"] = plt.tyrannyRed,
      ["@constant.macro.c"] = plt.atrocityOrange,
      ["@constant.macro.cpp"] = plt.atrocityOrange,
      ["@namespace.go"] = plt.fg_lightest,
      ["@property.css"] = plt.dreadPurple,
      ["@type.css"] = plt.tyrannyRed,
      ["@label.json"] = plt.fg_lightest,
      ["@field.yaml"] = plt.dreadPurple,
      ["@property.toml"] = plt.dreadPurple,
      ["@function.builtin.bash"] = plt.enslaverBlue,
      ["@string.regexp"] = plt.atrocityOrange,
      ["@character.special.regex"] = plt.solarFlare,
    },

    lsp = {
      ["@lsp.type.class"] = plt.fg_lightest,
      ["@lsp.type.interface"] = plt.fg_lightest,
      ["@lsp.type.struct"] = plt.fg_lightest,
      ["@lsp.type.enum"] = plt.fg_lightest,
      ["@lsp.type.enumMember"] = plt.despotGold,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.fg_lightest,

      ["@lsp.type.macro"] = plt.atrocityOrange,
      ["@lsp.type.decorator"] = plt.fg_lightest,

      ["@lsp.type.builtinType"] = plt.fg_lightest,
      ["@lsp.type.selfParameter"] = plt.dreadPurple,
      ["@lsp.type.typeParameter"] = plt.fg_lightest,

      ["@lsp.type.array"] = plt.fg_lightest,
      ["@lsp.type.object"] = plt.fg_lightest,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.despotGold,
      ["@lsp.type.enumConstant"] = plt.despotGold,

      ["@lsp.type.event"] = plt.fg_lightest,
      ["@lsp.type.regexp"] = plt.atrocityOrange,
      ["@lsp.type.unresolvedReference"] = plt.solarFlare,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.despotGold,
      ["@lsp.mod.async"] = plt.tyrannyRed,
      ["@lsp.mod.static"] = plt.dreadPurple,
      ["@lsp.mod.abstract"] = plt.fg_lightest,
      ["@lsp.mod.defaultLibrary"] = plt.fg_lightest,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Crime Syndicate – Ultraman",
  author = "PrismPunk.nvim",
  description = "Tyrant of Earth-3. Kryptonite-powered god-emperor. Absolute evil supremacy.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.tyrannyRed,
    base09 = palette.atrocityOrange,
    base0A = palette.despotGold,
    base0B = palette.kryptoniteGreen,
    base0C = palette.subjugationTeal,
    base0D = palette.enslaverBlue,
    base0E = palette.dominionViolet,
    base0F = palette.solarFlare,
  },

  palette = palette,
  get = M.get,
}