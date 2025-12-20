local color = require("prismpunk.utils.color")
local palette = require("prismpunk.palettes.dc.arkham-asylum.hush")

local M = {}

M.get = function(opts, plt)
  plt = plt or palette
  opts = opts or {}

  return {
    modes = {
      normal = plt.hushTeal,
      insert = plt.bandageIvory,
      visual = plt.hushViolet,
      replace = plt.hushRed,
      command = plt.dossierBlue,
    },

    accent = {
      accent1 = plt.hushTeal,
      accent2 = plt.hushBlue,
      accent3 = plt.hushViolet,
      accent4 = plt.bandageIvory,
      accent5 = plt.hushRed,
      invert = plt.bg_light,
    },

    rainbow = {
      rainbow1 = plt.hushTeal,
      rainbow2 = plt.hushGreen,
      rainbow3 = plt.warningAmber,
      rainbow4 = plt.hushRed,
      rainbow5 = plt.hushViolet,
      rainbow6 = plt.hushBlue,
      rainbow7 = plt.anestheticMint,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_mid,
      fg_dark = plt.fg_dark,
      fg_reverse = plt.bg_darkest,

      bg = plt.bg_darkest,
      bg_dim = plt.bg_darker,
      bg_m1 = plt.bg_darker,
      bg_m2 = plt.bg_dark,
      bg_m3 = plt.bg_mid,
      bg_m4 = plt.bg_lightest,
      bg_p1 = plt.bg_light,
      bg_p2 = plt.bg_lighter,

      bg_gutter = (opts.gutter ~= false) and plt.bg_light or "none",
      bg_cursorline = plt.bg_dark,
      bg_cursorline_alt = plt.bg_mid,
      cursorline = plt.bg_dark,
      bg_highlight = plt.bg_mid,
      bg_search = plt.operatingRoom,
      bg_visual = plt.shadowMask,
      bg_statusline = plt.bg_light,

      border = plt.shadowMask,
      header1 = plt.hushTeal,
      header2 = plt.bandageIvory,
      special = plt.warningAmber,
      nontext = plt.shadowMask,
      whitespace = plt.bg_lightest,
      win_separator = plt.shadowMask,
      indent = plt.bg_lighter,
      indent_scope = plt.dossierBlue,
      picker = plt.xrayBlue,
      yank = plt.ligatureRed,
      mark = plt.mutedAmber,
      scrollbar = plt.bg_lighter,

      selection = plt.shadowMask,
      line_nr = plt.hushGray,
      line_nr_dim = plt.surgeonSteel,
      line_nr_active = plt.fg_lightest,

      pmenu = {
        fg = plt.fg_light,
        fg_sel = plt.fg_lightest,
        fg_border = plt.shadowMask,
        bg = plt.bg_light,
        bg_sel = plt.bg_lighter,
        bg_border = plt.bg_light,
        bg_sbar = plt.bg_light,
        bg_thumb = plt.surgeonSteel,
      },

      float = {
        fg = plt.fg_light,
        bg = plt.bg_darker,
        fg_border = plt.shadowMask,
        bg_border = plt.bg_darker,
      },

      tabline = {
        bg = plt.bg_darkest,
        bg_inactive = plt.bg_darkest,
        bg_selected = plt.bg_dark,
        bg_alternate = plt.bg_darkest,
        fg_inactive = plt.fg_dark,
        fg_selected = plt.fg_lightest,
        fg_alternate = plt.hushTeal,
        indicator = plt.hushTeal,
      },
    },

    syn = {
      attribute = plt.bandageIvory,
      boolean = plt.hushRed,
      comment = plt.surgeonSteel,
      constant = plt.bandageIvory,
      deprecated = plt.shadowMask,
      func = plt.hushTeal,
      identifier = plt.fg_lightest,
      keyword = plt.dossierBlue,
      method = plt.hushTeal,
      number = plt.hushRed,
      operator = plt.hushTeal,
      parameter = plt.fg_mid,
      preproc = plt.hushViolet,
      punct = plt.fg_dark,
      regex = plt.whisperTeal,
      statement = plt.dossierBlue,
      string = plt.anestheticMint,
      symbol = plt.bandageIvory,
      type = plt.hushBlue,
      variable = plt.fg_lightest,
      special = plt.warningAmber,
      special2 = plt.hushViolet,
      special3 = plt.hushRed,
    },

    diag = {
      error = plt.dangerRed,
      warning = plt.warningAmber,
      info = plt.infoBlue,
      hint = plt.whisperTeal,
      ok = plt.successGreen,
      virtual_text_error = plt.dangerRed,
      virtual_text_warning = plt.warningAmber,
      virtual_text_info = plt.infoBlue,
      virtual_text_hint = plt.whisperTeal,
      virtual_text_ok = plt.successGreen,
    },

    diff = {
      add = plt.successGreen,
      add_inline = color(plt.successGreen):darken(0.35):to_hex(),
      change = plt.infoBlue,
      change_inline = color(plt.infoBlue):darken(0.35):to_hex(),
      delete = plt.dangerRed,
      delete_inline = color(plt.dangerRed):darken(0.35):to_hex(),
      text = plt.hushTeal,
    },

    vcs = {
      added = plt.successGreen,
      changed = plt.infoBlue,
      removed = plt.dangerRed,
    },

    term = {
      black = plt.term_black,
      red = plt.term_red,
      green = plt.term_green,
      yellow = plt.term_yellow,
      blue = plt.term_blue,
      magenta = plt.term_magenta,
      cyan = plt.term_cyan,
      white = plt.term_white,

      black_bright = plt.term_black_bright,
      red_bright = plt.term_red_bright,
      green_bright = plt.term_green_bright,
      yellow_bright = plt.term_yellow_bright,
      blue_bright = plt.term_blue_bright,
      magenta_bright = plt.term_magenta_bright,
      cyan_bright = plt.term_cyan_bright,
      white_bright = plt.term_white_bright,

      indexed1 = plt.hushRed,
      indexed2 = plt.hushTeal,
    },
  }
end

return {
  name = "Hush – Silence in Bandages",
  author = "PrismPunk.nvim",
  description = "A surgeon’s precision wrapped in lies and gauze. Cold dossiers, muted arteries, "
    .. "and the quiet hatred of a man who rebuilt his own face just to destroy a childhood friend.",

  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_dark,
    base03 = palette.shadowMask,
    base04 = palette.hushGray,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.hushRed,
    base09 = palette.warningAmber,
    base0A = palette.bandageIvory,
    base0B = palette.anestheticMint,
    base0C = palette.hushTeal,
    base0D = palette.hushBlue,
    base0E = palette.hushViolet,
    base0F = palette.mutedArtery,
  },

  palette = palette,
  get = M.get,
}
