local color = require("prismpunk.utils.color")

local palette = {
  goreBlack = "#0C0709",
  bloodVoid = "#11080C",
  rageDepth = "#180A10",
  slaughterCore = "#1F0B14",
  butcherRed = "#FF0044",
  arterialFlame = "#FF2255",
  carnageRed = "#FF3366",
  rageFire = "#FF5566",
  hellGlow = "#FF7788",
  flayedFlesh = "#FF9999",
  boneSnap = "#FFBBBB",
  skullWhite = "#FFDDDD",
  pureBone = "#FFFFFF",
  demonAsh = "#CC2222",
  moltenVein = "#FF0000",
  boilingBlood = "#FF4400",
  wrathGold = "#FF8800",
  term_green = "#00FF00",
  term_blue = "#0088FF",
  term_cyan = "#00FFFF",

  bg_darkest = "#0C0709",
  fg_lightest = "#FFDDDD",
}

local M = {}

M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.butcherRed,
      insert = plt.arterialFlame,
      visual = plt.carnageRed,
      replace = plt.moltenVein,
      command = plt.wrathGold,
    },

    ui = {
      fg = plt.skullWhite,
      fg_dim = plt.boneSnap,
      fg_dimmer = plt.flayedFlesh,
      fg_dark = plt.hellGlow,
      fg_reverse = plt.goreBlack,

      bg_m4 = plt.slaughterCore,
      bg_m3 = plt.rageDepth,
      bg_m2 = plt.bloodVoid,
      bg_m1 = plt.goreBlack,
      bg_dim = plt.goreBlack,
      bg = plt.goreBlack,
      bg_p1 = plt.bloodVoid,
      bg_p2 = plt.rageDepth,
      bg_gutter = opts.gutter and plt.rageDepth or "none",
      bg_cursorline = plt.rageDepth,
      bg_cursorline_alt = plt.bloodVoid,
      bg_search = plt.boilingBlood,
      bg_visual = plt.carnageRed,
      bg_statusline = plt.rageDepth,

      border = plt.butcherRed,
      header1 = plt.butcherRed,
      header2 = plt.arterialFlame,
      special = plt.wrathGold,
      nontext = plt.bloodVoid,
      whitespace = plt.rageDepth,
      win_separator = plt.butcherRed,
      indent = plt.bloodVoid,
      indent_scope = plt.rageFire,
      picker = plt.moltenVein,
      yank = plt.boilingBlood,
      mark = plt.wrathGold,
      scrollbar = plt.rageDepth,

      tabline = {
        bg = plt.goreBlack,
        fg_selected = plt.butcherRed,
        bg_selected = plt.rageDepth,
        fg_inactive = plt.flayedFlesh,
        bg_inactive = plt.goreBlack,
        fg_alternate = plt.wrathGold,
        bg_alternate = plt.goreBlack,
        indicator = plt.arterialFlame,
      },

      pmenu = {
        fg = plt.skullWhite,
        fg_sel = plt.skullWhite,
        fg_border = plt.butcherRed,
        bg_border = plt.rageDepth,
        bg = plt.rageDepth,
        bg_sel = plt.bloodVoid,
        bg_sbar = plt.rageDepth,
        bg_thumb = plt.butcherRed,
      },

      float = {
        fg = plt.skullWhite,
        bg = plt.goreBlack,
        fg_border = plt.butcherRed,
        bg_border = plt.goreBlack,
      },
    },

    accent = {
      accent1 = plt.butcherRed,
      accent2 = plt.arterialFlame,
      accent3 = plt.carnageRed,
      accent4 = plt.moltenVein,
      accent5 = plt.wrathGold,
      invert = plt.rageDepth,
    },

    rainbow = {
      rainbow1 = plt.butcherRed,
      rainbow2 = plt.arterialFlame,
      rainbow3 = plt.carnageRed,
      rainbow4 = plt.rageFire,
      rainbow5 = plt.boilingBlood,
      rainbow6 = plt.moltenVein,
      rainbow7 = plt.wrathGold,
    },

    syn = {
      attribute = plt.wrathGold,
      boolean = plt.butcherRed,
      comment = plt.flayedFlesh,
      constant = plt.pureBone,
      deprecated = plt.goreBlack,
      func = plt.arterialFlame,
      identifier = plt.skullWhite,
      keyword = plt.butcherRed,
      method = plt.carnageRed,
      number = plt.pureBone,
      operator = plt.moltenVein,
      parameter = plt.boneSnap,
      preproc = plt.wrathGold,
      punct = plt.hellGlow,
      regex = plt.boilingBlood,
      statement = plt.butcherRed,
      string = plt.rageFire,
      symbol = plt.wrathGold,
      type = plt.pureBone,
      variable = plt.skullWhite,
      special = plt.demonAsh,
      special2 = plt.moltenVein,
      special3 = plt.boilingBlood,
    },

    vcs = { added = plt.boilingBlood, removed = plt.goreBlack, changed = plt.wrathGold },
    diff = { add = plt.boilingBlood, change = plt.wrathGold, delete = plt.goreBlack, text = plt.arterialFlame },
    diag = {
      ok = plt.wrathGold,
      error = plt.butcherRed,
      warning = plt.moltenVein,
      info = plt.arterialFlame,
      hint = plt.boilingBlood,
    },

    term = {
      black = plt.goreBlack,
      red = plt.butcherRed,
      green = plt.term_green,
      yellow = plt.wrathGold,
      blue = plt.term_blue,
      magenta = plt.carnageRed,
      cyan = plt.term_cyan,
      white = plt.pureBone,

      black_bright = color(plt.rageDepth):brighten(0.4):to_hex(),
      red_bright = color(plt.butcherRed):brighten(0.15):to_hex(),
      green_bright = color(plt.term_green):brighten(0.15):to_hex(),
      yellow_bright = color(plt.wrathGold):brighten(0.15):to_hex(),
      blue_bright = color(plt.term_blue):brighten(0.25):to_hex(),
      magenta_bright = color(plt.carnageRed):brighten(0.15):to_hex(),
      cyan_bright = color(plt.term_cyan):brighten(0.15):to_hex(),
      white_bright = "#ffffff",
      indexed1 = plt.moltenVein,
      indexed2 = plt.boilingBlood,
    },

    treesitter = {
      ["@comment"] = plt.flayedFlesh,
      ["@comment.documentation"] = plt.boneSnap,
      ["@comment.error"] = plt.butcherRed,
      ["@comment.warning"] = plt.moltenVein,
      ["@comment.todo"] = plt.wrathGold,
      ["@comment.note"] = plt.boilingBlood,

      ["@constant"] = plt.pureBone,
      ["@constant.builtin"] = plt.pureBone,
      ["@constant.macro"] = plt.wrathGold,

      ["@string"] = plt.rageFire,
      ["@string.documentation"] = plt.rageFire,
      ["@string.regex"] = plt.boilingBlood,
      ["@string.escape"] = plt.moltenVein,
      ["@string.special"] = plt.carnageRed,
      ["@string.special.symbol"] = plt.wrathGold,
      ["@string.special.url"] = plt.arterialFlame,
      ["@string.special.path"] = plt.rageFire,

      ["@character"] = plt.rageFire,
      ["@character.special"] = plt.wrathGold,

      ["@number"] = plt.pureBone,
      ["@number.float"] = plt.pureBone,

      ["@boolean"] = plt.butcherRed,

      ["@function"] = plt.arterialFlame,
      ["@function.builtin"] = plt.arterialFlame,
      ["@function.call"] = plt.arterialFlame,
      ["@function.macro"] = plt.wrathGold,
      ["@function.method"] = plt.carnageRed,
      ["@function.method.call"] = plt.carnageRed,

      ["@constructor"] = plt.butcherRed,

      ["@parameter"] = plt.boneSnap,
      ["@parameter.builtin"] = plt.skullWhite,

      ["@keyword"] = plt.butcherRed,
      ["@keyword.function"] = plt.butcherRed,
      ["@keyword.operator"] = plt.moltenVein,
      ["@keyword.return"] = plt.butcherRed,
      ["@keyword.exception"] = plt.goreBlack,

      ["@variable"] = plt.skullWhite,
      ["@variable.builtin"] = plt.butcherRed,
      ["@variable.parameter"] = plt.boneSnap,
      ["@variable.member"] = plt.skullWhite,

      ["@type"] = plt.pureBone,
      ["@type.builtin"] = plt.pureBone,

      ["@property"] = plt.skullWhite,
      ["@field"] = plt.skullWhite,

      ["@punctuation.delimiter"] = plt.hellGlow,
      ["@punctuation.bracket"] = plt.hellGlow,
      ["@punctuation.special"] = plt.moltenVein,

      ["@tag"] = plt.butcherRed,
      ["@tag.attribute"] = plt.wrathGold,
      ["@tag.delimiter"] = plt.hellGlow,

      ["@markup.strong"] = { fg = plt.butcherRed, bold = true },
      ["@markup.italic"] = { fg = plt.skullWhite, italic = true },
      ["@markup.strikethrough"] = { fg = plt.goreBlack, strikethrough = true },
      ["@markup.underline"] = { fg = plt.moltenVein, underline = true },
      ["@markup.heading.1"] = plt.butcherRed,
      ["@markup.heading.2"] = plt.arterialFlame,
      ["@markup.heading.3"] = plt.carnageRed,
      ["@markup.heading.4"] = plt.rageFire,
      ["@markup.heading.5"] = plt.boilingBlood,
      ["@markup.heading.6"] = plt.wrathGold,

      ["@markup.quote"] = plt.flayedFlesh,
      ["@markup.list.checked"] = plt.boilingBlood,
      ["@markup.list.unchecked"] = plt.hellGlow,

      ["@diff.plus"] = plt.boilingBlood,
      ["@diff.minus"] = plt.goreBlack,
      ["@diff.delta"] = plt.wrathGold,

      ["@none"] = "none",
      ["@conceal"] = plt.bloodVoid,
      ["@spell"] = plt.skullWhite,
      ["@nospell"] = "none",
    },

    lsp = {
      ["@lsp.type.class"] = plt.pureBone,
      ["@lsp.type.property"] = plt.skullWhite,
      ["@lsp.type.function"] = plt.arterialFlame,
      ["@lsp.mod.deprecated"] = { fg = plt.goreBlack, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.pureBone,
      ["@lsp.mod.async"] = plt.butcherRed,
      ["@lsp.mod.static"] = plt.arterialFlame,
      ["@lsp.mod.abstract"] = plt.pureBone,
      ["@lsp.mod.documentation"] = plt.boneSnap,
    },
  }
end

return {
  name = "Emotional Entity – Butcher (Rage)",
  author = "PrismPunk.nvim",
  description = "The bull-headed god of slaughter. "
    .. "Its horns drip with the blood of dead galaxies. "
    .. "It does not speak. It only screams.",

  base16 = {
    base00 = palette.goreBlack,
    base01 = palette.bloodVoid,
    base02 = palette.rageDepth,
    base03 = palette.slaughterCore,
    base04 = palette.hellGlow,
    base05 = palette.flayedFlesh,
    base06 = palette.boneSnap,
    base07 = palette.skullWhite,
    base08 = palette.moltenVein,
    base09 = palette.boilingBlood,
    base0A = palette.wrathGold,
    base0B = palette.rageFire,
    base0C = palette.carnageRed,
    base0D = palette.butcherRed,
    base0E = palette.arterialFlame,
    base0F = palette.demonAsh,
  },

  palette = palette,
  get = M.get,
}
