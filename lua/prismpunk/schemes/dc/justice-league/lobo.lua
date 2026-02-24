local color = require("prismpunk.utils.color")

local palette = {
  space_void = "#0B0014",
  deep_czarnia = "#120022",
  nebula_depth = "#1A0033",
  exhaust_core = "#220044",
  mainman_red = "#FF0033",
  frag_red = "#FF1A44",
  blood_glow = "#FF3355",
  hook_crimson = "#FF5566",
  cigar_cherry = "#FF7788",
  arterial_spray = "#FF99AA",
  chrome_steel = "#E0E0E0",
  gunmetal = "#BBBBBB",
  chain_silver = "#9999AA",
  skull_white = "#FFFFFF",
  cigar_ash = "#FFCC99",
  beer_foam = "#FFFFCC",
  plasma_orange = "#FF6600",
  muzzle_flash = "#FF8844",
  ozone_blue = "#4488FF",
  term_red = "#FF3366",
  term_green = "#88FF88",
  term_blue = "#6688FF",

  bg_darkest = "#0B0014",
  fg_lightest = "#FFFFFF",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.mainman_red,
      insert = plt.plasma_orange,
      visual = plt.muzzle_flash,
      replace = plt.frag_red,
      command = plt.ozone_blue,
    },

    ui = {
      fg = plt.skull_white,
      fg_dim = plt.beer_foam,
      fg_dimmer = plt.chrome_steel,
      fg_dark = plt.gunmetal,
      fg_reverse = plt.space_void,

      bg_m4 = plt.exhaust_core,
      bg_m3 = plt.nebula_depth,
      bg_m2 = plt.deep_czarnia,
      bg_m1 = plt.space_void,
      bg_dim = plt.space_void,
      bg = plt.space_void,
      bg_p1 = plt.deep_czarnia,
      bg_p2 = plt.nebula_depth,
      bg_gutter = opts.gutter and plt.nebula_depth or "none",
      bg_cursorline = plt.nebula_depth,
      bg_cursorline_alt = plt.deep_czarnia,
      bg_search = plt.frag_red,
      bg_visual = plt.muzzle_flash,
      bg_statusline = plt.nebula_depth,

      border = plt.mainman_red,
      header1 = plt.mainman_red,
      header2 = plt.plasma_orange,
      special = plt.cigar_cherry,
      nontext = plt.deep_czarnia,
      whitespace = plt.exhaust_core,
      win_separator = plt.mainman_red,
      indent = plt.deep_czarnia,
      indent_scope = plt.chain_silver,
      picker = plt.frag_red,
      yank = plt.mainman_red,
      mark = plt.cigar_ash,
      scrollbar = plt.nebula_depth,

      tabline = {
        bg = plt.space_void,
        fg_selected = plt.mainman_red,
        bg_selected = plt.nebula_depth,
        fg_inactive = plt.gunmetal,
        bg_inactive = plt.space_void,
        fg_alternate = plt.cigar_ash,
        bg_alternate = plt.space_void,
        indicator = plt.plasma_orange,
      },

      pmenu = {
        fg = plt.skull_white,
        fg_sel = "none",
        fg_border = plt.nebula_depth,
        bg_border = plt.nebula_depth,
        bg = plt.nebula_depth,
        bg_sel = plt.deep_czarnia,
        bg_sbar = plt.nebula_depth,
        bg_thumb = plt.mainman_red,
      },

      float = {
        fg = plt.skull_white,
        bg = plt.deep_czarnia,
        fg_border = plt.nebula_depth,
        bg_border = plt.deep_czarnia,
      },
    },

    accent = {
      accent1 = plt.mainman_red,
      accent2 = plt.plasma_orange,
      accent3 = plt.muzzle_flash,
      accent4 = plt.cigar_cherry,
      accent5 = plt.arterial_spray,
      invert = plt.nebula_depth,
    },

    rainbow = {
      rainbow1 = plt.mainman_red,
      rainbow2 = plt.frag_red,
      rainbow3 = plt.blood_glow,
      rainbow4 = plt.plasma_orange,
      rainbow5 = plt.muzzle_flash,
      rainbow6 = plt.ozone_blue,
      rainbow7 = plt.cigar_ash,
    },

    syn = {
      attribute = plt.chain_silver,
      boolean = plt.mainman_red,
      comment = plt.gunmetal,
      constant = plt.skull_white,
      deprecated = plt.nebula_depth,
      func = plt.plasma_orange,
      identifier = plt.chrome_steel,
      keyword = plt.mainman_red,
      method = plt.muzzle_flash,
      number = plt.beer_foam,
      operator = plt.frag_red,
      parameter = plt.cigar_cherry,
      preproc = plt.frag_red,
      punct = plt.gunmetal,
      regex = plt.cigar_ash,
      statement = plt.mainman_red,
      string = plt.beer_foam,
      symbol = plt.chain_silver,
      type = plt.skull_white,
      variable = plt.chrome_steel,
      special = plt.cigar_cherry,
      special2 = plt.frag_red,
      special3 = plt.ozone_blue,
    },

    vcs = { added = plt.cigar_ash, removed = plt.frag_red, changed = plt.blood_glow },
    diff = { add = plt.cigar_ash, change = plt.muzzle_flash, delete = plt.frag_red, text = plt.ozone_blue },
    diag = {
      ok = plt.cigar_ash,
      error = plt.frag_red,
      warning = plt.blood_glow,
      info = plt.ozone_blue,
      hint = plt.chain_silver,
    },

    term = {
      black = plt.space_void,
      red = plt.term_red,
      green = plt.term_green,
      yellow = plt.cigar_ash,
      blue = plt.term_blue,
      magenta = plt.muzzle_flash,
      cyan = plt.ozone_blue,
      white = plt.skull_white,

      black_bright = color(plt.space_void):brighten(0.7):to_hex(),
      red_bright = "#ff5588",
      green_bright = "#aaffaa",
      yellow_bright = "#ffddaa",
      blue_bright = "#88aaff",
      magenta_bright = "#ff9966",
      cyan_bright = "#88ccff",
      white_bright = plt.skull_white,
      indexed1 = plt.frag_red,
      indexed2 = plt.cigar_cherry,
    },

    treesitter = {
      ["@comment"] = plt.gunmetal,
      ["@comment.documentation"] = plt.chain_silver,
      ["@comment.error"] = plt.frag_red,
      ["@comment.warning"] = plt.blood_glow,
      ["@comment.todo"] = plt.cigar_ash,
      ["@comment.note"] = plt.ozone_blue,

      ["@constant"] = plt.skull_white,
      ["@constant.builtin"] = plt.skull_white,
      ["@constant.macro"] = plt.chain_silver,

      ["@string"] = plt.beer_foam,
      ["@string.documentation"] = plt.beer_foam,
      ["@string.regex"] = plt.cigar_ash,
      ["@string.escape"] = plt.frag_red,
      ["@string.special"] = plt.ozone_blue,

      ["@boolean"] = plt.mainman_red,

      ["@function"] = plt.plasma_orange,
      ["@function.builtin"] = plt.plasma_orange,
      ["@function.method"] = plt.muzzle_flash,

      ["@constructor"] = plt.mainman_red,

      ["@parameter"] = plt.cigar_cherry,

      ["@keyword"] = plt.mainman_red,
      ["@keyword.operator"] = plt.frag_red,
      ["@keyword.return"] = plt.mainman_red,
      ["@keyword.exception"] = plt.frag_red,

      ["@variable"] = plt.chrome_steel,
      ["@variable.builtin"] = plt.mainman_red,

      ["@type"] = plt.skull_white,
      ["@type.qualifier"] = plt.mainman_red,

      ["@punctuation.delimiter"] = plt.gunmetal,
      ["@punctuation.bracket"] = plt.gunmetal,
      ["@punctuation.special"] = plt.frag_red,

      ["@tag"] = plt.mainman_red,
      ["@tag.attribute"] = plt.cigar_cherry,

      ["@markup.strong"] = { fg = plt.mainman_red, bold = true },
      ["@markup.italic"] = { fg = plt.chrome_steel, italic = true },
      ["@markup.strikethrough"] = { fg = plt.nebula_depth, strikethrough = true },
      ["@markup.underline"] = { fg = plt.frag_red, underline = true },
      ["@markup.heading.1"] = plt.mainman_red,
      ["@markup.heading.2"] = plt.plasma_orange,
      ["@markup.heading.3"] = plt.muzzle_flash,
      ["@markup.heading.4"] = plt.cigar_cherry,
      ["@markup.heading.5"] = plt.arterial_spray,
      ["@markup.heading.6"] = plt.ozone_blue,

      ["@diff.plus"] = plt.cigar_ash,
      ["@diff.minus"] = plt.frag_red,
      ["@diff.delta"] = plt.muzzle_flash,

      ["@lsp.type.unresolvedReference"] = plt.frag_red,
      ["@lsp.mod.deprecated"] = { fg = plt.nebula_depth, strikethrough = true },
    },

    lsp = {
      ["@lsp.type.class"] = plt.skull_white,
      ["@lsp.type.property"] = plt.chrome_steel,
      ["@lsp.type.decorator"] = plt.mainman_red,
      ["@lsp.type.selfParameter"] = plt.mainman_red,
      ["@lsp.mod.deprecated"] = { fg = plt.nebula_depth, strikethrough = true },
    },
  }
end

return {
  name = "Justice League – Lobo (Real Main Man Edition)",
  author = "PrismPunk.nvim",
  description = "No fraggin’ purple. Just blood, chrome, cigar ash, "
    .. "and the smell of burnt ozone. That’s how the Main Man rolls.",

  base16 = {
    base00 = palette.space_void,
    base01 = palette.deep_czarnia,
    base02 = palette.nebula_depth,
    base03 = palette.exhaust_core,
    base04 = palette.gunmetal,
    base05 = palette.chrome_steel,
    base06 = palette.beer_foam,
    base07 = palette.skull_white,
    base08 = palette.frag_red,
    base09 = palette.plasma_orange,
    base0A = palette.cigar_ash,
    base0B = palette.muzzle_flash,
    base0C = palette.ozone_blue,
    base0D = palette.mainman_red,
    base0E = palette.blood_glow,
    base0F = palette.arterial_spray,
  },

  palette = palette,
  get = M.get,
}
