local color = require("prismpunk.utils.color")

local palette = {
  death_void = "#000000",
  umbra_core = "#0A0A0F",
  eclipse_depth = "#111118",
  oblivion_black = "#16161E",
  umbrax_uv = "#8B00FF",
  necrotic_pulse = "#9F33FF",
  void_flare = "#B366FF",
  grave_glow = "#CC99FF",
  spectral_shine = "#E6CCFF",
  corpse_pale = "#D0D0E6",
  ash_gray = "#BBBBE0",
  bone_dust = "#A8A8D8",
  pure_death = "#FFFFFF",
  dead_blood = "#660033",
  term_red = "#FF3366",
  term_green = "#66FF88",
  term_blue = "#8866FF",

  bg_darkest = "#000000",
  fg_lightest = "#D0D0E6",
}

local M = {}

---@param opts table
---@param plt table
---@return table
M.get = function(opts, plt)
  return {
    modes = {
      normal = plt.umbrax_uv,
      insert = plt.necrotic_pulse,
      visual = plt.void_flare,
      replace = plt.dead_blood,
      command = plt.grave_glow,
    },

    ui = {
      fg = plt.corpse_pale,
      fg_dim = plt.ash_gray,
      fg_dimmer = plt.bone_dust,
      fg_dark = plt.spectral_shine,
      fg_reverse = plt.death_void,

      bg_m4 = plt.oblivion_black,
      bg_m3 = plt.eclipse_depth,
      bg_m2 = plt.umbra_core,
      bg_m1 = plt.death_void,
      bg_dim = plt.death_void,
      bg = plt.death_void,
      bg_p1 = plt.umbra_core,
      bg_p2 = plt.eclipse_depth,
      bg_gutter = opts.gutter and plt.eclipse_depth or "none",
      bg_cursorline = plt.eclipse_depth,
      bg_cursorline_alt = plt.umbra_core,
      bg_search = plt.dead_blood,
      bg_visual = plt.void_flare,
      bg_statusline = plt.eclipse_depth,

      border = plt.umbrax_uv,
      header1 = plt.umbrax_uv,
      header2 = plt.necrotic_pulse,
      special = plt.grave_glow,
      nontext = plt.umbra_core,
      whitespace = plt.oblivion_black,
      win_separator = plt.umbrax_uv,
      indent = plt.umbra_core,
      indent_scope = plt.spectral_shine,
      picker = plt.dead_blood,
      yank = plt.umbrax_uv,
      mark = plt.grave_glow,
      scrollbar = plt.eclipse_depth,

      tabline = {
        bg = plt.death_void,
        fg_selected = plt.umbrax_uv,
        bg_selected = plt.eclipse_depth,
        fg_inactive = plt.bone_dust,
        bg_inactive = plt.death_void,
        fg_alternate = plt.grave_glow,
        bg_alternate = plt.death_void,
        indicator = plt.necrotic_pulse,
      },

      pmenu = {
        fg = plt.corpse_pale,
        fg_sel = "none",
        fg_border = plt.eclipse_depth,
        bg_border = plt.eclipse_depth,
        bg = plt.eclipse_depth,
        bg_sel = plt.umbra_core,
        bg_sbar = plt.eclipse_depth,
        bg_thumb = plt.umbrax_uv,
      },

      float = {
        fg = plt.corpse_pale,
        bg = plt.umbra_core,
        fg_border = plt.eclipse_depth,
        bg_border = plt.umbra_core,
      },
    },

    accent = {
      accent1 = plt.umbrax_uv,
      accent2 = plt.necrotic_pulse,
      accent3 = plt.void_flare,
      accent4 = plt.grave_glow,
      accent5 = plt.spectral_shine,
      invert = plt.eclipse_depth,
    },

    rainbow = {
      rainbow1 = plt.umbrax_uv,
      rainbow2 = plt.necrotic_pulse,
      rainbow3 = plt.void_flare,
      rainbow4 = plt.grave_glow,
      rainbow5 = plt.spectral_shine,
      rainbow6 = plt.dead_blood,
      rainbow7 = plt.dead_blood,
    },

    syn = {
      attribute = plt.spectral_shine,
      boolean = plt.Umbrax_uv,
      comment = plt.bone_dust,
      constant = plt.pure_death,
      deprecated = plt.eclipse_depth,
      func = plt.necrotic_pulse,
      identifier = plt.corpse_pale,
      keyword = plt.umbrax_uv,
      method = plt.void_flare,
      number = plt.pure_death,
      operator = plt.dead_blood,
      parameter = plt.ash_gray,
      preproc = plt.dead_blood,
      punct = plt.bone_dust,
      regex = plt.grave_glow,
      statement = plt.umbrax_uv,
      string = plt.pure_death,
      symbol = plt.spectral_shine,
      type = plt.pure_death,
      variable = plt.corpse_pale,
      special = plt.grave_glow,
      special2 = plt.dead_blood,
      special3 = plt.void_flare,
    },

    vcs = { added = plt.spectral_shine, removed = plt.dead_blood, changed = plt.grave_glow },
    diff = { add = plt.spectral_shine, change = plt.grave_glow, delete = plt.dead_blood, text = plt.void_flare },
    diag = {
      ok = plt.grave_glow,
      error = plt.dead_blood,
      warning = plt.dead_blood,
      info = plt.void_flare,
      hint = plt.spectral_shine,
    },

    term = {
      black = plt.death_void,
      red = plt.term_red,
      green = plt.term_green,
      yellow = plt.grave_glow,
      blue = plt.term_blue,
      magenta = plt.umbrax_uv,
      cyan = plt.necrotic_pulse,
      white = plt.pure_death,

      black_bright = color(plt.death_void):brighten(0.6):to_hex(),
      red_bright = color(plt.term_red):brighten(0.2):to_hex(),
      green_bright = color(plt.term_green):brighten(0.1):to_hex(),
      yellow_bright = color(plt.grave_glow):brighten(0.15):to_hex(),
      blue_bright = color(plt.term_blue):brighten(0.25):to_hex(),
      magenta_bright = "#bb33ff",
      cyan_bright = "#cc77ff",
      white_bright = plt.pure_death,
      indexed1 = plt.dead_blood,
      indexed2 = plt.grave_glow,
    },

    treesitter = {
      ["@comment"] = plt.bone_dust,
      ["@comment.documentation"] = plt.ash_gray,
      ["@comment.error"] = plt.dead_blood,
      ["@comment.warning"] = plt.dead_blood,
      ["@comment.todo"] = plt.grave_glow,
      ["@comment.note"] = plt.void_flare,

      ["@constant"] = plt.pure_death,
      ["@constant.builtin"] = plt.pure_death,
      ["@constant.macro"] = plt.spectral_shine,

      ["@string"] = plt.pure_death,
      ["@string.regex"] = plt.grave_glow,
      ["@string.escape"] = plt.dead_blood,
      ["@string.special"] = plt.spectral_shine,

      ["@boolean"] = plt.umbrax_uv,

      ["@function"] = plt.necrotic_pulse,
      ["@function.builtin"] = plt.necrotic_pulse,
      ["@function.method"] = plt.void_flare,

      ["@constructor"] = plt.umbrax_uv,

      ["@parameter"] = plt.ash_gray,

      ["@keyword"] = plt.umbrax_uv,
      ["@keyword.operator"] = plt.dead_blood,
      ["@keyword.return"] = plt.umbrax_uv,
      ["@keyword.exception"] = plt.dead_blood,

      ["@operator"] = plt.dead_blood,
      ["@exception"] = plt.dead_blood,

      ["@variable"] = plt.corpse_pale,
      ["@variable.builtin"] = plt.umbrax_uv,

      ["@type"] = plt.pure_death,
      ["@type.qualifier"] = plt.umbrax_uv,

      ["@punctuation.delimiter"] = plt.bone_dust,
      ["@punctuation.bracket"] = plt.bone_dust,
      ["@punctuation.special"] = plt.dead_blood,

      ["@tag"] = plt.umbrax_uv,
      ["@tag.attribute"] = plt.grave_glow,

      ["@markup.strong"] = { fg = plt.umbrax_uv, bold = true },
      ["@markup.italic"] = { fg = plt.corpse_pale, italic = true },
      ["@markup.strikethrough"] = { fg = plt.eclipse_depth, strikethrough = true },
      ["@markup.underline"] = { fg = plt.dead_blood, underline = true },
      ["@markup.heading"] = plt.umbrax_uv,
      ["@markup.heading.1"] = plt.umbrax_uv,
      ["@markup.heading.2"] = plt.necrotic_pulse,
      ["@markup.heading.3"] = plt.void_flare,
      ["@markup.heading.4"] = plt.grave_glow,
      ["@markup.heading.5"] = plt.spectral_shine,
      ["@markup.heading.6"] = plt.dead_blood,

      ["@diff.plus"] = plt.spectral_shine,
      ["@diff.minus"] = plt.dead_blood,
      ["@diff.delta"] = plt.grave_glow,

      ["@lsp.mod.deprecated"] = { fg = plt.eclipse_depth, strikethrough = true },
      ["@lsp.type.unresolvedReference"] = plt.dead_blood,
    },

    lsp = {
      ["@lsp.type.class"] = plt.pure_death,
      ["@lsp.type.property"] = plt.corpse_pale,
      ["@lsp.type.decorator"] = plt.umbrax_uv,
      ["@lsp.type.selfParameter"] = plt.umbrax_uv,
      ["@lsp.mod.deprecated"] = { fg = plt.eclipse_depth, strikethrough = true },
    },
  }
end

return {
  name = "Emotional Entity – Umbrax (Death)",
  author = "PrismPunk.nvim",
  description = "The unseen Black Entity. The ultraviolet devourer that ended the White Light. "
    .. "There is no life here. Only the silence after the last heartbeat.",

  base16 = {
    base00 = palette.death_void,
    base01 = palette.umbra_core,
    base02 = palette.eclipse_depth,
    base03 = palette.oblivion_black,
    base04 = palette.bone_dust,
    base05 = palette.ash_gray,
    base06 = palette.corpse_pale,
    base07 = palette.pure_death,
    base08 = palette.dead_blood,
    base09 = palette.dead_blood,
    base0A = palette.grave_glow,
    base0B = palette.spectral_shine,
    base0C = palette.void_flare,
    base0D = palette.umbrax_uv,
    base0E = palette.necrotic_pulse,
    base0F = palette.spectral_shine,
  },

  palette = palette,
  get = M.get,
}
