local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#080A10",
  bg_darker = "#0C0F17",
  bg_dark = "#0B0E14",
  bg_mid = "#12151F",
  bg_light = "#1A1E2B",
  bg_lighter = "#252937",
  bg_lightest = "#303443",

  fg_lightest = "#F0F4FF",
  fg_light = "#D8E0F0",
  fg_mid = "#B0BBC8",
  fg_dark = "#889099",

  bg_alt1 = "#0E1116",
  bg_alt2 = "#09090F",
  bg_alt3 = "#14171E",
  bg_alt4 = "#0A0C11",

  harveyNavy = "#4A6BA8",
  courtroomBlue = "#5A7BB8",
  justiceBlue = "#6A8BC8",
  dentNavy = "#3A5B98",
  lawBlue = "#5A7BB8",

  acidOrange = "#FF5533",
  scarOrange = "#FF7755",
  burnOrange = "#CC4422",
  chemicalOrange = "#DD3311",
  meltedOrange = "#EE6644",

  rageRed = "#FF2233",
  violenceRed = "#FF5566",
  splitRed = "#DD0011",
  angerRed = "#EE3344",
  furyRed = "#CC1122",

  coinSteel = "#A8C0D8",
  fateGray = "#C0D8F0",
  dualitySteel = "#90A8C0",
  decisionGray = "#A0B8D0",
  flipSteel = "#B8D0E8",

  violetChaos = "#BB66FF",
  insanityViolet = "#DD99FF",
  fracturedPurple = "#9944DD",
  madnessViolet = "#AA55EE",
  chaosViolet = "#CC77FF",

  scarBrown = "#994433",
  tissueBrown = "#BB6655",
  damagedBrown = "#773322",
  burnBrown = "#AA5544",
  fleshBrown = "#885533",

  purpleScar = "#8833AA",
  corruptedPurple = "#AA55CC",
  twistedViolet = "#663388",
  pervertedPurple = "#7744BB",
  brokenLaw = "#9955DD",

  coinSilver = "#E8E8E8",
  headsUp = "#FFFFFF",
  tailsDown = "#D0D0D0",
  coinEdge = "#999999",
  flipSilver = "#B8B8B8",

  driedBlood = "#772211",
  oldWounds = "#993322",
  traumaRed = "#661100",
  pastBlood = "#883311",
  scarredRed = "#AA4433",

  dualityGray = "#6B7A8C",
  betweenGray = "#8599AC",
  neutralGray = "#5A6978",
  balanceGray = "#798899",
  middleGray = "#7B8A9C",

  coinSuccess = "#44AA88",
  coinFailure = "#FF2233",
  fatefulOrange = "#FF5533",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.harveyNavy,
      insert = plt.acidOrange,
      visual = plt.rageRed,
      replace = plt.burnOrange,
      command = plt.coinSteel,
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
      bg_search = plt.burnOrange,
      bg_visual = plt.scarBrown,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.harveyNavy,
      header2 = plt.acidOrange,
      special = plt.purpleScar,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.coinSteel,
      indent = plt.bg_lighter,
      indent_scope = plt.harveyNavy,
      picker = plt.violetChaos,
      yank = plt.rageRed,
      mark = plt.coinSilver,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.harveyNavy,
        bg_alternate = plt.bg_darkest,
        indicator = plt.acidOrange,
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
        bg = plt.bg_mid,
        fg_border = plt.bg_lighter,
        bg_border = plt.bg_mid,
      },
    },

    accent = {
      accent1 = plt.harveyNavy,
      accent2 = plt.acidOrange,
      accent3 = plt.rageRed,
      accent4 = plt.violetChaos,
      accent5 = plt.coinSteel,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.harveyNavy,
      rainbow2 = plt.coinSteel,
      rainbow3 = plt.acidOrange,
      rainbow4 = plt.burnOrange,
      rainbow5 = plt.scarBrown,
      rainbow6 = plt.rageRed,
      rainbow7 = plt.violetChaos,
    },

    syn = {
      attribute = plt.acidOrange,
      boolean = plt.rageRed,
      comment = plt.fg_dark,
      constant = plt.coinSteel,
      deprecated = plt.fg_mid,
      func = plt.harveyNavy,
      identifier = plt.fg_lightest,
      keyword = plt.harveyNavy,
      method = plt.courtroomBlue,
      number = plt.burnOrange,
      operator = plt.acidOrange,
      parameter = plt.fg_mid,
      preproc = plt.purpleScar,
      punct = plt.fg_mid,
      regex = plt.violetChaos,
      statement = plt.harveyNavy,
      string = plt.coinSteel,
      symbol = plt.coinSilver,
      type = plt.scarBrown,
      variable = plt.fg_lightest,
      special = plt.violetChaos,
      special2 = plt.acidOrange,
      special3 = plt.rageRed,
    },

    vcs = {
      added = plt.coinSteel,
      removed = plt.rageRed,
      changed = plt.acidOrange,
    },

    diff = {
      add = plt.coinSteel,
      change = plt.violetChaos,
      delete = plt.driedBlood,
      text = plt.burnOrange,
    },

    diag = {
      ok = plt.coinSteel,
      error = plt.rageRed,
      warning = plt.acidOrange,
      info = plt.harveyNavy,
      hint = plt.purpleScar,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.rageRed,
      green = plt.coinSuccess,
      yellow = plt.acidOrange,
      blue = plt.harveyNavy,
      magenta = plt.violetChaos,
      cyan = plt.coinSteel,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.rageRed):brighten(0.2):to_hex(),
      green_bright = color(plt.coinSuccess):brighten(0.1):to_hex(),
      yellow_bright = color(plt.acidOrange):brighten(0.2):to_hex(),
      blue_bright = color(plt.harveyNavy):brighten(0.3):to_hex(),
      magenta_bright = color(plt.violetChaos):brighten(0.2):to_hex(),
      cyan_bright = color(plt.coinSteel):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.harveyNavy,
      indexed2 = plt.acidOrange,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.rageRed,
      ["@comment.warning"] = plt.acidOrange,
      ["@comment.todo"] = plt.violetChaos,
      ["@comment.note"] = plt.coinSteel,

      ["@constant"] = plt.coinSteel,
      ["@constant.builtin"] = plt.coinSteel,
      ["@constant.macro"] = plt.burnOrange,

      ["@string"] = plt.coinSteel,
      ["@string.documentation"] = plt.coinSteel,
      ["@string.regex"] = plt.violetChaos,
      ["@string.escape"] = plt.acidOrange,
      ["@string.special"] = plt.rageRed,
      ["@string.special.symbol"] = plt.coinSilver,
      ["@string.special.url"] = plt.purpleScar,
      ["@string.special.path"] = plt.coinSteel,

      ["@character"] = plt.coinSteel,
      ["@character.special"] = plt.acidOrange,

      ["@number"] = plt.burnOrange,
      ["@number.float"] = plt.burnOrange,

      ["@boolean"] = plt.rageRed,

      ["@function"] = plt.harveyNavy,
      ["@function.builtin"] = plt.harveyNavy,
      ["@function.call"] = plt.harveyNavy,
      ["@function.macro"] = plt.acidOrange,
      ["@function.method"] = plt.courtroomBlue,
      ["@function.method.call"] = plt.courtroomBlue,

      ["@constructor"] = plt.scarBrown,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.harveyNavy,
      ["@keyword.coroutine"] = plt.justiceBlue,
      ["@keyword.function"] = plt.harveyNavy,
      ["@keyword.operator"] = plt.acidOrange,
      ["@keyword.return"] = plt.harveyNavy,
      ["@keyword.import"] = plt.purpleScar,
      ["@keyword.storage"] = plt.harveyNavy,
      ["@keyword.repeat"] = plt.harveyNavy,
      ["@keyword.conditional"] = plt.harveyNavy,
      ["@keyword.exception"] = plt.rageRed,
      ["@keyword.directive"] = plt.purpleScar,
      ["@keyword.directive.define"] = plt.purpleScar,

      ["@conditional"] = plt.harveyNavy,
      ["@conditional.ternary"] = plt.harveyNavy,

      ["@repeat"] = plt.harveyNavy,

      ["@label"] = plt.justiceBlue,

      ["@operator"] = plt.acidOrange,

      ["@exception"] = plt.rageRed,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.coinSilver,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.scarBrown,
      ["@type.builtin"] = plt.scarBrown,
      ["@type.definition"] = plt.scarBrown,
      ["@type.qualifier"] = plt.harveyNavy,

      ["@attribute"] = plt.acidOrange,
      ["@attribute.builtin"] = plt.acidOrange,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.scarBrown,
      ["@module.builtin"] = plt.scarBrown,

      ["@namespace"] = plt.scarBrown,
      ["@namespace.builtin"] = plt.scarBrown,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.coinEdge,

      ["@tag"] = plt.harveyNavy,
      ["@tag.attribute"] = plt.scarBrown,
      ["@tag.delimiter"] = plt.coinEdge,
      ["@tag.builtin"] = plt.harveyNavy,

      ["@markup.strong"] = { fg = plt.harveyNavy, bold = true },
      ["@markup.italic"] = { fg = plt.coinSteel, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.acidOrange, underline = true },
      ["@markup.heading"] = plt.harveyNavy,
      ["@markup.heading.1"] = plt.harveyNavy,
      ["@markup.heading.2"] = plt.coinSteel,
      ["@markup.heading.3"] = plt.acidOrange,
      ["@markup.heading.4"] = plt.burnOrange,
      ["@markup.heading.5"] = plt.rageRed,
      ["@markup.heading.6"] = plt.violetChaos,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.acidOrange,
      ["@markup.link"] = plt.harveyNavy,
      ["@markup.link.label"] = plt.courtroomBlue,
      ["@markup.link.url"] = plt.purpleScar,
      ["@markup.raw"] = plt.coinSteel,
      ["@markup.raw.block"] = plt.coinSteel,
      ["@markup.list"] = plt.harveyNavy,
      ["@markup.list.checked"] = plt.coinSuccess,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.coinSteel,
      ["@diff.minus"] = plt.driedBlood,
      ["@diff.delta"] = plt.purpleScar,

      ["@none"] = "none",
      ["@conceal"] = plt.violetChaos,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.scarBrown,
      ["@constructor.javascript"] = plt.scarBrown,
      ["@constructor.typescript"] = plt.scarBrown,
      ["@namespace.rust"] = plt.scarBrown,
      ["@type.qualifier.rust"] = plt.harveyNavy,
      ["@constant.macro.c"] = plt.coinSteel,
      ["@constant.macro.cpp"] = plt.coinSteel,
      ["@namespace.go"] = plt.scarBrown,
      ["@property.css"] = plt.courtroomBlue,
      ["@type.css"] = plt.harveyNavy,
      ["@label.json"] = plt.scarBrown,
      ["@field.yaml"] = plt.courtroomBlue,
      ["@property.toml"] = plt.courtroomBlue,
      ["@function.builtin.bash"] = plt.harveyNavy,
      ["@string.regexp"] = plt.violetChaos,
      ["@character.special.regex"] = plt.acidOrange,
    },

    lsp = {
      ["@lsp.type.class"] = plt.scarBrown,
      ["@lsp.type.interface"] = plt.scarBrown,
      ["@lsp.type.struct"] = plt.scarBrown,
      ["@lsp.type.enum"] = plt.scarBrown,
      ["@lsp.type.enumMember"] = plt.coinSteel,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.scarBrown,

      ["@lsp.type.macro"] = plt.burnOrange,
      ["@lsp.type.decorator"] = plt.harveyNavy,

      ["@lsp.type.builtinType"] = plt.scarBrown,
      ["@lsp.type.selfParameter"] = plt.coinSilver,
      ["@lsp.type.typeParameter"] = plt.scarBrown,

      ["@lsp.type.array"] = plt.scarBrown,
      ["@lsp.type.object"] = plt.scarBrown,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.coinSteel,
      ["@lsp.type.enumConstant"] = plt.coinSteel,

      ["@lsp.type.event"] = plt.scarBrown,
      ["@lsp.type.regexp"] = plt.violetChaos,
      ["@lsp.type.unresolvedReference"] = plt.rageRed,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.coinSteel,
      ["@lsp.mod.async"] = plt.harveyNavy,
      ["@lsp.mod.static"] = plt.justiceBlue,
      ["@lsp.mod.abstract"] = plt.scarBrown,
      ["@lsp.mod.defaultLibrary"] = plt.scarBrown,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Injustice League – Two-Face",
  author = "PrismPunk.nvim",
  description = "Half pristine Harvey Dent courtroom navy, half acid-scarred Two-Face chaos. "
    .. "The coin decides—heads justice blue, tails rage red. Split personality, dual identity, "
    .. "fractured mind. Violet chaos meets steel fate. This is what happens when you lose the coin toss forever.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.rageRed,
    base09 = palette.acidOrange,
    base0A = palette.burnOrange,
    base0B = palette.coinSuccess,
    base0C = palette.coinSteel,
    base0D = palette.harveyNavy,
    base0E = palette.violetChaos,
    base0F = palette.coinSilver,
  },

  palette = palette,
  get = M.get,
}
