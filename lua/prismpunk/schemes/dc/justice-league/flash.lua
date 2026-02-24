-- prismpunk/themes/dc/justice-league/flash.lua
local color = require("prismpunk.utils.color")

local palette = -- prismpunk/palettes/dc/justice-league/flash.lua
return {
  bg_darkest = "#040308", -- cosmicBlack
  bg_darker = "#0A0610", -- voidBlack
  bg_dark = "#14121A", -- starlightGray
  bg_mid = "#1B1820", -- nebulaGray
  bg_light = "#332F34", -- shadowGray
  bg_lighter = "#5A565B", -- dimGray
  bg_lightest = "#B9BFC9", -- stoneGray

  fg_lightest = "#FFFBE6", -- pulseWhite
  fg_light = "#F2F0F0", -- lightGray
  fg_mid = "#B9BFC9", -- stoneGray
  fg_dark = "#5A565B", -- dimGray

  bg_alt1 = "#0D0915",
  bg_alt2 = "#08040D",
  bg_alt3 = "#17141F",
  bg_alt4 = "#110E17",

  -- Flash: Kinetic Speed Force Personality – Loyal & Untouched
  lightningYellow = "#FFD400",
  kineticScarlet = "#FF2F3F", -- scarlet
  speedGlow = "#FFB84D",
  trailCyan = "#66FFFF",
  emberPulse = "#FF8A33", -- emberOrange
  accentRed = "#FF4466",
  accentAmber = "#FFCC66",
  accentBlue = "#66B8FF",
  dangerRed = "#FF6677",
  warningOrange = "#FFC870",
  infoBlue = "#61AFEF",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.kineticScarlet,
      insert = plt.lightningYellow,
      visual = plt.speedGlow,
      replace = plt.emberPulse,
      command = plt.accentAmber,
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
      bg_search = plt.accentBlue,
      bg_visual = plt.trailCyan,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt4,
      header1 = plt.lightningYellow,
      header2 = plt.kineticScarlet,
      special = plt.trailCyan,
      nontext = plt.bg_lighter,
      whitespace = plt.bg_lightest,
      win_separator = plt.kineticScarlet,
      indent = plt.bg_lighter,
      indent_scope = plt.kineticScarlet,
      picker = plt.speedGlow,
      yank = plt.lightningYellow,
      mark = plt.trailCyan,
      scrollbar = plt.bg_lighter,
      tabline = {
        bg = plt.bg_darkest,
        fg_selected = plt.fg_lightest,
        bg_selected = plt.bg_dark,
        fg_inactive = plt.fg_mid,
        bg_inactive = plt.bg_darkest,
        fg_alternate = plt.lightningYellow,
        bg_alternate = plt.bg_darkest,
        indicator = plt.accentAmber,
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
      accent1 = plt.lightningYellow,
      accent2 = plt.kineticScarlet,
      accent3 = plt.trailCyan,
      accent4 = plt.speedGlow,
      accent5 = plt.accentBlue,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.lightningYellow,
      rainbow2 = plt.kineticScarlet,
      rainbow3 = plt.speedGlow,
      rainbow4 = plt.trailCyan,
      rainbow5 = plt.accentBlue,
      rainbow6 = plt.emberPulse,
      rainbow7 = plt.accentAmber,
    },

    syn = {
      attribute = plt.accentAmber,
      boolean = plt.trailCyan,
      comment = plt.fg_dark,
      constant = plt.accentAmber,
      deprecated = plt.fg_mid,
      func = plt.accentBlue,
      identifier = plt.fg_lightest,
      keyword = plt.kineticScarlet,
      method = plt.speedGlow,
      number = plt.emberPulse,
      operator = plt.speedGlow,
      parameter = plt.fg_mid,
      preproc = plt.accentBlue,
      punct = plt.fg_mid,
      regex = plt.accentAmber,
      statement = plt.kineticScarlet,
      string = plt.lightningYellow,
      symbol = plt.speedGlow,
      type = plt.fg_lightest,
      variable = plt.fg_lightest,
      special = plt.accentAmber,
      special2 = plt.speedGlow,
      special3 = plt.accentBlue,
    },

    vcs = {
      added = plt.trailCyan,
      removed = plt.kineticScarlet,
      changed = plt.lightningYellow,
    },

    diff = {
      add = plt.trailCyan,
      change = plt.lightningYellow,
      delete = plt.kineticScarlet,
      text = plt.accentBlue,
    },

    diag = {
      ok = plt.trailCyan,
      error = plt.dangerRed,
      warning = plt.warningOrange,
      info = plt.infoBlue,
      hint = plt.trailCyan,
    },

    term = {
      black = plt.bg_alt3,
      red = plt.kineticScarlet,
      green = plt.trailCyan,
      yellow = plt.lightningYellow,
      blue = plt.accentBlue,
      magenta = plt.speedGlow,
      cyan = plt.trailCyan,
      white = plt.fg_light,
      black_bright = color(plt.bg_alt3):brighten(0.6):to_hex(),
      red_bright = color(plt.kineticScarlet):brighten(0.2):to_hex(),
      green_bright = color(plt.trailCyan):brighten(0.1):to_hex(),
      yellow_bright = color(plt.lightningYellow):brighten(0.2):to_hex(),
      blue_bright = color(plt.accentBlue):brighten(0.3):to_hex(),
      magenta_bright = color(plt.speedGlow):brighten(0.2):to_hex(),
      cyan_bright = color(plt.trailCyan):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.2):to_hex(),
      indexed1 = plt.lightningYellow,
      indexed2 = plt.kineticScarlet,
    },

    treesitter = {
      ["@comment"] = plt.fg_dark,
      ["@comment.documentation"] = plt.fg_mid,
      ["@comment.error"] = plt.dangerRed,
      ["@comment.warning"] = plt.warningOrange,
      ["@comment.todo"] = plt.accentBlue,
      ["@comment.note"] = plt.trailCyan,

      ["@constant"] = plt.accentAmber,
      ["@constant.builtin"] = plt.accentAmber,
      ["@constant.macro"] = plt.accentAmber,

      ["@string"] = plt.lightningYellow,
      ["@string.documentation"] = plt.lightningYellow,
      ["@string.regex"] = plt.accentAmber,
      ["@string.escape"] = plt.emberPulse,
      ["@string.special"] = plt.trailCyan,
      ["@string.special.symbol"] = plt.speedGlow,
      ["@string.special.url"] = plt.accentBlue,
      ["@string.special.path"] = plt.lightningYellow,

      ["@character"] = plt.lightningYellow,
      ["@character.special"] = plt.emberPulse,

      ["@number"] = plt.emberPulse,
      ["@number.float"] = plt.emberPulse,

      ["@boolean"] = plt.trailCyan,

      ["@function"] = plt.accentBlue,
      ["@function.builtin"] = plt.accentBlue,
      ["@function.call"] = plt.accentBlue,
      ["@function.macro"] = plt.speedGlow,
      ["@function.method"] = plt.speedGlow,
      ["@function.method.call"] = plt.speedGlow,

      ["@constructor"] = plt.fg_lightest,

      ["@parameter"] = plt.fg_mid,
      ["@parameter.builtin"] = plt.fg_light,

      ["@keyword"] = plt.kineticScarlet,
      ["@keyword.coroutine"] = plt.speedGlow,
      ["@keyword.function"] = plt.kineticScarlet,
      ["@keyword.operator"] = plt.speedGlow,
      ["@keyword.return"] = plt.kineticScarlet,
      ["@keyword.import"] = plt.accentBlue,
      ["@keyword.storage"] = plt.kineticScarlet,
      ["@keyword.repeat"] = plt.kineticScarlet,
      ["@keyword.conditional"] = plt.kineticScarlet,
      ["@keyword.exception"] = plt.kineticScarlet,
      ["@keyword.directive"] = plt.accentBlue,
      ["@keyword.directive.define"] = plt.accentBlue,

      ["@conditional"] = plt.kineticScarlet,
      ["@conditional.ternary"] = plt.kineticScarlet,

      ["@repeat"] = plt.kineticScarlet,

      ["@label"] = plt.speedGlow,

      ["@operator"] = plt.speedGlow,

      ["@exception"] = plt.kineticScarlet,

      ["@variable"] = plt.fg_lightest,
      ["@variable.builtin"] = plt.speedGlow,
      ["@variable.parameter"] = plt.fg_mid,
      ["@variable.member"] = plt.fg_light,

      ["@type"] = plt.fg_lightest,
      ["@type.builtin"] = plt.fg_lightest,
      ["@type.definition"] = plt.fg_lightest,
      ["@type.qualifier"] = plt.kineticScarlet,

      ["@attribute"] = plt.accentAmber,
      ["@attribute.builtin"] = plt.emberPulse,

      ["@property"] = plt.fg_light,

      ["@field"] = plt.fg_light,

      ["@module"] = plt.fg_lightest,
      ["@module.builtin"] = plt.fg_lightest,

      ["@namespace"] = plt.fg_lightest,
      ["@namespace.builtin"] = plt.fg_lightest,

      ["@punctuation.delimiter"] = plt.fg_mid,
      ["@punctuation.bracket"] = plt.fg_mid,
      ["@punctuation.special"] = plt.speedGlow,

      ["@tag"] = plt.kineticScarlet,
      ["@tag.attribute"] = plt.accentAmber,
      ["@tag.delimiter"] = plt.fg_mid,
      ["@tag.builtin"] = plt.kineticScarlet,

      ["@markup.strong"] = { fg = plt.lightningYellow, bold = true },
      ["@markup.italic"] = { fg = plt.fg_light, italic = true },
      ["@markup.strikethrough"] = { fg = plt.fg_dark, strikethrough = true },
      ["@markup.underline"] = { fg = plt.trailCyan, underline = true },
      ["@markup.heading"] = plt.lightningYellow,
      ["@markup.heading.1"] = plt.lightningYellow,
      ["@markup.heading.2"] = plt.emberPulse,
      ["@markup.heading.3"] = plt.kineticScarlet,
      ["@markup.heading.4"] = plt.accentBlue,
      ["@markup.heading.5"] = plt.trailCyan,
      ["@markup.heading.6"] = plt.speedGlow,
      ["@markup.quote"] = plt.fg_mid,
      ["@markup.math"] = plt.trailCyan,
      ["@markup.link"] = plt.accentBlue,
      ["@markup.link.label"] = plt.trailCyan,
      ["@markup.link.url"] = plt.accentBlue,
      ["@markup.raw"] = plt.lightningYellow,
      ["@markup.raw.block"] = plt.lightningYellow,
      ["@markup.list"] = plt.kineticScarlet,
      ["@markup.list.checked"] = plt.trailCyan,
      ["@markup.list.unchecked"] = plt.fg_mid,

      ["@diff.plus"] = plt.trailCyan,
      ["@diff.minus"] = plt.kineticScarlet,
      ["@diff.delta"] = plt.lightningYellow,

      ["@none"] = "none",
      ["@conceal"] = plt.accentBlue,
      ["@spell"] = plt.fg_lightest,
      ["@nospell"] = "none",

      ["@lsp.type.property.lua"] = plt.fg_light,
      ["@constructor.python"] = plt.fg_lightest,
      ["@constructor.javascript"] = plt.fg_lightest,
      ["@constructor.typescript"] = plt.fg_lightest,
      ["@namespace.rust"] = plt.fg_lightest,
      ["@type.qualifier.rust"] = plt.kineticScarlet,
      ["@constant.macro.c"] = plt.accentAmber,
      ["@constant.macro.cpp"] = plt.accentAmber,
      ["@namespace.go"] = plt.fg_lightest,
      ["@property.css"] = plt.accentBlue,
      ["@type.css"] = plt.kineticScarlet,
      ["@label.json"] = plt.fg_lightest,
      ["@field.yaml"] = plt.accentBlue,
      ["@property.toml"] = plt.accentBlue,
      ["@function.builtin.bash"] = plt.accentBlue,
      ["@string.regexp"] = plt.accentAmber,
      ["@character.special.regex"] = plt.emberPulse,
    },

    lsp = {
      ["@lsp.type.class"] = plt.fg_lightest,
      ["@lsp.type.interface"] = plt.fg_lightest,
      ["@lsp.type.struct"] = plt.fg_lightest,
      ["@lsp.type.enum"] = plt.fg_lightest,
      ["@lsp.type.enumMember"] = plt.lightningYellow,
      ["@lsp.type.property"] = plt.fg_light,
      ["@lsp.type.namespace"] = plt.fg_lightest,

      ["@lsp.type.macro"] = plt.accentAmber,
      ["@lsp.type.decorator"] = plt.fg_lightest,

      ["@lsp.type.builtinType"] = plt.fg_lightest,
      ["@lsp.type.selfParameter"] = plt.speedGlow,
      ["@lsp.type.typeParameter"] = plt.fg_lightest,

      ["@lsp.type.array"] = plt.fg_lightest,
      ["@lsp.type.object"] = plt.fg_lightest,
      ["@lsp.type.key"] = plt.fg_light,
      ["@lsp.type.null"] = plt.accentAmber,
      ["@lsp.type.enumConstant"] = plt.lightningYellow,

      ["@lsp.type.event"] = plt.fg_lightest,
      ["@lsp.type.regexp"] = plt.accentAmber,
      ["@lsp.type.unresolvedReference"] = plt.emberPulse,

      ["@lsp.mod.deprecated"] = { fg = plt.fg_mid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.lightningYellow,
      ["@lsp.mod.async"] = plt.kineticScarlet,
      ["@lsp.mod.static"] = plt.speedGlow,
      ["@lsp.mod.abstract"] = plt.fg_lightest,
      ["@lsp.mod.defaultLibrary"] = plt.fg_lightest,
      ["@lsp.mod.documentation"] = plt.fg_mid,
    },
  }
end

return {
  name = "Justice League – Flash",
  author = "PrismPunk.nvim",
  description = "Speed incarnate — kinetic streaks of light and heat.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.bg_mid,
    base04 = palette.bg_light,
    base05 = palette.fg_mid,
    base06 = palette.fg_lightest,
    base07 = palette.fg_light,
    base08 = palette.kineticScarlet,
    base09 = palette.emberPulse,
    base0A = palette.lightningYellow,
    base0B = palette.trailCyan,
    base0C = palette.trailCyan,
    base0D = palette.accentBlue,
    base0E = palette.speedGlow,
    base0F = palette.accentAmber,
  },

  palette = palette,
  get = M.get,
}
