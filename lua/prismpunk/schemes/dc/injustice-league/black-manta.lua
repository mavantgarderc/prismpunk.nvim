local color = require("prismpunk.utils.color")

local palette = {

  bg_darkest = "#020406",
  bg_darker = "#050A0E",
  bg_dark = "#0A1016",
  bg_mid = "#0F161E",
  bg_light = "#141C26",
  bg_lighter = "#19222E",
  bg_lightest = "#1E2836",

  fg_lightest = "#D8E8F8",
  fg_light = "#C0D8E8",
  fg_mid = "#A0B8C8",
  fg_dark = "#7888A0",

  bg_alt1 = "#080E14",
  bg_alt2 = "#03060A",
  bg_alt3 = "#0D141C",
  bg_alt4 = "#060C12",

  mantaBlack = "#0A0A0F",
  armorBlack = "#121218",
  terrorBlack = "#1A1A22",
  suitBlack = "#0F0F16",
  deepBlack = "#050508",

  laserRed = "#FF3344",
  eyesRed = "#FF4455",
  visorRed = "#FF5566",
  weaponRed = "#EE2233",
  beamRed = "#DD1122",

  bloodHatred = "#CC2233",
  vendettaRed = "#DD3344",
  rageRed = "#EE4455",
  violenceRed = "#BB1122",
  wrathRed = "#AA0011",

  sonarCyan = "#44D8E8",
  detectionCyan = "#55E0F0",
  waveCyan = "#66E8F8",
  techCyan = "#33C8D8",
  systemCyan = "#22B8C8",

  oceanBlue = "#3388B8",
  deepBlue = "#4498C8",
  seaBlue = "#55A8D8",
  waterBlue = "#2278A8",
  abyssBlue = "#116898",

  pressurePurple = "#5555AA",
  depthPurple = "#6666BB",
  crushPurple = "#7777CC",
  abyssPurple = "#4444AA",
  trenchPurple = "#333399",

  armorSilver = "#9099AA",
  metalSilver = "#A0A9BA",
  platingSilver = "#B0B9CA",
  suitGray = "#8089AA",
  techSilver = "#707999",

  atlanteanTeal = "#3398A8",
  enemyTeal = "#44A8B8",
  aquaTeal = "#55B8C8",
  domainTeal = "#2288A8",
  rivalTeal = "#117898",

  torpedoOrange = "#DD6633",
  explosiveOrange = "#EE7744",
  weaponOrange = "#FF8855",
  blastOrange = "#CC5522",
  detonateOrange = "#BB4411",

  darkTech = "#445566",
  systemDark = "#556677",
  advancedGray = "#667788",
  underwaterTech = "#334455",
  depthTech = "#223344",

  bioGlow = "#88DDFF",
  deepGlow = "#99EEFF",
  abyssGlow = "#AAFFFF",
  seaGlow = "#77CCEE",
  trenchGlow = "#66BBDD",

  mantaRay = "#223344",
  predatorGray = "#334455",
  hunterBlack = "#1A2233",
  stingRay = "#2A3B4C",
  glideBlack = "#0F1A22",

  helmetGlow = "#FF6677",
  menaceRed = "#FF7788",
  glowRed = "#FF8899",
  illuminateRed = "#EE5566",
  radiateRed = "#DD4455",

  torpedoLock = "#FF3344",
  enemyDetected = "#EE2233",
  targetLocked = "#DD1122",

  aquamanDefeated = "#44D8E8",
  missionComplete = "#55E0F0",
  targetDestroyed = "#66E8F8",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.laserRed,
      insert = plt.sonarCyan,
      visual = plt.oceanBlue,
      replace = plt.torpedoLock,
      command = plt.armorSilver,
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
      bg_search = plt.torpedoOrange,
      bg_visual = plt.oceanBlue,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.laserRed,
      header2 = plt.sonarCyan,
      special = plt.bioGlow,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.armorSilver,
      indent = plt.bg_lighter,
      indent_scope = plt.laserRed,
      picker = plt.pressurePurple,
      yank = plt.torpedoOrange,
      mark = plt.sonarCyan,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.laserRed,
        bg_alternate = plt.bg_darkest,
        indicator = plt.sonarCyan,
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
        fg_border = plt.armorBlack,
        bg_border = plt.bg_darker,
      },
    },

    accent = {
      accent1 = plt.laserRed,
      accent2 = plt.sonarCyan,
      accent3 = plt.oceanBlue,
      accent4 = plt.armorSilver,
      accent5 = plt.torpedoOrange,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.laserRed,
      rainbow2 = plt.sonarCyan,
      rainbow3 = plt.oceanBlue,
      rainbow4 = plt.torpedoOrange,
      rainbow5 = plt.pressurePurple,
      rainbow6 = plt.armorSilver,
      rainbow7 = plt.bioGlow,
    },

    syn = {
      attribute = plt.torpedoOrange,
      boolean = plt.laserRed,
      comment = plt.fg_dark,
      constant = plt.armorSilver,
      deprecated = plt.fg_mid,
      func = plt.oceanBlue,
      identifier = plt.fg_lightest,
      keyword = plt.laserRed,
      method = plt.deepBlue,
      number = plt.torpedoOrange,
      operator = plt.sonarCyan,
      parameter = plt.fg_mid,
      preproc = plt.pressurePurple,
      punct = plt.fg_mid,
      regex = plt.bioGlow,
      statement = plt.laserRed,
      string = plt.sonarCyan,
      symbol = plt.armorSilver,
      type = plt.torpedoOrange,
      variable = plt.fg_lightest,
      special = plt.helmetGlow,
      special2 = plt.atlanteanTeal,
      special3 = plt.darkTech,
    },

    vcs = {
      added = plt.sonarCyan,
      removed = plt.bloodHatred,
      changed = plt.torpedoOrange,
    },

    diff = {
      add = plt.sonarCyan,
      change = plt.torpedoOrange,
      delete = plt.bloodHatred,
      text = plt.oceanBlue,
    },

    diag = {
      ok = plt.missionComplete,
      error = plt.torpedoLock,
      warning = plt.torpedoOrange,
      info = plt.oceanBlue,
      hint = plt.pressurePurple,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.laserRed,
      green = plt.sonarCyan,
      yellow = plt.torpedoOrange,
      blue = plt.oceanBlue,
      magenta = plt.pressurePurple,
      cyan = plt.atlanteanTeal,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.laserRed):brighten(0.2):to_hex(),
      green_bright = color(plt.sonarCyan):brighten(0.1):to_hex(),
      yellow_bright = color(plt.torpedoOrange):brighten(0.2):to_hex(),
      blue_bright = color(plt.oceanBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.pressurePurple):brighten(0.2):to_hex(),
      cyan_bright = color(plt.atlanteanTeal):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.laserRed,
      indexed2 = plt.sonarCyan,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.torpedoLock,
      ["@comment.warning"] = plt.torpedoOrange,
      ["@comment.todo"] = plt.sonarCyan,
      ["@comment.note"] = plt.oceanBlue,

      ["@constant"] = plt.armorSilver,
      ["@constant.builtin"] = plt.armorSilver,
      ["@constant.macro"] = plt.torpedoOrange,

      ["@string"] = plt.sonarCyan,
      ["@string.documentation"] = plt.sonarCyan,
      ["@string.regex"] = plt.bioGlow,
      ["@string.escape"] = plt.torpedoOrange,
      ["@string.special"] = plt.waveCyan,
      ["@string.special.symbol"] = plt.armorSilver,
      ["@string.special.url"] = plt.atlanteanTeal,
      ["@string.special.path"] = plt.sonarCyan,

      ["@character"] = plt.sonarCyan,
      ["@character.special"] = plt.torpedoOrange,

      ["@number"] = plt.torpedoOrange,
      ["@number.float"] = plt.torpedoOrange,

      ["@boolean"] = plt.laserRed,

      ["@function"] = plt.oceanBlue,
      ["@function.builtin"] = plt.oceanBlue,
      ["@function.call"] = plt.oceanBlue,
      ["@function.macro"] = plt.pressurePurple,
      ["@function.method"] = plt.deepBlue,
      ["@function.method.call"] = plt.deepBlue,

      ["@constructor"] = plt.torpedoOrange,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.laserRed,
      ["@keyword.coroutine"] = plt.visorRed,
      ["@keyword.function"] = plt.laserRed,
      ["@keyword.operator"] = plt.sonarCyan,
      ["@keyword.return"] = plt.laserRed,
      ["@keyword.import"] = plt.pressurePurple,
      ["@keyword.storage"] = plt.laserRed,
      ["@keyword.repeat"] = plt.laserRed,
      ["@keyword.conditional"] = plt.laserRed,
      ["@keyword.exception"] = plt.torpedoLock,
      ["@keyword.directive"] = plt.pressurePurple,
      ["@keyword.directive.define"] = plt.pressurePurple,

      ["@conditional"] = plt.laserRed,
      ["@conditional.ternary"] = plt.laserRed,

      ["@repeat"] = plt.laserRed,

      ["@label"] = plt.visorRed,

      ["@operator"] = plt.sonarCyan,

      ["@exception"] = plt.torpedoLock,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.helmetGlow,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.torpedoOrange,
      ["@type.builtin"] = plt.torpedoOrange,
      ["@type.definition"] = plt.torpedoOrange,
      ["@type.qualifier"] = plt.laserRed,

      ["@attribute"] = plt.torpedoOrange,
      ["@attribute.builtin"] = plt.torpedoOrange,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.torpedoOrange,
      ["@module.builtin"] = plt.torpedoOrange,

      ["@namespace"] = plt.torpedoOrange,
      ["@namespace.builtin"] = plt.torpedoOrange,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.sonarCyan,

      ["@tag"] = plt.laserRed,
      ["@tag.attribute"] = plt.torpedoOrange,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.laserRed,

      ["@markup.strong"] = { fg = plt.laserRed, bold = true },
      ["@markup.italic"] = { fg = plt.sonarCyan, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.bioGlow, underline = true },
      ["@markup.heading"] = plt.laserRed,
      ["@markup.heading.1"] = plt.laserRed,
      ["@markup.heading.2"] = plt.sonarCyan,
      ["@markup.heading.3"] = plt.oceanBlue,
      ["@markup.heading.4"] = plt.torpedoOrange,
      ["@markup.heading.5"] = plt.pressurePurple,
      ["@markup.heading.6"] = plt.armorSilver,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.torpedoOrange,
      ["@markup.link"] = plt.oceanBlue,
      ["@markup.link.label"] = plt.deepBlue,
      ["@markup.link.url"] = plt.atlanteanTeal,
      ["@markup.raw"] = plt.sonarCyan,
      ["@markup.raw.block"] = plt.sonarCyan,
      ["@markup.list"] = plt.laserRed,
      ["@markup.list.checked"] = plt.missionComplete,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.sonarCyan,
      ["@diff.minus"] = plt.bloodHatred,
      ["@diff.delta"] = plt.torpedoOrange,

      ["@none"] = "none",
      ["@conceal"] = plt.pressurePurple,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.torpedoOrange,
      ["@constructor.javascript"] = plt.torpedoOrange,
      ["@constructor.typescript"] = plt.torpedoOrange,
      ["@namespace.rust"] = plt.torpedoOrange,
      ["@type.qualifier.rust"] = plt.laserRed,
      ["@constant.macro.c"] = plt.armorSilver,
      ["@constant.macro.cpp"] = plt.armorSilver,
      ["@namespace.go"] = plt.torpedoOrange,
      ["@property.css"] = plt.deepBlue,
      ["@type.css"] = plt.laserRed,
      ["@label.json"] = plt.torpedoOrange,
      ["@field.yaml"] = plt.deepBlue,
      ["@property.toml"] = plt.deepBlue,
      ["@function.builtin.bash"] = plt.oceanBlue,
      ["@string.regexp"] = plt.bioGlow,
      ["@character.special.regex"] = plt.torpedoOrange,
    },

    lsp = {
      ["@lsp.type.class"] = plt.torpedoOrange,
      ["@lsp.type.interface"] = plt.torpedoOrange,
      ["@lsp.type.struct"] = plt.torpedoOrange,
      ["@lsp.type.enum"] = plt.torpedoOrange,
      ["@lsp.type.enumMember"] = plt.armorSilver,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.torpedoOrange,

      ["@lsp.type.macro"] = plt.torpedoOrange,
      ["@lsp.type.decorator"] = plt.torpedoOrange,

      ["@lsp.type.builtinType"] = plt.torpedoOrange,
      ["@lsp.type.selfParameter"] = plt.helmetGlow,
      ["@lsp.type.typeParameter"] = plt.torpedoOrange,

      ["@lsp.type.array"] = plt.torpedoOrange,
      ["@lsp.type.object"] = plt.torpedoOrange,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.armorSilver,
      ["@lsp.type.enumConstant"] = plt.armorSilver,

      ["@lsp.type.event"] = plt.torpedoOrange,
      ["@lsp.type.regexp"] = plt.bioGlow,
      ["@lsp.type.unresolvedReference"] = plt.torpedoLock,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.armorSilver,
      ["@lsp.mod.async"] = plt.laserRed,
      ["@lsp.mod.static"] = plt.visorRed,
      ["@lsp.mod.abstract"] = plt.torpedoOrange,
      ["@lsp.mod.defaultLibrary"] = plt.torpedoOrange,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Injustice League – Black Manta",
  author = "PrismPunk.nvim",
  description = "Deep-sea terror, Aquaman's nemesis. Laser red helmet eyes, sonar cyan tech, "
    .. "abyssal ocean depths. High-tech underwater assassin, crushing pressure darkness, "
    .. "torpedo orange weapons. Blood hatred vendetta, armor silver plating, bioluminescent glow. "
    .. "From the black depths—death rises.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.laserRed,
    base09 = palette.torpedoOrange,
    base0A = palette.armorSilver,
    base0B = palette.sonarCyan,
    base0C = palette.atlanteanTeal,
    base0D = palette.oceanBlue,
    base0E = palette.pressurePurple,
    base0F = palette.helmetGlow,
  },

  palette = palette,
  get = M.get,
}
