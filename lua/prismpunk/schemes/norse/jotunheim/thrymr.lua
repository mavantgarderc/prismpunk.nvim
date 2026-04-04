local color = require("prismpunk.utils.color")

local palette = {
  bg_darkest = "#140a05",
  bg_darker = "#28140a",
  bg_dark = "#3c1e0f",
  bg_mid = "#502814",
  bg_light = "#643219",
  bg_lighter = "#783c1e",
  bg_lightest = "#8c4623",
  bg_alt1 = "#1e0f07",
  bg_alt2 = "#32190c",
  bg_alt3 = "#462311",
  bg_alt4 = "#5a2d16",

  fg_lightest = "#fffff5",
  fg_light = "#ffe08d",
  fg_mid = "#dcaa3f",
  fg_dark = "#b8860b",

  stolenHammer = "#ff8241",
  bridalVeil = "#ffffc1",
  giantGreed = "#b8860b",
  thorsRage = "#f0783c",
  mjolnirGleam = "#ffce73",
  feastFire = "#dc6e37",
  bridePrice = "#ca9825",
  thunderWrath = "#ff964b",
  bloodSplatter = "#c86432",
  mockeryGold = "#eebc59",
}

local M = {}

---@param opts table|nil
---@param plt table|nil
---@return table
M.get = function(opts, plt)
  plt = plt or palette
  opts = opts or {}
  return {
    modes = {
      normal = plt.stolenHammer,
      insert = plt.giantGreed,
      visual = plt.feastFire,
      replace = plt.thorsRage,
      command = plt.mjolnirGleam,
    },

    accent = {
      accent1 = plt.stolenHammer,
      accent2 = plt.giantGreed,
      accent3 = plt.feastFire,
      accent4 = plt.fg_light,
      accent5 = plt.thorsRage,
      invert = plt.bg_mid,
    },

    rainbow = {
      rainbow1 = plt.bloodSplatter,
      rainbow2 = plt.feastFire,
      rainbow3 = plt.thorsRage,
      rainbow4 = plt.stolenHammer,
      rainbow5 = plt.thunderWrath,
      rainbow6 = plt.bridePrice,
      rainbow7 = plt.giantGreed,
    },

    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_mid,
      fg_dark = plt.fg_dark,
      fg_reverse = plt.bg_darkest,

      bg = plt.bg_darkest,
      bg_dim = plt.bg_darkest,
      bg_m1 = plt.bg_darker,
      bg_m2 = plt.bg_dark,
      bg_m3 = plt.bg_mid,
      bg_m4 = plt.bg_light,
      bg_p1 = plt.bg_dark,
      bg_p2 = plt.bg_mid,

      bg_gutter = (opts.gutter ~= false) and plt.bg_light or "none",
      bg_cursorline = plt.bg_mid,
      bg_cursorline_alt = plt.bg_light,
      cursorline = plt.bg_mid,
      bg_highlight = plt.bg_light,
      bg_search = plt.feastFire,
      bg_visual = plt.bg_light,
      bg_statusline = plt.bg_light,
      border = plt.bg_alt2,

      header1 = plt.stolenHammer,
      header2 = plt.thorsRage,
      special = plt.bridalVeil,
      nontext = plt.bg_lighter,
      whitespace = plt.fg_dark,
      win_separator = plt.bloodSplatter,
      indent = plt.bg_light,
      indent_scope = plt.stolenHammer,
      picker = plt.giantGreed,
      yank = plt.feastFire,
      mark = plt.thunderWrath,
      scrollbar = plt.bg_lighter,
      selection = plt.bg_light,
      line_nr = plt.fg_mid,
      line_nr_dim = plt.bg_lighter,
      line_nr_active = plt.fg_lightest,

      float = {
        fg = plt.fg_light,
        bg = plt.bg_mid,
        fg_border = plt.fg_dark,
        bg_border = plt.bg_mid,
      },

      pmenu = {
        fg = plt.fg_lightest,
        fg_sel = "none",
        fg_border = plt.fg_dark,
        bg = plt.bg_light,
        bg_sel = plt.bg_lighter,
        bg_border = plt.bg_light,
        bg_sbar = plt.bg_light,
        bg_thumb = plt.bg_lighter,
      },

      tabline = {
        bg = plt.bg_darkest,
        bg_inactive = plt.bg_darkest,
        bg_selected = plt.bg_dark,
        bg_alternate = plt.bg_darker,
        fg_inactive = plt.fg_mid,
        fg_selected = plt.fg_lightest,
        fg_alternate = plt.stolenHammer,
        indicator = plt.thorsRage,
      },
    },

    syn = {
      attribute = plt.bridalVeil,
      boolean = plt.feastFire,
      comment = plt.fg_mid,
      constant = plt.feastFire,
      deprecated = plt.fg_dark,
      func = plt.stolenHammer,
      identifier = plt.fg_lightest,
      keyword = plt.thorsRage,
      method = plt.stolenHammer,
      number = plt.feastFire,
      operator = plt.bloodSplatter,
      parameter = plt.thunderWrath,
      preproc = plt.bridalVeil,
      punct = plt.fg_mid,
      regex = plt.mockeryGold,
      special = plt.bridalVeil,
      special2 = plt.mockeryGold,
      special3 = plt.thunderWrath,
      statement = plt.thorsRage,
      string = plt.giantGreed,
      symbol = plt.bridePrice,
      type = plt.mjolnirGleam,
      variable = plt.fg_lightest,
    },

    diag = {
      error = plt.thorsRage,
      warning = plt.feastFire,
      info = plt.stolenHammer,
      ok = plt.giantGreed,
      hint = plt.mjolnirGleam,

      virtual_text_error = plt.thorsRage,
      virtual_text_warning = plt.feastFire,
      virtual_text_info = plt.stolenHammer,
      virtual_text_ok = plt.giantGreed,
      virtual_text_hint = plt.mjolnirGleam,
    },

    diff = {
      add = plt.giantGreed,
      add_inline = plt.bridePrice,
      change = plt.feastFire,
      change_inline = plt.bloodSplatter,
      delete = plt.thorsRage,
      delete_inline = plt.stolenHammer,
      text = plt.bridalVeil,
    },

    vcs = {
      added = plt.giantGreed,
      changed = plt.feastFire,
      removed = plt.thorsRage,
    },

    term = {
      black = plt.bg_darkest,
      red = plt.thorsRage,
      green = plt.giantGreed,
      yellow = plt.mjolnirGleam,
      blue = plt.stolenHammer,
      magenta = plt.bloodSplatter,
      cyan = plt.mockeryGold,
      white = plt.fg_light,

      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color(plt.thorsRage):brighten(0.2):to_hex(),
      green_bright = color(plt.giantGreed):brighten(0.15):to_hex(),
      yellow_bright = color(plt.mjolnirGleam):brighten(0.15):to_hex(),
      blue_bright = color(plt.stolenHammer):brighten(0.15):to_hex(),
      magenta_bright = color(plt.bloodSplatter):brighten(0.2):to_hex(),
      cyan_bright = color(plt.mockeryGold):brighten(0.15):to_hex(),
      white_bright = color(plt.fg_light):brighten(0.15):to_hex(),

      indexed1 = plt.thunderWrath,
      indexed2 = plt.bridalVeil,
    },
  }
end

return {
  name = "Jötunheim – Þrymr",
  author = "PrismPunk",
  description = "Hammer thief — giant king, bridal farce, Mjolnir's ransom, Thor's "
    .. "rage. When Þrymr stole Mjolnir and demanded Freyja as bride-price, he set "
    .. "in motion the most absurd chapter of the Eddas. Thor, dressed in bridal "
    .. "gown and veil, played the blushing bride while Loki whispered excuses for "
    .. "'her' monstrous appetite. The palette burns with the colors of that fateful "
    .. "wedding feast: deep ember browns of the giant's hall, rising through fierce "
    .. "oranges of barely-contained thunder-rage, crowned with the golden gleam of "
    .. "Mjolnir itself — returned to its rightful owner in a spray of giant blood "
    .. "and shattered stone. The farce ended as all giant schemes do: in fire, fury, "
    .. "and the thunder god's laughter.",
  base16 = {
    base00 = palette.bg_darkest,
    base01 = palette.bg_darker,
    base02 = palette.bg_mid,
    base03 = palette.bg_light,
    base04 = palette.fg_dark,
    base05 = palette.fg_mid,
    base06 = palette.fg_light,
    base07 = palette.fg_lightest,
    base08 = palette.thorsRage,
    base09 = palette.feastFire,
    base0A = palette.thunderWrath,
    base0B = palette.giantGreed,
    base0C = palette.mjolnirGleam,
    base0D = palette.stolenHammer,
    base0E = palette.bloodSplatter,
    base0F = palette.mockeryGold,
  },
  palette = palette,
  get = M.get,
}
