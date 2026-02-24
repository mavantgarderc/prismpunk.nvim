local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#050407",
  bg_darker = "#0D0B0F",
  bg_dark = "#151318",
  bg_mid = "#1D1B21",
  bg_light = "#25232A",
  bg_lighter = "#2D2B33",
  bg_lightest = "#35333C",

  fg_lightest = "#F0EFF5",
  fg_light = "#D8D5E0",
  fg_mid = "#B0ADB8",
  fg_dark = "#888590",

  bg_alt1 = "#110F15",
  bg_alt2 = "#080709",
  bg_alt3 = "#191721",
  bg_alt4 = "#0E0C11",

  corpsePale = "#D8D5E0",
  deathWhite = "#E8E5F0",
  spectralSkin = "#C8C5D0",
  ghostlyPale = "#F0EDF8",
  cadaverGray = "#B8B5C0",

  voidPurple = "#8B7BA8",
  cosmicViolet = "#9B8BB8",
  judgmentViolet = "#AB9BC8",
  omnipotentPurple = "#7B6B98",
  infinityViolet = "#6B5B88",

  deathBlue = "#6B7B9B",
  finalBlue = "#7B8BAB",
  absoluteBlue = "#8B9BBB",
  tombBlue = "#5B6B8B",
  endBlue = "#4B5B7B",

  divineGold = "#C8A87B",
  judgmentGold = "#D8B88B",
  scalesGold = "#E8C89B",
  authorityGold = "#B8987B",
  holyGold = "#A8886B",

  sinCrimson = "#C87B7B",
  wrathRed = "#D88B8B",
  damnationRed = "#E89B9B",
  guiltyRed = "#B86B6B",
  hellRed = "#A85B5B",

  spectralGreen = "#7B9B8B",
  hoodGreen = "#8BAB9B",
  cloakGreen = "#9BBBAB",
  wraithGreen = "#6B8B7B",
  ghostGreen = "#5B7B6B",

  etherealGlow = "#9B8BC8",
  spiritAura = "#AB9BD8",
  phantomLight = "#BBABE8",
  hauntingGlow = "#8B7BB8",
  otherworldlyGlow = "#7B6BA8",

  limboGray = "#8B8B9B",
  purgatoryGray = "#9B9BAB",
  betweenGray = "#ABABBB",
  neutralGray = "#7B7B8B",
  shadowGray = "#6B6B7B",

  heavenLight = "#B8C8D8",
  mercyBlue = "#C8D8E8",
  redemptionLight = "#D8E8F8",
  graceBlue = "#A8B8C8",
  forgivenessLight = "#98A8B8",

  vengeanceSilver = "#A8A8B8",
  detectiveSilver = "#B8B8C8",
  corrianGray = "#C8C8D8",
  enforcerSilver = "#989BA8",
  justiceSteel = "#888B98",

  realityBend = "#9B7BC8",
  cosmicPower = "#AB8BD8",
  omnipotence = "#BB9BE8",
  godTier = "#8B6BB8",
  infinitePower = "#7B5BA8",

  unforgiven = "#D87B7B",
  evilDetected = "#C86B6B",
  noMercy = "#B85B5B",

  justiceServed = "#B8C8A8",
  balanceRestored = "#C8D8B8",
  vengeanceComplete = "#D8E8C8",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.voidPurple,
      insert = plt.divineGold,
      visual = plt.deathBlue,
      replace = plt.unforgiven,
      command = plt.corpsePale,
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
      bg_search = plt.divineGold,
      bg_visual = plt.deathBlue,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.voidPurple,
      header2 = plt.divineGold,
      special = plt.etherealGlow,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.voidPurple,
      indent = plt.bg_lighter,
      indent_scope = plt.cosmicViolet,
      picker = plt.sinCrimson,
      yank = plt.divineGold,
      mark = plt.deathBlue,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.voidPurple,
        bg_alternate = plt.bg_darkest,
        indicator = plt.etherealGlow,
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
        fg_border = plt.omnipotentPurple,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.voidPurple,
      accent2 = plt.corpsePale,
      accent3 = plt.divineGold,
      accent4 = plt.deathBlue,
      accent5 = plt.etherealGlow,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.voidPurple,
      rainbow2 = plt.corpsePale,
      rainbow3 = plt.divineGold,
      rainbow4 = plt.deathBlue,
      rainbow5 = plt.etherealGlow,
      rainbow6 = plt.sinCrimson,
      rainbow7 = plt.spectralGreen,
    },

    syn = {
      attribute = plt.divineGold,
      boolean = plt.voidPurple,
      comment = plt.fg_dark,
      constant = plt.deathWhite,
      deprecated = plt.fg_mid,
      func = plt.deathBlue,
      identifier = plt.fg_lightest,
      keyword = plt.voidPurple,
      method = plt.absoluteBlue,
      number = plt.scalesGold,
      operator = plt.etherealGlow,
      parameter = plt.fg_mid,
      preproc = plt.cosmicViolet,
      punct = plt.fg_mid,
      regex = plt.realityBend,
      statement = plt.voidPurple,
      string = plt.corpsePale,
      symbol = plt.divineGold,
      type = plt.divineGold,
      variable = plt.fg_lightest,
      special = plt.omnipotence,
      special2 = plt.spectralGreen,
      special3 = plt.heavenLight,
    },

    vcs = {
      added = plt.justiceServed,
      removed = plt.unforgiven,
      changed = plt.divineGold,
    },

    diff = {
      add = plt.justiceServed,
      change = plt.divineGold,
      delete = plt.unforgiven,
      text = plt.deathBlue,
    },

    diag = {
      ok = plt.balanceRestored,
      error = plt.unforgiven,
      warning = plt.sinCrimson,
      info = plt.heavenLight,
      hint = plt.etherealGlow,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.sinCrimson,
      green = plt.spectralGreen,
      yellow = plt.divineGold,
      blue = plt.deathBlue,
      magenta = plt.voidPurple,
      cyan = plt.corpsePale,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.sinCrimson):brighten(0.2):to_hex(),
      green_bright = color(plt.spectralGreen):brighten(0.1):to_hex(),
      yellow_bright = color(plt.divineGold):brighten(0.2):to_hex(),
      blue_bright = color(plt.deathBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.voidPurple):brighten(0.2):to_hex(),
      cyan_bright = color(plt.corpsePale):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.divineGold,
      indexed2 = plt.voidPurple,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.unforgiven,
      ["@comment.warning"] = plt.sinCrimson,
      ["@comment.todo"] = plt.divineGold,
      ["@comment.note"] = plt.heavenLight,

      ["@constant"] = plt.deathWhite,
      ["@constant.builtin"] = plt.deathWhite,
      ["@constant.macro"] = plt.divineGold,

      ["@string"] = plt.corpsePale,
      ["@string.documentation"] = plt.corpsePale,
      ["@string.regex"] = plt.realityBend,
      ["@string.escape"] = plt.divineGold,
      ["@string.special"] = plt.spectralSkin,
      ["@string.special.symbol"] = plt.scalesGold,
      ["@string.special.url"] = plt.heavenLight,
      ["@string.special.path"] = plt.corpsePale,

      ["@character"] = plt.corpsePale,
      ["@character.special"] = plt.divineGold,

      ["@number"] = plt.scalesGold,
      ["@number.float"] = plt.scalesGold,

      ["@boolean"] = plt.voidPurple,

      ["@function"] = plt.deathBlue,
      ["@function.builtin"] = plt.deathBlue,
      ["@function.call"] = plt.deathBlue,
      ["@function.macro"] = plt.cosmicViolet,
      ["@function.method"] = plt.absoluteBlue,
      ["@function.method.call"] = plt.absoluteBlue,

      ["@constructor"] = plt.divineGold,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.voidPurple,
      ["@keyword.coroutine"] = plt.cosmicViolet,
      ["@keyword.function"] = plt.voidPurple,
      ["@keyword.operator"] = plt.etherealGlow,
      ["@keyword.return"] = plt.voidPurple,
      ["@keyword.import"] = plt.cosmicViolet,
      ["@keyword.storage"] = plt.voidPurple,
      ["@keyword.repeat"] = plt.voidPurple,
      ["@keyword.conditional"] = plt.voidPurple,
      ["@keyword.exception"] = plt.unforgiven,
      ["@keyword.directive"] = plt.cosmicViolet,
      ["@keyword.directive.define"] = plt.cosmicViolet,

      ["@conditional"] = plt.voidPurple,
      ["@conditional.ternary"] = plt.voidPurple,

      ["@repeat"] = plt.voidPurple,

      ["@label"] = plt.cosmicViolet,

      ["@operator"] = plt.etherealGlow,

      ["@exception"] = plt.unforgiven,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.judgmentViolet,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.divineGold,
      ["@type.builtin"] = plt.divineGold,
      ["@type.definition"] = plt.divineGold,
      ["@type.qualifier"] = plt.voidPurple,

      ["@attribute"] = plt.divineGold,
      ["@attribute.builtin"] = plt.divineGold,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.divineGold,
      ["@module.builtin"] = plt.divineGold,

      ["@namespace"] = plt.divineGold,
      ["@namespace.builtin"] = plt.divineGold,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.etherealGlow,

      ["@tag"] = plt.voidPurple,
      ["@tag.attribute"] = plt.divineGold,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.voidPurple,

      ["@markup.strong"] = { fg = plt.voidPurple, bold = true },
      ["@markup.italic"] = { fg = plt.corpsePale, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.etherealGlow, underline = true },
      ["@markup.heading"] = plt.voidPurple,
      ["@markup.heading.1"] = plt.voidPurple,
      ["@markup.heading.2"] = plt.divineGold,
      ["@markup.heading.3"] = plt.deathBlue,
      ["@markup.heading.4"] = plt.etherealGlow,
      ["@markup.heading.5"] = plt.corpsePale,
      ["@markup.heading.6"] = plt.spectralGreen,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.divineGold,
      ["@markup.link"] = plt.deathBlue,
      ["@markup.link.label"] = plt.absoluteBlue,
      ["@markup.link.url"] = plt.heavenLight,
      ["@markup.raw"] = plt.corpsePale,
      ["@markup.raw.block"] = plt.corpsePale,
      ["@markup.list"] = plt.voidPurple,
      ["@markup.list.checked"] = plt.balanceRestored,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.justiceServed,
      ["@diff.minus"] = plt.unforgiven,
      ["@diff.delta"] = plt.divineGold,

      ["@none"] = "none",
      ["@conceal"] = plt.cosmicViolet,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.divineGold,
      ["@constructor.javascript"] = plt.divineGold,
      ["@constructor.typescript"] = plt.divineGold,
      ["@namespace.rust"] = plt.divineGold,
      ["@type.qualifier.rust"] = plt.voidPurple,
      ["@constant.macro.c"] = plt.deathWhite,
      ["@constant.macro.cpp"] = plt.deathWhite,
      ["@namespace.go"] = plt.divineGold,
      ["@property.css"] = plt.absoluteBlue,
      ["@type.css"] = plt.voidPurple,
      ["@label.json"] = plt.divineGold,
      ["@field.yaml"] = plt.absoluteBlue,
      ["@property.toml"] = plt.absoluteBlue,
      ["@function.builtin.bash"] = plt.deathBlue,
      ["@string.regexp"] = plt.realityBend,
      ["@character.special.regex"] = plt.divineGold,
    },

    lsp = {
      ["@lsp.type.class"] = plt.divineGold,
      ["@lsp.type.interface"] = plt.divineGold,
      ["@lsp.type.struct"] = plt.divineGold,
      ["@lsp.type.enum"] = plt.divineGold,
      ["@lsp.type.enumMember"] = plt.deathWhite,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.divineGold,

      ["@lsp.type.macro"] = plt.divineGold,
      ["@lsp.type.decorator"] = plt.divineGold,

      ["@lsp.type.builtinType"] = plt.divineGold,
      ["@lsp.type.selfParameter"] = plt.judgmentViolet,
      ["@lsp.type.typeParameter"] = plt.divineGold,

      ["@lsp.type.array"] = plt.divineGold,
      ["@lsp.type.object"] = plt.divineGold,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.deathWhite,
      ["@lsp.type.enumConstant"] = plt.deathWhite,

      ["@lsp.type.event"] = plt.divineGold,
      ["@lsp.type.regexp"] = plt.realityBend,
      ["@lsp.type.unresolvedReference"] = plt.divineGold,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.deathWhite,
      ["@lsp.mod.async"] = plt.voidPurple,
      ["@lsp.mod.static"] = plt.cosmicViolet,
      ["@lsp.mod.abstract"] = plt.divineGold,
      ["@lsp.mod.defaultLibrary"] = plt.divineGold,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Justice League – The Spectre",
  author = "PrismPunk.nvim",
  description = "Spirit of Vengeance, Death incarnate. Corpse pale skin, void purple judgment, "
    .. "divine gold authority, death blue finality. Jim Corrigan's ghost, cosmic omnipotence, "
    .. "sin crimson wrath. Supernatural enforcer, no mercy, absolute justice. "
    .. "Green hood minimal—this is death's realm.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.unforgiven,
    base09 = palette.sinCrimson,
    base0A = palette.divineGold,
    base0B = palette.spectralGreen,
    base0C = palette.corpsePale,
    base0D = palette.deathBlue,
    base0E = palette.voidPurple,
    base0F = palette.etherealGlow,
  },

  palette = palette,
  get = M.get,
}
