local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#060509",
  bg_darker = "#0E0D12",
  bg_dark = "#16151B",
  bg_mid = "#1E1D24",
  bg_light = "#26252D",
  bg_lighter = "#2E2D36",
  bg_lightest = "#36353F",

  fg_lightest = "#F5F0FF",
  fg_light = "#DCD8E8",
  fg_mid = "#B8B0C8",
  fg_dark = "#9088A8",

  bg_alt1 = "#12111A",
  bg_alt2 = "#09080E",
  bg_alt3 = "#1A1922",
  bg_alt4 = "#0D0C14",

  willArtist = "#00E6A8",
  willCreate = "#00F5B8",
  willImagine = "#00FFC8",
  willCanvas = "#00D698",
  willSketch = "#00C088",

  imaginationGreen = "#00F0B0",
  creativeEmerald = "#00FFB8",
  visionTeal = "#00FFCC",
  conceptGreen = "#00D89E",
  dreamGreen = "#00C28C",

  artistPurple = "#B388FF",
  creativeMagenta = "#CE93D8",
  ionViolet = "#BA68C8",
  imaginePurple = "#9C7ADB",
  cosmicMauve = "#8B6FCC",

  painterBlue = "#64B5F6",
  canvasAqua = "#4FC3F7",
  sketchCyan = "#4DD0E1",
  brushBlue = "#52A9E0",
  paletteBlue = "#4798D1",

  creativeGold = "#FFD54F",
  artistAmber = "#FFCA28",
  goldenRatio = "#FFC107",
  warmGold = "#FFB300",
  sunsetGold = "#FFA000",

  spectrumOrange = "#FF9800",
  energyOrange = "#FFA726",
  warmOrange = "#FFB74D",
  glowOrange = "#FF8F00",
  brightOrange = "#FF6F00",

  ionWhite = "#FFFFFF",
  pureLight = "#F5F5F5",
  whiteEnergy = "#EEEEEE",
  lifeForce = "#E8E8E8",
  cosmicWhite = "#DDDDDD",

  torchGreen = "#00E8A0",
  legacyEmerald = "#00D890",
  dutyTeal = "#00C880",
  honorGreen = "#00B870",
  faithGreen = "#00A860",

  mangaPink = "#FF4081",
  comicRose = "#F50057",
  popMagenta = "#C51162",

  constructSpectrum1 = "#00FFB8",
  constructSpectrum2 = "#B388FF",
  constructSpectrum3 = "#64B5F6",
  constructSpectrum4 = "#FFD54F",
  constructSpectrum5 = "#FF9800",
  constructSpectrum6 = "#FF4081",

  blockRed = "#EF5350",
  errorCrimson = "#E53935",
  criticalRed = "#D32F2F",

  masterpieceGreen = "#66BB6A",
  successEmerald = "#4CAF50",
  victoryLime = "#8BC34A",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.willArtist,
      insert = plt.creativeGold,
      visual = plt.artistPurple,
      replace = plt.blockRed,
      command = plt.painterBlue,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_mid,
      fg_dark = plt.fg_dark,
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
      bg_cursorline = plt.bg_dark,
      bg_cursorline_alt = plt.bg_mid,
      bg_search = plt.creativeGold,
      bg_visual = plt.artistPurple,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.willCreate,
      header2 = plt.creativeGold,
      special = plt.constructSpectrum1,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.willArtist,
      indent = plt.bg_lighter,
      indent_scope = plt.willArtist,
      picker = plt.mangaPink,
      yank = plt.creativeGold,
      mark = plt.artistPurple,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.willCreate,
        bg_alternate = plt.bg_darkest,
        indicator = plt.willArtist,
      },
      pmenu = {
        fg = plt.fg_lightest,
        fg_sel = "none",
        fg_border = plt.bg_lighter,
        bg_border = plt.bg_light,
        bg = plt.bg_light,
        bg_sel = plt.bg_lighter,
        bg_sbar = plt.bg_light,
        bg_thumb = plt.bg_lightest,
      },
      float = {
        fg = plt.fg_light,
        bg = plt.bg_darker,
        fg_border = plt.willCanvas,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.willArtist,
      accent2 = plt.artistPurple,
      accent3 = plt.creativeGold,
      accent4 = plt.painterBlue,
      accent5 = plt.spectrumOrange,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.constructSpectrum1,
      rainbow2 = plt.constructSpectrum2,
      rainbow3 = plt.constructSpectrum3,
      rainbow4 = plt.constructSpectrum4,
      rainbow5 = plt.constructSpectrum5,
      rainbow6 = plt.constructSpectrum6,
      rainbow7 = plt.ionWhite,
    },

    syn = {
      attribute = plt.creativeGold,
      boolean = plt.willArtist,
      comment = plt.fg_dark,
      constant = plt.ionWhite,
      deprecated = plt.fg_mid,
      func = plt.painterBlue,
      identifier = plt.fg_lightest,
      keyword = plt.willArtist,
      method = plt.canvasAqua,
      number = plt.goldenRatio,
      operator = plt.constructSpectrum1,
      parameter = plt.fg_mid,
      preproc = plt.artistPurple,
      punct = plt.fg_mid,
      regex = plt.visionTeal,
      statement = plt.willArtist,
      string = plt.creativeEmerald,
      symbol = plt.creativeGold,
      type = plt.creativeGold,
      variable = plt.fg_lightest,
      special = plt.ionViolet,
      special2 = plt.mangaPink,
      special3 = plt.spectrumOrange,
    },

    vcs = {
      added = plt.creativeEmerald,
      removed = plt.blockRed,
      changed = plt.creativeGold,
    },

    diff = {
      add = plt.creativeEmerald,
      change = plt.creativeGold,
      delete = plt.blockRed,
      text = plt.painterBlue,
    },

    diag = {
      ok = plt.masterpieceGreen,
      error = plt.blockRed,
      warning = plt.spectrumOrange,
      info = plt.paletteBlue,
      hint = plt.artistPurple,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.blockRed,
      green = plt.willCreate,
      yellow = plt.creativeGold,
      blue = plt.painterBlue,
      magenta = plt.artistPurple,
      cyan = plt.constructSpectrum1,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.blockRed):brighten(0.2):to_hex(),
      green_bright = color(plt.willCreate):brighten(0.1):to_hex(),
      yellow_bright = color(plt.creativeGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.painterBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.artistPurple):brighten(0.2):to_hex(),
      cyan_bright = color(plt.constructSpectrum1):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.creativeGold,
      indexed2 = plt.artistPurple,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.blockRed,
      ["@comment.warning"] = plt.spectrumOrange,
      ["@comment.todo"] = plt.creativeGold,
      ["@comment.note"] = plt.painterBlue,

      ["@constant"] = plt.ionWhite,
      ["@constant.builtin"] = plt.ionWhite,
      ["@constant.macro"] = plt.creativeGold,

      ["@string"] = plt.creativeEmerald,
      ["@string.documentation"] = plt.creativeEmerald,
      ["@string.regex"] = plt.visionTeal,
      ["@string.escape"] = plt.creativeGold,
      ["@string.special"] = plt.imaginationGreen,
      ["@string.special.symbol"] = plt.goldenRatio,
      ["@string.special.url"] = plt.paletteBlue,
      ["@string.special.path"] = plt.creativeEmerald,

      ["@character"] = plt.creativeEmerald,
      ["@character.special"] = plt.creativeGold,

      ["@number"] = plt.goldenRatio,
      ["@number.float"] = plt.goldenRatio,

      ["@boolean"] = plt.willArtist,

      ["@function"] = plt.painterBlue,
      ["@function.builtin"] = plt.painterBlue,
      ["@function.call"] = plt.painterBlue,
      ["@function.macro"] = plt.artistPurple,
      ["@function.method"] = plt.canvasAqua,
      ["@function.method.call"] = plt.canvasAqua,

      ["@constructor"] = plt.creativeGold,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.willArtist,
      ["@keyword.coroutine"] = plt.willCreate,
      ["@keyword.function"] = plt.willArtist,
      ["@keyword.operator"] = plt.constructSpectrum1,
      ["@keyword.return"] = plt.willArtist,
      ["@keyword.import"] = plt.artistPurple,
      ["@keyword.storage"] = plt.willArtist,
      ["@keyword.repeat"] = plt.willArtist,
      ["@keyword.conditional"] = plt.willArtist,
      ["@keyword.exception"] = plt.blockRed,
      ["@keyword.directive"] = plt.artistPurple,
      ["@keyword.directive.define"] = plt.artistPurple,

      ["@conditional"] = plt.willArtist,
      ["@conditional.ternary"] = plt.willArtist,

      ["@repeat"] = plt.willArtist,

      ["@label"] = plt.willCreate,

      ["@operator"] = plt.constructSpectrum1,

      ["@exception"] = plt.blockRed,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.willImagine,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.creativeGold,
      ["@type.builtin"] = plt.creativeGold,
      ["@type.definition"] = plt.creativeGold,
      ["@type.qualifier"] = plt.willArtist,

      ["@attribute"] = plt.creativeGold,
      ["@attribute.builtin"] = plt.creativeGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.creativeGold,
      ["@module.builtin"] = plt.creativeGold,

      ["@namespace"] = plt.creativeGold,
      ["@namespace.builtin"] = plt.creativeGold,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.constructSpectrum1,

      ["@tag"] = plt.willArtist,
      ["@tag.attribute"] = plt.creativeGold,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.willArtist,

      ["@markup.strong"] = { fg = plt.willCreate, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.constructSpectrum1, underline = true },
      ["@markup.heading"] = plt.willCreate,
      ["@markup.heading.1"] = plt.willCreate,
      ["@markup.heading.2"] = plt.creativeGold,
      ["@markup.heading.3"] = plt.artistPurple,
      ["@markup.heading.4"] = plt.painterBlue,
      ["@markup.heading.5"] = plt.spectrumOrange,
      ["@markup.heading.6"] = plt.mangaPink,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.creativeGold,
      ["@markup.link"] = plt.painterBlue,
      ["@markup.link.label"] = plt.canvasAqua,
      ["@markup.link.url"] = plt.paletteBlue,
      ["@markup.raw"] = plt.creativeEmerald,
      ["@markup.raw.block"] = plt.creativeEmerald,
      ["@markup.list"] = plt.willArtist,
      ["@markup.list.checked"] = plt.masterpieceGreen,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.creativeEmerald,
      ["@diff.minus"] = plt.blockRed,
      ["@diff.delta"] = plt.creativeGold,

      ["@none"] = "none",
      ["@conceal"] = plt.artistPurple,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.creativeGold,
      ["@constructor.javascript"] = plt.creativeGold,
      ["@constructor.typescript"] = plt.creativeGold,
      ["@namespace.rust"] = plt.creativeGold,
      ["@type.qualifier.rust"] = plt.willArtist,
      ["@constant.macro.c"] = plt.ionWhite,
      ["@constant.macro.cpp"] = plt.ionWhite,
      ["@namespace.go"] = plt.creativeGold,
      ["@property.css"] = plt.canvasAqua,
      ["@type.css"] = plt.willArtist,
      ["@label.json"] = plt.creativeGold,
      ["@field.yaml"] = plt.canvasAqua,
      ["@property.toml"] = plt.canvasAqua,
      ["@function.builtin.bash"] = plt.painterBlue,
      ["@string.regexp"] = plt.visionTeal,
      ["@character.special.regex"] = plt.creativeGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.creativeGold,
      ["@lsp.type.interface"] = plt.creativeGold,
      ["@lsp.type.struct"] = plt.creativeGold,
      ["@lsp.type.enum"] = plt.creativeGold,
      ["@lsp.type.enumMember"] = plt.ionWhite,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.creativeGold,

      ["@lsp.type.macro"] = plt.creativeGold,
      ["@lsp.type.decorator"] = plt.creativeGold,

      ["@lsp.type.builtinType"] = plt.creativeGold,
      ["@lsp.type.selfParameter"] = plt.willImagine,
      ["@lsp.type.typeParameter"] = plt.creativeGold,

      ["@lsp.type.array"] = plt.creativeGold,
      ["@lsp.type.object"] = plt.creativeGold,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.ionWhite,
      ["@lsp.type.enumConstant"] = plt.ionWhite,

      ["@lsp.type.event"] = plt.creativeGold,
      ["@lsp.type.regexp"] = plt.visionTeal,
      ["@lsp.type.unresolvedReference"] = plt.creativeGold,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.ionWhite,
      ["@lsp.mod.async"] = plt.willArtist,
      ["@lsp.mod.static"] = plt.willCreate,
      ["@lsp.mod.abstract"] = plt.creativeGold,
      ["@lsp.mod.defaultLibrary"] = plt.creativeGold,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Justice League – Green Lantern (Kyle Rayner)",
  author = "PrismPunk.nvim",
  description = "Artist visionary, unlimited imagination. Creative greens, painter blues, "
    .. "Ion purples, spectrum colors. Manga-inspired, comic energy, torchbearer legacy. "
    .. "The most creative construct maker, White Lantern destiny.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.blockRed,
    base09 = palette.spectrumOrange,
    base0A = palette.creativeGold,
    base0B = palette.willCreate,
    base0C = palette.constructSpectrum1,
    base0D = palette.painterBlue,
    base0E = palette.artistPurple,
    base0F = palette.ionWhite,
  },

  palette = palette,
  get = M.get,
}
