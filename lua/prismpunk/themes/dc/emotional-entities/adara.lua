local color = require("prismpunk.utils.color")

local palette = {
  voidWhite = "#0F0F1A",
  abyssBlue = "#131325",
  deepHope = "#1A1A33",
  cosmicBlue = "#1F1F44",
  hopeCore = "#00EEFF",
  skyfireCyan = "#00DDFF",
  divineAzure = "#00CCFF",
  celestialGlow = "#00BBFF",
  starbirthBlue = "#00AAFF",
  angelFeather = "#CCFFFF",
  wingsOfDawn = "#E6F5FF",
  hopeRadiance = "#F0F8FF",
  pureLight = "#FFFFFF",
  etherealWhite = "#F8FAFF",
  sapphireTear = "#4488FF",
  miracleFlame = "#00FFCC",
  auroraVein = "#00FFAA",
  brokenChains = "#FFAA00",
  goldenPromise = "#FFDD00",
  term_red = "#FF3366",
  term_blue = "#0088FF",
  term_magenta = "#FF00FF",

  bg_darkest = "#1A1A33",
  fg_lightest = "#FFFFFF",
}

local M = {}

M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.hopeCore,
      insert = plt.divineAzure,
      visual = plt.skyfireCyan,
      replace = plt.brokenChains,
      command = plt.goldenPromise,
    },

    ui = {
      fg = plt.etherealWhite,
      fg_dim = plt.wingsOfDawn,
      fg_dimmer = plt.angelFeather,
      fg_dark = plt.celestialGlow,
      fg_reverse = plt.abyssBlue,

      bg_m4 = plt.deepHope,
      bg_m3 = plt.cosmicBlue,
      bg_m2 = plt.abyssBlue,
      bg_m1 = plt.voidWhite,
      bg_dim = plt.voidWhite,
      bg = plt.voidWhite,
      bg_p1 = plt.deepHope,
      bg_p2 = plt.cosmicBlue,
      bg_gutter = opts.gutter and plt.cosmicBlue or "none",
      bg_cursorline = plt.cosmicBlue,
      bg_cursorline_alt = plt.deepHope,
      bg_search = plt.miracleFlame,
      bg_visual = plt.skyfireCyan,
      bg_statusline = plt.cosmicBlue,

      border = plt.hopeCore,
      header1 = plt.hopeCore,
      header2 = plt.divineAzure,
      special = plt.sapphireTear,
      nontext = plt.abyssBlue,
      whitespace = plt.deepHope,
      win_separator = plt.hopeCore,
      indent = plt.abyssBlue,
      indent_scope = plt.celestialGlow,
      picker = plt.brokenChains,
      yank = plt.auroraVein,
      mark = plt.goldenPromise,
      scrollbar = plt.cosmicBlue,

      tabline = {
        bg = plt.voidWhite,
        fg_selected = plt.hopeCore,
        bg_selected = plt.cosmicBlue,
        fg_inactive = plt.angelFeather,
        bg_inactive = plt.voidWhite,
        fg_alternate = plt.brokenChains,
        bg_alternate = plt.voidWhite,
        indicator = plt.divineAzure,
      },

      pmenu = {
        fg = plt.etherealWhite,
        fg_sel = plt.etherealWhite,
        fg_border = plt.hopeCore,
        bg_border = plt.cosmicBlue,
        bg = plt.cosmicBlue,
        bg_sel = plt.deepHope,
        bg_sbar = plt.cosmicBlue,
        bg_thumb = plt.hopeCore,
      },

      float = {
        fg = plt.etherealWhite,
        bg = plt.voidWhite,
        fg_border = plt.hopeCore,
        bg_border = plt.voidWhite,
      },
    },

    accent = {
      accent1 = plt.hopeCore,
      accent2 = plt.divineAzure,
      accent3 = plt.skyfireCyan,
      accent4 = plt.miracleFlame,
      accent5 = plt.auroraVein,
      invert = plt.cosmicBlue,
    },

    rainbow = {
      rainbow1 = plt.hopeCore,
      rainbow2 = plt.divineAzure,
      rainbow3 = plt.skyfireCyan,
      rainbow4 = plt.celestialGlow,
      rainbow5 = plt.miracleFlame,
      rainbow6 = plt.auroraVein,
      rainbow7 = plt.goldenPromise,
    },

    syn = {
      attribute = plt.goldenPromise,
      boolean = plt.hopeCore,
      comment = plt.angelFeather,
      constant = plt.pureLight,
      deprecated = plt.abyssBlue,
      func = plt.divineAzure,
      identifier = plt.etherealWhite,
      keyword = plt.hopeCore,
      method = plt.skyfireCyan,
      number = plt.pureLight,
      operator = plt.miracleFlame,
      parameter = plt.wingsOfDawn,
      preproc = plt.brokenChains,
      punct = plt.angelFeather,
      regex = plt.auroraVein,
      statement = plt.hopeCore,
      string = plt.celestialGlow,
      symbol = plt.goldenPromise,
      type = plt.pureLight,
      variable = plt.etherealWhite,
      special = plt.sapphireTear,
      special2 = plt.brokenChains,
      special3 = plt.miracleFlame,
    },

    vcs = { added = plt.miracleFlame, removed = plt.abyssBlue, changed = plt.goldenPromise },
    diff = { add = plt.miracleFlame, change = plt.goldenPromise, delete = plt.abyssBlue, text = plt.divineAzure },
    diag = {
      ok = plt.hopeCore,
      error = plt.abyssBlue,
      warning = plt.brokenChains,
      info = plt.divineAzure,
      hint = plt.auroraVein,
    },

    term = {
      black = plt.voidWhite,
      red = plt.term_red,
      green = plt.miracleFlame,
      yellow = plt.goldenPromise,
      blue = plt.hopeCore,
      magenta = plt.skyfireCyan,
      cyan = plt.divineAzure,
      white = plt.pureLight,

      black_bright = color(plt.cosmicBlue):brighten(0.4):to_hex(),
      red_bright = color(plt.term_red):brighten(0.2):to_hex(),
      green_bright = color(plt.miracleFlame):brighten(0.15):to_hex(),
      yellow_bright = color(plt.goldenPromise):brighten(0.15):to_hex(),
      blue_bright = color(plt.hopeCore):brighten(0.15):to_hex(),
      magenta_bright = color(plt.skyfireCyan):brighten(0.15):to_hex(),
      cyan_bright = color(plt.divineAzure):brighten(0.15):to_hex(),
      white_bright = "#ffffff",
      indexed1 = plt.brokenChains,
      indexed2 = plt.auroraVein,
    },

    treesitter = {
      ["@comment"] = plt.angelFeather,
      ["@comment.documentation"] = plt.wingsOfDawn,
      ["@comment.error"] = plt.abyssBlue,
      ["@comment.warning"] = plt.brokenChains,
      ["@comment.todo"] = plt.goldenPromise,
      ["@comment.note"] = plt.sapphireTear,

      ["@constant"] = plt.pureLight,
      ["@constant.builtin"] = plt.pureLight,
      ["@constant.macro"] = plt.goldenPromise,

      ["@string"] = plt.celestialGlow,
      ["@string.documentation"] = plt.celestialGlow,
      ["@string.regex"] = plt.auroraVein,
      ["@string.escape"] = plt.miracleFlame,
      ["@string.special"] = plt.skyfireCyan,
      ["@string.special.symbol"] = plt.goldenPromise,
      ["@string.special.url"] = plt.divineAzure,
      ["@string.special.path"] = plt.celestialGlow,

      ["@character"] = plt.celestialGlow,
      ["@character.special"] = plt.goldenPromise,

      ["@number"] = plt.pureLight,
      ["@number.float"] = plt.pureLight,

      ["@boolean"] = plt.hopeCore,

      ["@function"] = plt.divineAzure,
      ["@function.builtin"] = plt.divineAzure,
      ["@function.call"] = plt.divineAzure,
      ["@function.macro"] = plt.brokenChains,
      ["@function.method"] = plt.skyfireCyan,
      ["@function.method.call"] = plt.skyfireCyan,

      ["@constructor"] = plt.hopeCore,

      ["@parameter"] = plt.wingsOfDawn,
      ["@parameter.builtin"] = plt.etherealWhite,

      ["@keyword"] = plt.hopeCore,
      ["@keyword.coroutine"] = plt.brokenChains,
      ["@keyword.function"] = plt.hopeCore,
      ["@keyword.operator"] = plt.miracleFlame,
      ["@keyword.return"] = plt.hopeCore,
      ["@keyword.import"] = plt.brokenChains,
      ["@keyword.storage"] = plt.hopeCore,
      ["@keyword.repeat"] = plt.hopeCore,
      ["@keyword.conditional"] = plt.hopeCore,
      ["@keyword.exception"] = plt.abyssBlue,
      ["@keyword.directive"] = plt.brokenChains,
      ["@keyword.directive.define"] = plt.brokenChains,

      ["@conditional"] = plt.hopeCore,
      ["@conditional.ternary"] = plt.hopeCore,

      ["@repeat"] = plt.hopeCore,

      ["@label"] = plt.goldenPromise,

      ["@operator"] = plt.miracleFlame,

      ["@exception"] = plt.abyssBlue,

      ["@variable"] = plt.etherealWhite,
      ["@variable.builtin"] = plt.hopeCore,
      ["@variable.parameter"] = plt.wingsOfDawn,
      ["@variable.member"] = plt.etherealWhite,

      ["@type"] = plt.pureLight,
      ["@type.builtin"] = plt.pureLight,
      ["@type.definition"] = plt.pureLight,
      ["@type.qualifier"] = plt.hopeCore,

      ["@attribute"] = plt.goldenPromise,
      ["@attribute.builtin"] = plt.goldenPromise,

      ["@property"] = plt.etherealWhite,
      ["@field"] = plt.etherealWhite,

      ["@module"] = plt.pureLight,
      ["@module.builtin"] = plt.pureLight,

      ["@namespace"] = plt.pureLight,
      ["@namespace.builtin"] = plt.pureLight,

      ["@punctuation.delimiter"] = plt.angelFeather,
      ["@punctuation.bracket"] = plt.angelFeather,
      ["@punctuation.special"] = plt.miracleFlame,

      ["@tag"] = plt.hopeCore,
      ["@tag.attribute"] = plt.goldenPromise,
      ["@tag.delimiter"] = plt.angelFeather,
      ["@tag.builtin"] = plt.hopeCore,

      ["@markup.strong"] = { fg = plt.hopeCore, bold = true },
      ["@markup.italic"] = { fg = plt.etherealWhite, italic = true },
      ["@markup.strikethrough"] = { fg = plt.abyssBlue, strikethrough = true },
      ["@markup.underline"] = { fg = plt.miracleFlame, underline = true },
      ["@markup.heading.1"] = plt.hopeCore,
      ["@markup.heading.2"] = plt.divineAzure,
      ["@markup.heading.3"] = plt.skyfireCyan,
      ["@markup.heading.4"] = plt.miracleFlame,
      ["@markup.heading.5"] = plt.auroraVein,
      ["@markup.heading.6"] = plt.goldenPromise,

      ["@markup.quote"] = plt.angelFeather,
      ["@markup.list.checked"] = plt.miracleFlame,
      ["@markup.list.unchecked"] = plt.angelFeather,

      ["@diff.plus"] = plt.miracleFlame,
      ["@diff.minus"] = plt.abyssBlue,
      ["@diff.delta"] = plt.goldenPromise,

      ["@none"] = "none",
      ["@conceal"] = plt.cosmicBlue,
      ["@spell"] = plt.etherealWhite,
      ["@nospell"] = "none",
    },

    lsp = {
      ["@lsp.type.class"] = plt.pureLight,
      ["@lsp.type.property"] = plt.wingsOfDawn,
      ["@lsp.type.function"] = plt.divineAzure,
      ["@lsp.mod.deprecated"] = { fg = plt.abyssBlue, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.pureLight,
      ["@lsp.mod.async"] = plt.hopeCore,
      ["@lsp.mod.static"] = plt.divineAzure,
      ["@lsp.mod.abstract"] = plt.pureLight,
      ["@lsp.mod.documentation"] = plt.wingsOfDawn,
    },
  }
end

return {
  name = "Emotional Entity – Adara (Hope)",
  author = "PrismPunk.nvim",
  description = "Three heads. One voice. The dragon that sings tomorrow into being. "
    .. "Hope is not gentle. Hope is absolute.",

  base16 = {
    base00 = palette.voidWhite,
    base01 = palette.abyssBlue,
    base02 = palette.deepHope,
    base03 = palette.cosmicBlue,
    base04 = palette.angelFeather,
    base05 = palette.wingsOfDawn,
    base06 = palette.etherealWhite,
    base07 = palette.pureLight,
    base08 = palette.brokenChains,
    base09 = palette.auroraVein,
    base0A = palette.goldenPromise,
    base0B = palette.miracleFlame,
    base0C = palette.divineAzure,
    base0D = palette.hopeCore,
    base0E = palette.skyfireCyan,
    base0F = palette.celestialGlow,
  },

  palette = palette,
  get = M.get,
}
