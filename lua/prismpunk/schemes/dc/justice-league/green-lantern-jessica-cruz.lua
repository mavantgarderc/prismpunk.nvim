local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#050A0D",
  bg_darker = "#0C1316",
  bg_dark = "#141C20",
  bg_mid = "#1C252A",
  bg_light = "#242E34",
  bg_lighter = "#2C373E",
  bg_lightest = "#344048",

  fg_lightest = "#E8F5F2",
  fg_light = "#CCDDD8",
  fg_mid = "#A8BFB8",
  fg_dark = "#7A9690",

  bg_alt1 = "#0E1618",
  bg_alt2 = "#060B0E",
  bg_alt3 = "#161F24",
  bg_alt4 = "#0A1013",

  willGentle = "#4DD8A8",
  willGrowing = "#5FE0B5",
  willBlooming = "#70E8C0",
  willCalm = "#3FC896",
  willDeep = "#2FB084",

  courageGreen = "#52D4A8",
  courageTeal = "#66DDB8",
  courageLight = "#7AE6C8",
  courageStrong = "#3EBD94",
  courageSolid = "#2AA580",

  innerPeace = "#4DD4C8",
  calmTeal = "#5CDCD0",
  serenityAqua = "#6BE4D8",
  breatheTeal = "#3EC2B8",
  centerAqua = "#2FA8A0",

  hopeGlow = "#FFE082",
  hopeSpark = "#FFE699",
  warmComfort = "#FFECB3",
  gentleGold = "#FFD54F",
  softAmber = "#FFCA28",

  fearFaded = "#9FA8DA",
  anxietyCalm = "#B39DDB",
  worrySoft = "#C5CAE9",
  panicQuiet = "#8C9ECC",
  doubtSilent = "#7986B8",

  constructGentle = "#66E6C8",
  constructSoft = "#7AEFD5",
  constructLight = "#8FF5E0",
  constructCare = "#52D8B8",
  constructWarm = "#3FC0A8",

  earthGreen = "#81C784",
  forestCalm = "#66BB6A",
  leafSoft = "#9CCC65",
  mossQuiet = "#7CB342",
  groundedBrown = "#8D6E63",

  compassionPink = "#F48FB1",
  careRose = "#F06292",
  empathyMauve = "#CE93D8",

  concernRed = "#E57373",
  warningCoral = "#FF8A65",
  alertPeach = "#FFAB91",

  victoryCalm = "#81C784",
  triumphSoft = "#66BB6A",
  achieveGlow = "#A5D6A7",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.courageGreen,
      insert = plt.willGrowing,
      visual = plt.innerPeace,
      replace = plt.concernRed,
      command = plt.hopeGlow,
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
      bg_search = plt.hopeGlow,
      bg_visual = plt.innerPeace,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.willGrowing,
      header2 = plt.hopeGlow,
      special = plt.constructGentle,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.courageGreen,
      indent = plt.bg_lighter,
      indent_scope = plt.courageGreen,
      picker = plt.compassionPink,
      yank = plt.hopeGlow,
      mark = plt.innerPeace,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.willGrowing,
        bg_alternate = plt.bg_darkest,
        indicator = plt.courageGreen,
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
        fg_border = plt.courageCalm,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.courageGreen,
      accent2 = plt.willGrowing,
      accent3 = plt.hopeGlow,
      accent4 = plt.innerPeace,
      accent5 = plt.constructGentle,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.willGrowing,
      rainbow2 = plt.courageGreen,
      rainbow3 = plt.hopeGlow,
      rainbow4 = plt.innerPeace,
      rainbow5 = plt.constructGentle,
      rainbow6 = plt.compassionPink,
      rainbow7 = plt.earthGreen,
    },

    syn = {
      attribute = plt.hopeGlow,
      boolean = plt.courageGreen,
      comment = plt.fg_dark,
      constant = plt.calmTeal,
      deprecated = plt.fg_mid,
      func = plt.innerPeace,
      identifier = plt.fg_lightest,
      keyword = plt.courageGreen,
      method = plt.serenityAqua,
      number = plt.gentleGold,
      operator = plt.constructGentle,
      parameter = plt.fg_mid,
      preproc = plt.fearFaded,
      punct = plt.fg_mid,
      regex = plt.constructLight,
      statement = plt.courageGreen,
      string = plt.willGrowing,
      symbol = plt.hopeGlow,
      type = plt.hopeGlow,
      variable = plt.fg_lightest,
      special = plt.compassionPink,
      special2 = plt.constructSoft,
      special3 = plt.earthGreen,
    },

    vcs = {
      added = plt.willGrowing,
      removed = plt.concernRed,
      changed = plt.hopeGlow,
    },

    diff = {
      add = plt.willGrowing,
      change = plt.hopeGlow,
      delete = plt.concernRed,
      text = plt.innerPeace,
    },

    diag = {
      ok = plt.victoryCalm,
      error = plt.concernRed,
      warning = plt.warningCoral,
      info = plt.breatheTeal,
      hint = plt.fearFaded,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.concernRed,
      green = plt.willGrowing,
      yellow = plt.hopeGlow,
      blue = plt.innerPeace,
      magenta = plt.compassionPink,
      cyan = plt.constructGentle,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.concernRed):brighten(0.2):to_hex(),
      green_bright = color(plt.willGrowing):brighten(0.1):to_hex(),
      yellow_bright = color(plt.hopeGlow):brighten(0.2):to_hex(),
      blue_bright = color(plt.innerPeace):brighten(0.3):to_hex(),
      magenta_bright = color(plt.compassionPink):brighten(0.2):to_hex(),
      cyan_bright = color(plt.constructGentle):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.hopeGlow,
      indexed2 = plt.courageGreen,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.concernRed,
      ["@comment.warning"] = plt.warningCoral,
      ["@comment.todo"] = plt.hopeGlow,
      ["@comment.note"] = plt.innerPeace,

      ["@constant"] = plt.calmTeal,
      ["@constant.builtin"] = plt.calmTeal,
      ["@constant.macro"] = plt.hopeGlow,

      ["@string"] = plt.willGrowing,
      ["@string.documentation"] = plt.willGrowing,
      ["@string.regex"] = plt.constructLight,
      ["@string.escape"] = plt.hopeGlow,
      ["@string.special"] = plt.constructSoft,
      ["@string.special.symbol"] = plt.gentleGold,
      ["@string.special.url"] = plt.breatheTeal,
      ["@string.special.path"] = plt.willGrowing,

      ["@character"] = plt.willGrowing,
      ["@character.special"] = plt.hopeGlow,

      ["@number"] = plt.gentleGold,
      ["@number.float"] = plt.gentleGold,

      ["@boolean"] = plt.courageGreen,

      ["@function"] = plt.innerPeace,
      ["@function.builtin"] = plt.innerPeace,
      ["@function.call"] = plt.innerPeace,
      ["@function.macro"] = plt.fearFaded,
      ["@function.method"] = plt.serenityAqua,
      ["@function.method.call"] = plt.serenityAqua,

      ["@constructor"] = plt.hopeGlow,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.courageGreen,
      ["@keyword.coroutine"] = plt.courageTeal,
      ["@keyword.function"] = plt.courageGreen,
      ["@keyword.operator"] = plt.constructGentle,
      ["@keyword.return"] = plt.courageGreen,
      ["@keyword.import"] = plt.fearFaded,
      ["@keyword.storage"] = plt.courageGreen,
      ["@keyword.repeat"] = plt.courageGreen,
      ["@keyword.conditional"] = plt.courageGreen,
      ["@keyword.exception"] = plt.concernRed,
      ["@keyword.directive"] = plt.fearFaded,
      ["@keyword.directive.define"] = plt.fearFaded,

      ["@conditional"] = plt.courageGreen,
      ["@conditional.ternary"] = plt.courageGreen,

      ["@repeat"] = plt.courageGreen,

      ["@label"] = plt.courageTeal,

      ["@operator"] = plt.constructGentle,

      ["@exception"] = plt.concernRed,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.courageLight,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.hopeGlow,
      ["@type.builtin"] = plt.hopeGlow,
      ["@type.definition"] = plt.hopeGlow,
      ["@type.qualifier"] = plt.courageGreen,

      ["@attribute"] = plt.hopeGlow,
      ["@attribute.builtin"] = plt.hopeGlow,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.hopeGlow,
      ["@module.builtin"] = plt.hopeGlow,

      ["@namespace"] = plt.hopeGlow,
      ["@namespace.builtin"] = plt.hopeGlow,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.constructGentle,

      ["@tag"] = plt.courageGreen,
      ["@tag.attribute"] = plt.hopeGlow,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.courageGreen,

      ["@markup.strong"] = { fg = plt.willGrowing, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.constructGentle, underline = true },
      ["@markup.heading"] = plt.willGrowing,
      ["@markup.heading.1"] = plt.willGrowing,
      ["@markup.heading.2"] = plt.hopeGlow,
      ["@markup.heading.3"] = plt.innerPeace,
      ["@markup.heading.4"] = plt.constructGentle,
      ["@markup.heading.5"] = plt.compassionPink,
      ["@markup.heading.6"] = plt.earthGreen,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.hopeGlow,
      ["@markup.link"] = plt.innerPeace,
      ["@markup.link.label"] = plt.serenityAqua,
      ["@markup.link.url"] = plt.breatheTeal,
      ["@markup.raw"] = plt.willGrowing,
      ["@markup.raw.block"] = plt.willGrowing,
      ["@markup.list"] = plt.courageGreen,
      ["@markup.list.checked"] = plt.victoryCalm,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.willGrowing,
      ["@diff.minus"] = plt.concernRed,
      ["@diff.delta"] = plt.hopeGlow,

      ["@none"] = "none",
      ["@conceal"] = plt.fearFaded,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.hopeGlow,
      ["@constructor.javascript"] = plt.hopeGlow,
      ["@constructor.typescript"] = plt.hopeGlow,
      ["@namespace.rust"] = plt.hopeGlow,
      ["@type.qualifier.rust"] = plt.courageGreen,
      ["@constant.macro.c"] = plt.calmTeal,
      ["@constant.macro.cpp"] = plt.calmTeal,
      ["@namespace.go"] = plt.hopeGlow,
      ["@property.css"] = plt.serenityAqua,
      ["@type.css"] = plt.courageGreen,
      ["@label.json"] = plt.hopeGlow,
      ["@field.yaml"] = plt.serenityAqua,
      ["@property.toml"] = plt.serenityAqua,
      ["@function.builtin.bash"] = plt.innerPeace,
      ["@string.regexp"] = plt.constructLight,
      ["@character.special.regex"] = plt.hopeGlow,
    },

    lsp = {
      ["@lsp.type.class"] = plt.hopeGlow,
      ["@lsp.type.interface"] = plt.hopeGlow,
      ["@lsp.type.struct"] = plt.hopeGlow,
      ["@lsp.type.enum"] = plt.hopeGlow,
      ["@lsp.type.enumMember"] = plt.calmTeal,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.hopeGlow,

      ["@lsp.type.macro"] = plt.hopeGlow,
      ["@lsp.type.decorator"] = plt.hopeGlow,

      ["@lsp.type.builtinType"] = plt.hopeGlow,
      ["@lsp.type.selfParameter"] = plt.courageLight,
      ["@lsp.type.typeParameter"] = plt.hopeGlow,

      ["@lsp.type.array"] = plt.hopeGlow,
      ["@lsp.type.object"] = plt.hopeGlow,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.calmTeal,
      ["@lsp.type.enumConstant"] = plt.calmTeal,

      ["@lsp.type.event"] = plt.hopeGlow,
      ["@lsp.type.regexp"] = plt.constructLight,
      ["@lsp.type.unresolvedReference"] = plt.hopeGlow,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.calmTeal,
      ["@lsp.mod.async"] = plt.courageGreen,
      ["@lsp.mod.static"] = plt.courageTeal,
      ["@lsp.mod.abstract"] = plt.hopeGlow,
      ["@lsp.mod.defaultLibrary"] = plt.hopeGlow,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Justice League – Green Lantern (Jessica Cruz)",
  author = "PrismPunk.nvim",
  description = "Anxiety warrior, courage from fear. Gentle greens growing stronger, "
    .. "calming teals for inner peace, soft hope glows. Breathing through panic, "
    .. "fighting darkness with light. The bravest Lantern of all.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.concernRed,
    base09 = palette.gentleGold,
    base0A = palette.hopeGlow,
    base0B = palette.willGrowing,
    base0C = palette.constructGentle,
    base0D = palette.innerPeace,
    base0E = palette.compassionPink,
    base0F = palette.courageGreen,
  },

  palette = palette,
  get = M.get,
}
