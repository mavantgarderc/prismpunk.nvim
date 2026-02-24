local palette = {
  blackVoid = "#000000",
  deepAbyss = "#0D0F14",
  graveDepth = "#161822",
  tombStone = "#1E212B",
  boneWhite = "#C8D0E0",
  paleCorpse = "#A8B8CC",
  ashGrey = "#8895B0",
  coldFlesh = "#687588",
  deathGreen = "#00FF88",
  necroticEmerald = "#00DD77",
  reaperJade = "#00BB66",
  soulSiphon = "#00995A",
  blackBattery = "#00774A",
  finalRed = "#CC2244",
  term_red = "#FF4466",
  term_blue = "#44AAFF",
  term_magenta = "#FF66FF",

  bg_darkest = "#000000",
  fg_lightest = "#C8D0E0",
}

local M = {}

M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.deathGreen,
      insert = plt.necroticEmerald,
      visual = plt.reaperJade,
      replace = plt.finalRed,
      command = plt.blackBattery,
    },

    ui = {
      fg = plt.boneWhite,
      fg_dim = plt.paleCorpse,
      fg_dimmer = plt.ashGrey,
      fg_dark = plt.coldFlesh,
      fg_reverse = plt.blackVoid,

      bg_m4 = plt.tombStone,
      bg_m3 = plt.graveDepth,
      bg_m2 = plt.deepAbyss,
      bg_m1 = plt.blackVoid,
      bg_dim = plt.blackVoid,
      bg = plt.blackVoid,
      bg_p1 = plt.deepAbyss,
      bg_p2 = plt.graveDepth,
      bg_gutter = opts.gutter and plt.graveDepth or "none",
      bg_cursorline = plt.graveDepth,
      bg_cursorline_alt = plt.deepAbyss,
      bg_search = plt.soulSiphon,
      bg_visual = plt.reaperJade,
      bg_statusline = plt.graveDepth,

      border = plt.deathGreen,
      header1 = plt.deathGreen,
      header2 = plt.necroticEmerald,
      special = plt.blackBattery,
      nontext = plt.deepAbyss,
      whitespace = plt.tombStone,
      win_separator = plt.deathGreen,
      indent = plt.deepAbyss,
      indent_scope = plt.soulSiphon,
      picker = plt.finalRed,
      yank = plt.deathGreen,
      mark = plt.blackBattery,
      scrollbar = plt.graveDepth,

      tabline = {
        bg = plt.blackVoid,
        fg_selected = plt.deathGreen,
        bg_selected = plt.graveDepth,
        fg_inactive = plt.ashGrey,
        bg_inactive = plt.blackVoid,
        fg_alternate = plt.blackBattery,
        bg_alternate = plt.blackVoid,
        indicator = plt.necroticEmerald,
      },

      pmenu = {
        fg = plt.boneWhite,
        fg_sel = plt.boneWhite,
        fg_border = plt.deathGreen,
        bg_border = plt.graveDepth,
        bg = plt.graveDepth,
        bg_sel = plt.deepAbyss,
        bg_sbar = plt.graveDepth,
        bg_thumb = plt.deathGreen,
      },

      float = {
        fg = plt.boneWhite,
        bg = plt.blackVoid,
        fg_border = plt.deathGreen,
        bg_border = plt.blackVoid,
      },
    },

    accent = {
      accent1 = plt.deathGreen,
      accent2 = plt.necroticEmerald,
      accent3 = plt.reaperJade,
      accent4 = plt.soulSiphon,
      accent5 = plt.blackBattery,
      invert = plt.graveDepth,
    },

    rainbow = {
      rainbow1 = plt.deathGreen,
      rainbow2 = plt.necroticEmerald,
      rainbow3 = plt.reaperJade,
      rainbow4 = plt.soulSiphon,
      rainbow5 = plt.blackBattery,
      rainbow6 = plt.finalRed,
      rainbow7 = plt.finalRed,
    },

    syn = {
      attribute = plt.blackBattery,
      boolean = plt.deathGreen,
      comment = plt.coldFlesh,
      constant = plt.boneWhite,
      deprecated = plt.blackVoid,
      func = plt.necroticEmerald,
      identifier = plt.boneWhite,
      keyword = plt.deathGreen,
      method = plt.reaperJade,
      number = plt.boneWhite,
      operator = plt.finalRed,
      parameter = plt.ashGrey,
      preproc = plt.finalRed,
      punct = plt.paleCorpse,
      regex = plt.soulSiphon,
      statement = plt.deathGreen,
      string = plt.boneWhite,
      symbol = plt.blackBattery,
      type = plt.boneWhite,
      variable = plt.boneWhite,
      special = plt.soulSiphon,
      special2 = plt.finalRed,
      special3 = plt.blackBattery,
    },

    vcs = { added = plt.soulSiphon, removed = plt.finalRed, changed = plt.blackBattery },
    diff = { add = plt.soulSiphon, change = plt.blackBattery, delete = plt.finalRed, text = plt.necroticEmerald },
    diag = {
      ok = plt.blackBattery,
      error = plt.finalRed,
      warning = plt.finalRed,
      info = plt.necroticEmerald,
      hint = plt.soulSiphon,
    },

    term = {
      black = plt.blackVoid,
      red = plt.term_red,
      green = plt.deathGreen,
      yellow = plt.blackBattery,
      blue = plt.term_blue,
      magenta = plt.term_magenta,
      cyan = plt.reaperJade,
      white = plt.boneWhite,

      black_bright = "#222630",
      red_bright = "#ff6688",
      green_bright = "#44ffaa",
      yellow_bright = "#88ffaa",
      blue_bright = "#66bbff",
      magenta_bright = "#ff88ff",
      cyan_bright = "#44ffcc",
      white_bright = "#e8f0ff",
      indexed1 = plt.finalRed,
      indexed2 = plt.blackBattery,
    },

    treesitter = {
      ["@comment"] = plt.coldFlesh,
      ["@comment.documentation"] = plt.ashGrey,
      ["@comment.error"] = plt.finalRed,
      ["@comment.warning"] = plt.finalRed,
      ["@comment.todo"] = plt.blackBattery,

      ["@constant"] = plt.boneWhite,
      ["@string"] = plt.boneWhite,
      ["@string.regex"] = plt.soulSiphon,
      ["@string.escape"] = plt.finalRed,

      ["@number"] = plt.boneWhite,
      ["@boolean"] = plt.deathGreen,

      ["@function"] = plt.necroticEmerald,
      ["@function.method"] = plt.reaperJade,

      ["@keyword"] = plt.deathGreen,
      ["@keyword.operator"] = plt.finalRed,
      ["@keyword.return"] = plt.deathGreen,

      ["@variable"] = plt.boneWhite,
      ["@variable.parameter"] = plt.ashGrey,

      ["@type"] = plt.boneWhite,

      ["@punctuation.delimiter"] = plt.paleCorpse,
      ["@punctuation.bracket"] = plt.paleCorpse,

      ["@tag"] = plt.deathGreen,
      ["@tag.attribute"] = plt.blackBattery,

      ["@markup.strong"] = { fg = plt.deathGreen, bold = true },
      ["@markup.italic"] = { fg = plt.boneWhite, italic = true },
      ["@markup.strikethrough"] = { fg = plt.blackVoid, strikethrough = true },
      ["@markup.underline"] = { fg = plt.finalRed, underline = true },

      ["@markup.heading.1"] = plt.deathGreen,
      ["@markup.heading.2"] = plt.necroticEmerald,
      ["@markup.heading.3"] = plt.reaperJade,
      ["@markup.heading.4"] = plt.soulSiphon,
      ["@markup.heading.5"] = plt.blackBattery,
      ["@markup.heading.6"] = plt.finalRed,

      ["@diff.plus"] = plt.soulSiphon,
      ["@diff.minus"] = plt.finalRed,
      ["@diff.delta"] = plt.blackBattery,
    },

    lsp = {
      ["@lsp.type.class"] = plt.boneWhite,
      ["@lsp.type.property"] = plt.boneWhite,
      ["@lsp.mod.deprecated"] = { fg = plt.blackVoid, strikethrough = true },
      ["@lsp.mod.readonly"] = plt.boneWhite,
      ["@lsp.mod.documentation"] = plt.ashGrey,
    },
  }
end

return {
  name = "Emotional Entity – Nekron (Death)",
  author = "PrismPunk.nvim",
  description = "The Black. Lord of the dead. Wielder of the ultimate darkness. "
    .. "The entity that ended all life in the universe — and then brought it back wrong.",

  base16 = {
    base00 = palette.blackVoid,
    base01 = palette.deepAbyss,
    base02 = palette.graveDepth,
    base03 = palette.tombStone,
    base04 = palette.coldFlesh,
    base05 = palette.ashGrey,
    base06 = palette.paleCorpse,
    base07 = palette.boneWhite,
    base08 = palette.finalRed,
    base09 = palette.finalRed,
    base0A = palette.blackBattery,
    base0B = palette.soulSiphon,
    base0C = palette.reaperJade,
    base0D = palette.necroticEmerald,
    base0E = palette.deathGreen,
    base0F = palette.deathGreen,
  },

  palette = palette,
  get = M.get,
}
