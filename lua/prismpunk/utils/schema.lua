--- PrismPunk Schema Definitions
--- Strict palette and theme structure schemas for validation
local M = {}

M.PALETTE_SCHEMA = {
  required = {
    { key = "bg_darkest", desc = "Darkest background color" },
    { key = "fg_lightest", desc = "Lightest foreground color" },
  },
  recommended = {
    { key = "bg_darker", desc = "Darker background" },
    { key = "bg_dark", desc = "Dark background" },
    { key = "bg_mid", desc = "Mid background" },
    { key = "bg_light", desc = "Light background" },
    { key = "fg_light", desc = "Light foreground" },
    { key = "fg_mid", desc = "Mid foreground" },
    { key = "fg_dark", desc = "Dark foreground" },
  },
  optional = {
    { key = "bg_lighter", desc = "Lighter background" },
    { key = "bg_lightest", desc = "Lightest background" },
    { key = "bg_alt1", desc = "Alternate background 1" },
    { key = "bg_alt2", desc = "Alternate background 2" },
    { key = "bg_alt3", desc = "Alternate background 3" },
    { key = "bg_alt4", desc = "Alternate background 4" },
  },
}

M.THEME_COLOR_SCHEMA = {
  ui = {
    required = { "fg", "bg" },
    recommended = { "fg_dim", "bg_m1", "bg_m2", "selection", "cursorline", "line_nr" },
    optional = { "fg_dimmer", "fg_dark", "fg_reverse", "bg_dim", "bg_m3", "bg_m4", "bg_p1", "bg_p2", "bg_gutter", "bg_cursorline_alt", "bg_highlight", "bg_search", "bg_visual", "bg_statusline", "border", "nontext", "whitespace", "win_separator", "indent", "indent_scope", "picker", "yank", "mark", "scrollbar" },
  },
  syn = {
    required = { "comment", "keyword", "func", "string", "type", "variable" },
    recommended = { "constant", "number", "operator", "preproc", "punct", "regex", "special", "statement", "identifier", "boolean", "attribute", "deprecated", "method", "parameter", "symbol", "special2", "special3" },
    optional = {},
  },
  diag = {
    required = { "error", "warning", "info", "hint" },
    recommended = {},
    optional = { "ok", "virtual_text_error", "virtual_text_warning", "virtual_text_info", "virtual_text_ok", "virtual_text_hint" },
  },
  term = {
    required = { "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white" },
    recommended = { "black_bright", "red_bright", "green_bright", "yellow_bright", "blue_bright", "magenta_bright", "cyan_bright", "white_bright" },
    optional = { "indexed1", "indexed2", "indexed3" },
  },
  diff = {
    required = {},
    recommended = { "add", "change", "delete" },
    optional = { "add_inline", "change_inline", "delete_inline", "text" },
  },
  vcs = {
    required = {},
    recommended = { "added", "changed", "removed" },
    optional = {},
  },
  modes = {
    required = {},
    recommended = { "normal", "insert", "visual", "replace", "command" },
    optional = {},
  },
  accent = {
    required = {},
    recommended = { "accent1", "accent2", "accent3" },
    optional = { "accent4", "accent5", "invert" },
  },
  rainbow = {
    required = {},
    recommended = {},
    optional = { "rainbow1", "rainbow2", "rainbow3", "rainbow4", "rainbow5", "rainbow6", "rainbow7" },
  },
}

M.BASE16_KEYS = {
  "base00", "base01", "base02", "base03",
  "base04", "base05", "base06", "base07",
  "base08", "base09", "base0A", "base0B",
  "base0C", "base0D", "base0E", "base0F",
}

M.BASE16_DEFINITIONS = {
  base00 = "Default Background",
  base01 = "Lighter Background (status bars)",
  base02 = "Selection Background",
  base03 = "Comments, Invisibles",
  base04 = "Dark Foreground (status bars)",
  base05 = "Default Foreground",
  base06 = "Light Foreground (not often used)",
  base07 = "Light Background (not often used)",
  base08 = "Variables, XML Tags, Markup Link Text",
  base09 = "Integers, Boolean, Constants",
  base0A = "Classes, Markup Bold, Search Text Background",
  base0B = "Strings, Markup Code, Diff Inserted",
  base0C = "Support, Regular Expressions, Escape Characters",
  base0D = "Functions, Methods, Headings",
  base0E = "Keywords, Storage, Selector, Markup Italic",
  base0F = "Deprecated, Opening/Closing Embedded Language Tags",
}

M.SECTION_DISPLAY_ORDER = { "ui", "syn", "diag", "term", "diff", "vcs", "modes", "accent", "rainbow" }

function M.get_required_keys(schema_section)
  return schema_section.required or {}
end

function M.get_recommended_keys(schema_section)
  return schema_section.recommended or {}
end

function M.get_optional_keys(schema_section)
  return schema_section.optional or {}
end

function M.get_all_keys(schema_section)
  local keys = {}
  for _, k in ipairs(schema_section.required or {}) do table.insert(keys, k) end
  for _, k in ipairs(schema_section.recommended or {}) do table.insert(keys, k) end
  for _, k in ipairs(schema_section.optional or {}) do table.insert(keys, k) end
  return keys
end

function M.is_color_key(key)
  local color_patterns = {
    "^fg_", "^bg_", "^accent", "^rainbow", "^diag_", "^syn_",
    "^term_", "^diff_", "^vcs_", "^mode", "^indexed",
    "error$", "warning$", "info$", "hint$", "ok$",
    "comment$", "keyword$", "func$", "string$", "type$", "variable$",
    "constant$", "number$", "operator$", "preproc$", "punct$", "regex$",
    "special$", "statement$", "identifier$", "boolean$", "attribute$",
    "deprecated$", "method$", "parameter$", "symbol$",
    "black$", "red$", "green$", "yellow$", "blue$", "magenta$", "cyan$", "white$",
    "add$", "change$", "delete$", "text$",
    "added$", "changed$", "removed$",
    "normal$", "insert$", "visual$", "replace$", "command$",
    "border$", "selection$", "cursorline$", "line_nr$", "scrollbar$",
    "nontext$", "whitespace$", "indent$", "picker$", "yank$", "mark$",
  }
  for _, pattern in ipairs(color_patterns) do
    if key:match(pattern) then return true end
  end
  return false
end

return M
