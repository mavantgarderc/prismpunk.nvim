local color = require("prismpunk.utils.color")

local palette = {
  greedVoid = "#1A0D00",
  avariceBlack = "#221200",
  hungerDepth = "#331A00",
  covetCore = "#442200",
  ophidianOrange = "#FF8800",
  greedFlame = "#FFAA00",
  possessGold = "#FFCC00",
  mineGlow = "#FFDD33",
  eternalHunger = "#FFEE66",
  paleGreed = "#FFDD88",
  covetBone = "#FFEEAA",
  goldenFlesh = "#FFFFCC",
  pureWant = "#FFFFFF",
  bloodGreed = "#FF0044",
  term_red = "#FF4466",
  term_green = "#44FF88",
  term_blue = "#44AAFF",

  bg_darkest = "#1A0D00",
  fg_lightest = "#FFDD88",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.ophidianOrange,
      insert = plt.greedFlame,
      visual = plt.possessGold,
      replace = plt.bloodGreed,
      command = plt.mineGlow,
    },

    ui = {
      fg = plt.covetBone,
      fg_dim = plt.goldenFlesh,
      fg_dimmer = plt.paleGreed,
      fg_dark = plt.eternalHunger,
      fg_reverse = plt.greedVoid,

      bg_m4 = plt.covetCore,
      bg_m3 = plt.hungerDepth,
      bg_m2 = plt.avariceBlack,
      bg_m1 = plt.greedVoid,
      bg_dim = plt.greedVoid,
      bg = plt.greedVoid,
      bg_p1 = plt.avariceBlack,
      bg_p2 = plt.hungerDepth,
      bg_gutter = opts.gutter and plt.hungerDepth or "none",
      bg_cursorline = plt.hungerDepth,
      bg_cursorline_alt = plt.avariceBlack,
      bg_search = plt.bloodGreed,
      bg_visual = plt.possessGold,
      bg_statusline = plt.hungerDepth,

      border = plt.ophidianOrange,
      header1 = plt.ophidianOrange,
      header2 = plt.greedFlame,
      special = plt.mineGlow,
      nontext = plt.avariceBlack,
      whitespace = plt.covetCore,
      win_separator = plt.ophidianOrange,
      indent = plt.avariceBlack,
      indent_scope = plt.eternalHunger,
      picker = plt.bloodGreed,
      yank = plt.ophidianOrange,
      mark = plt.mineGlow,
      scrollbar = plt.hungerDepth,

      tabline = {
        bg = plt.greedVoid,
        fg_selected = plt.ophidianOrange,
        bg_selected = plt.hungerDepth,
        fg_inactive = plt.paleGreed,
        bg_inactive = plt.greedVoid,
        fg_alternate = plt.mineGlow,
        bg_alternate = plt.greedVoid,
        indicator = plt.greedFlame,
      },

      pmenu = {
        fg = plt.covetBone,
        fg_sel = "none",
        fg_border = plt.hungerDepth,
        bg_border = plt.hungerDepth,
        bg = plt.hungerDepth,
        bg_sel = plt.avariceBlack,
        bg_sbar = plt.hungerDepth,
        bg_thumb = plt.ophidianOrange,
      },

      float = {
        fg = plt.covetBone,
        bg = plt.avariceBlack,
        fg_border = plt.hungerDepth,
        bg_border = plt.avariceBlack,
      },
    },

    accent = {
      accent1 = plt.ophidianOrange,
      accent2 = plt.greedFlame,
      accent3 = plt.possessGold,
      accent4 = plt.mineGlow,
      accent5 = plt.eternalHunger,
      invert = plt.hungerDepth,
    },

    rainbow = {
      rainbow1 = plt.ophidianOrange,
      rainbow2 = plt.greedFlame,
      rainbow3 = plt.possessGold,
      rainbow4 = plt.mineGlow,
      rainbow5 = plt.eternalHunger,
      rainbow6 = plt.bloodGreed,
      rainbow7 = plt.bloodGreed,
    },

    syn = {
      attribute = plt.eternalHunger,
      boolean = plt.ophidianOrange,
      comment = plt.paleGreed,
      constant = plt.pureWant,
      deprecated = plt.hungerDepth,
      func = plt.greedFlame,
      identifier = plt.covetBone,
      keyword = plt.ophidianOrange,
      method = plt.possessGold,
      number = plt.pureWant,
      operator = plt.bloodGreed,
      parameter = plt.goldenFlesh,
      preproc = plt.bloodGreed,
      punct = plt.paleGreed,
      regex = plt.mineGlow,
      statement = plt.ophidianOrange,
      string = plt.pureWant,
      symbol = plt.eternalHunger,
      type = plt.pureWant,
      variable = plt.covetBone,
      special = plt.mineGlow,
      special2 = plt.bloodGreed,
      special3 = plt.possessGold,
    },

    vcs = {
      added = plt.eternalHunger,
      removed = plt.bloodGreed,
      changed = plt.mineGlow,
    },

    diff = {
      add = plt.eternalHunger,
      change = plt.mineGlow,
      delete = plt.bloodGreed,
      text = plt.possessGold,
    },

    diag = {
      ok = plt.mineGlow,
      error = plt.bloodGreed,
      warning = plt.bloodGreed,
      info = plt.possessGold,
      hint = plt.eternalHunger,
    },

    term = {
      black = plt.greedVoid,
      red = plt.term_red,
      green = plt.term_green,
      yellow = plt.ophidianOrange,
      blue = plt.term_blue,
      magenta = "#ff66ff",
      cyan = "#44ffcc",
      white = plt.pureWant,

      black_bright = color(plt.greedVoid):brighten(0.7):to_hex(),
      red_bright = color(plt.term_red):brighten(0.2):to_hex(),
      green_bright = color(plt.term_green):brighten(0.1):to_hex(),
      yellow_bright = "#ffbb33",
      blue_bright = color(plt.term_blue):brighten(0.3):to_hex(),
      magenta_bright = "#ff88ff",
      cyan_bright = "#88ffee",
      white_bright = plt.pureWant,
      indexed1 = plt.bloodGreed,
      indexed2 = plt.mineGlow,
    },

    treesitter = {
      ["@comment"] = plt.paleGreed,
      ["@comment.documentation"] = plt.goldenFlesh,
      ["@comment.error"] = plt.bloodGreed,
      ["@comment.warning"] = plt.bloodGreed,
      ["@comment.todo"] = plt.mineGlow,
      ["@comment.note"] = plt.possessGold,

      ["@constant"] = plt.pureWant,
      ["@constant.builtinure"] = plt.pureWant,
      ["@constant.macro"] = plt.eternalHunger,

      ["@string"] = plt.pureWant,
      ["@string.documentation"] = plt.pureWant,
      ["@string.regex"] = plt.mineGlow,
      ["@string.escape"] = plt.bloodGreed,
      ["@string.special"] = plt.eternalHunger,
      ["@string.special.symbol"] = plt.bloodGreed,
      ["@string.special.url"] = plt.possessGold,
      ["@string.special.path"] = plt.pureWant,

      ["@character"] = plt.pureWant,
      ["@character.special"] = plt.bloodGreed,

      ["@number"] = plt.pureWant,
      ["@number.float"] = plt.pureWant,

      ["@boolean"] = plt.ophidianOrange,

      ["@function"] = plt.greedFlame,
      ["@function.builtin"] = plt.greedFlame,
      ["@function.call"] = plt.greedFlame,
      ["@function.macro"] = plt.mineGlow,
      ["@function.method"] = plt.possessGold,
      ["@function.method.call"] = plt.possessGold,

      ["@constructor"] = plt.ophidianOrange,

      ["@parameter"] = plt.goldenFlesh,
      ["@parameter.builtin"] = plt.covetBone,

      ["@keyword"] = plt.ophidianOrange,
      ["@keyword.coroutine"] = plt.possessGold,
      ["@keyword.function"] = plt.ophidianOrange,
      ["@keyword.operator"] = plt.bloodGreed,
      ["@keyword.return"] = plt.ophidianOrange,
      ["@keyword.import"] = plt.mineGlow,
      ["@keyword.storage"] = plt.ophidianOrange,
      ["@keyword.repeat"] = plt.ophidianOrange,
      ["@keyword.conditional"] = plt.ophidianOrange,
      ["@keyword.exception"] = plt.bloodGreed,
      ["@keyword.directive"] = plt.mineGlow,
      ["@keyword.directive.define"] = plt.mineGlow,

      ["@conditional"] = plt.ophidianOrange,
      ["@conditional.ternary"] = plt.ophidianOrange,

      ["@repeat"] = plt.ophidianOrange,

      ["@label"] = plt.possessGold,

      ["@operator"] = plt.bloodGreed,

      ["@exception"] = plt.bloodGreed,

      ["@variable"] = plt.covetBone,
      ["@variable.builtin"] = plt.ophidianOrange,
      ["@variable.parameter"] = plt.goldenFlesh,
      ["@variable.member"] = plt.covetBone,

      ["@type"] = plt.pureWant,
      ["@type.builtin"] = plt.pureWant,
      ["@type.definition"] = plt.pureWant,
      ["@type.qualifier"] = plt.ophidianOrange,

      ["@attribute"] = plt.eternalHunger,
      ["@attribute.builtin"] = plt.mineGlow,

      ["@property"] = plt.covetBone,

      ["@field"] = plt.covetBone,

      ["@module"] = plt.covetBone,
      ["@module.builtin"] = plt.covetBone,

      ["@namespace"] = plt.covetBone,
      ["@namespace.builtin"] = plt.covetBone,

      ["@punctuation.delimiter"] = plt.paleGreed,
      ["@punctuation.bracket"] = plt.paleGreed,
      ["@punctuation.special"] = plt.bloodGreed,

      ["@tag"] = plt.ophidianOrange,
      ["@tag.attribute"] = plt.mineGlow,
      ["@tag.delimiter"] = plt.paleGreed,
      ["@tag.builtin"] = plt.ophidianOrange,

      ["@markup.strong"] = { fg = plt.ophidianOrange, bold = true },
      ["@markup.italic"] = { fg = plt.covetBone, italic = true },
      ["@markup.strikethrough"] = { fg = plt.hungerDepth, strikethrough = true },
      ["@markup.underline"] = { fg = plt.bloodGreed, underline = true },
      ["@markup.heading"] = plt.ophidianOrange,
      ["@markup.heading.1"] = plt.ophidianOrange,
      ["@markup.heading.2"] = plt.greedFlame,
      ["@markup.heading.3"] = plt.possessGold,
      ["@markup.heading.4"] = plt.mineGlow,
      ["@markup.heading.5"] = plt.eternalHunger,
      ["@markup.heading.6"] = plt.bloodGreed,
      ["@markup.quote"] = plt.paleGreed,
      ["@markup.math"] = plt.possessGold,
      ["@markup.link"] = plt.mineGlow,
      ["@markup.link.label"] = plt.possessGold,
      ["@markup.link.url"] = plt.mineGlow,
      ["@markup.raw"] = plt.pureWant,
      ["@markup.raw.block"] = plt.pureWant,
      ["@markup.list"] = plt.ophidianOrange,
      ["@markup.list.checked"] = plt.eternalHunger,
      ["@markup.list.unchecked"] = plt.paleGreed,

      ["@diff.plus"] = plt.eternalHunger,
      ["@diff.minus"] = plt.bloodGreed,
      ["@diff.delta"] = plt.mineGlow,

      ["@none"] = "none",
      ["@conceal"] = plt.possessGold,
      ["@spell"] = plt.covetBone,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.covetBone,
      ["@constructor.python"] = plt.ophidianOrange,
      ["@constructor.javascript"] = plt.ophidianOrange,
      ["@constructor.typescript"] = plt.ophidianOrange,
      ["@namespace.rust"] = plt.covetBone,
      ["@type.qualifier.rust"] = plt.ophidianOrange,
      ["@constant.macro.c"] = plt.eternalHunger,
      ["@constant.macro.cpp"] = plt.eternalHunger,
      ["@namespace.go"] = plt.covetBone,
      ["@property.css"] = plt.possessGold,
      ["@type.css"] = plt.ophidianOrange,
      ["@label.json"] = plt.covetBone,
      ["@field.yaml"] = plt.possessGold,
      ["@property.toml"] = plt.possessGold,
      ["@function.builtin.bash"] = plt.greedFlame,
      ["@string.regexp"] = plt.mineGlow,
      ["@character.special.regex"] = plt.bloodGreed,
    },

    lsp = {
      ["@lsp.type.class"] = plt.pureWant,
      ["@lsp.type.interface"] = plt.pureWant,
      ["@lsp.type.struct"] = plt.pureWant,
      ["@lsp.type.enum"] = plt.pureWant,
      ["@lsp.type.enumMember"] = plt.mineGlow,
      ["@lsp.type.property"] = plt.covetBone,
      ["@lsp.type.namespace"] = plt.covetBone,

      ["@lsp.type.macro"] = plt.eternalHunger,
      ["@lsp.type.decorator"] = plt.ophidianOrange,

      ["@lsp.type.builtinType"] = plt.pureWant,
      ["@lsp.type.selfParameter"] = plt.ophidianOrange,
      ["@lsp.type.typeParameter"] = plt.pureWant,

      ["@lsp.type.array"] = plt.pureWant,
      ["@lsp.type.object"] = plt.pureWant,
      ["@lsp.type.key"] = plt.covetBone,
      ["@lsp.type.null"] = plt.pureWant,
      ["@lsp.type.enumConstant"] = plt.mineGlow,

      ["@lsp.type.event"] = plt.pureWant,
      ["@lsp.type.regexp"] = plt.mineGlow,
      ["@lsp.type.unresolvedReference"] = plt.bloodGreed,

      ["@lsp.mod.deprecated"] = { fg = plt.hungerDepth, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.pureWant,
      ["@lsp.mod.async"] = plt.ophidianOrange,
      ["@lsp.mod.static"] = plt.possessGold,
      ["@lsp.mod.abstract"] = plt.pureWant,
      ["@lsp.mod.defaultLibrary"] = plt.pureWant,
      ["@lsp.mod.documentation"] = plt.goldenFlesh,
    },
  }
end

return {
  name = "Emotional Entity – Ophidian (Avarice)",
  author = "PrismPunk.nvim",
  description = "The orange serpent of greed. It wants your soul. It wants your code. "
    .. "It wants everything. And it will never have enough.",

  base16 = {
    base00 = palette.greedVoid,
    base01 = palette.avariceBlack,
    base02 = palette.hungerDepth,
    base03 = palette.covetCore,
    base04 = palette.paleGreed,
    base05 = palette.goldenFlesh,
    base06 = palette.covetBone,
    base07 = palette.pureWant,
    base08 = palette.bloodGreed,
    base09 = palette.bloodGreed,
    base0A = palette.mineGlow,
    base0B = palette.eternalHunger,
    base0C = palette.possessGold,
    base0D = palette.ophidianOrange,
    base0E = palette.greedFlame,
    base0F = palette.eternalHunger,
  },

  palette = palette,
  get = M.get,
}
