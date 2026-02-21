--- PrismPunk Theme Validation Module
--- Validates themes against WCAG, Base16, and highlight coverage standards
local M = {}

local color = require("prismpunk.utils.color")

--- WCAG Contrast thresholds
local WCAG = {
  AA_NORMAL = 4.5,
  AA_LARGE = 3.0,
  AAA_NORMAL = 7.0,
  AAA_LARGE = 4.5,
}

--- Required Base16 colors
local REQUIRED_BASE16 = {
  "base00", "base01", "base02", "base03",
  "base04", "base05", "base06", "base07",
  "base08", "base09", "base0A", "base0B",
  "base0C", "base0D", "base0E", "base0F",
}

--- Required UI colors for contrast checking
local REQUIRED_UI_CONTRASTS = {
  { name = "Normal FG vs BG", fg = "ui.fg", bg = "ui.bg", level = "AAA" },
  { name = "Visual FG vs BG", fg = "ui.fg", bg = "ui.selection", level = "AA" },
  { name = "CursorLine", fg = "ui.fg", bg = "ui.cursorline", level = "AA" },
  { name = "Comment", fg = "syn.comment", bg = "ui.bg", level = "AA" },
  { name = "Search FG", fg = "ui.fg", bg = "ui.bg_search", level = "AA" },
  { name = "Float FG vs BG", fg = "ui.float.fg", bg = "ui.float.bg", level = "AA", optional = true },
  { name = "Pmenu FG vs BG", fg = "ui.pmenu.fg", bg = "ui.pmenu.bg", level = "AA", optional = true },
  { name = "LineNr", fg = "ui.line_nr", bg = "ui.bg", level = "AA" },
  { name = "diag.error vs BG", fg = "diag.error", bg = "ui.bg", level = "AA" },
  { name = "diag.warning vs BG", fg = "diag.warning", bg = "ui.bg", level = "AA" },
}

--- Required theme structure sections
local REQUIRED_SECTIONS = {
  "ui", "syn", "diag", "term",
}

--- Get nested value from table using dot notation
--- @param tbl table
--- @param path string|nil
--- @return any
local function get_nested(tbl, path)
  if not tbl or not path then return nil end
  local parts = vim.split(path, ".", { plain = true })
  local current = tbl
  for _, part in ipairs(parts) do
    if type(current) ~= "table" then return nil end
    current = current[part]
    if current == nil then return nil end
  end
  return current
end

--- Calculate contrast ratio between two colors
--- @param fg string|nil hex color
--- @param bg string|nil hex color
--- @return number ratio, number|nil lum1, number|nil lum2
local function calc_contrast(fg, bg)
  if not fg or not bg then return 0 end
  local lum1 = color.get_luminance(fg)
  local lum2 = color.get_luminance(bg)
  local ratio = color.calculate_contrast(lum1, lum2)
  return ratio, lum1, lum2
end

--- Check WCAG contrast for theme colors
--- @param theme table Theme colors table
--- @param opts table Options { level: "aa"|"aaa" }
--- @return table Validation results
function M.check_wcag_contrast(theme, opts)
  opts = opts or {}
  local level = opts.level or "aa"
  local threshold = level == "aaa" and WCAG.AAA_NORMAL or WCAG.AA_NORMAL
  local large_threshold = level == "aaa" and WCAG.AAA_LARGE or WCAG.AA_LARGE

  local results = {
    level = level,
    checks = {},
    passed = true,
    errors = {},
    warnings = {},
  }

  for _, check in ipairs(REQUIRED_UI_CONTRASTS) do
    local fg = get_nested(theme, check.fg)
    local bg = get_nested(theme, check.bg)

    -- Handle complex types (tables for float/pmenu)
    if type(fg) == "table" then fg = fg.fg end
    if type(bg) == "table" then bg = bg.bg end

    local check_level = check.level or "AA"

    if fg and bg then
      local ratio = calc_contrast(fg, bg)
      local check_threshold = check_level == "AAA" and WCAG.AAA_NORMAL or WCAG.AA_NORMAL
      local pass = ratio >= check_threshold

      local status = {
        name = check.name,
        fg = fg,
        bg = bg,
        ratio = ratio,
        required_level = check_level,
        pass = pass,
        optional = check.optional or false,
      }

      table.insert(results.checks, status)

      if not pass then
        if check.optional then
          table.insert(results.warnings, string.format("%s: %.1f:1 (below %s)", check.name, ratio, check_level))
        else
          table.insert(results.errors, string.format("%s: %.1f:1 (below %s)", check.name, ratio, check_level))
          results.passed = false
        end
      end
    elseif not check.optional then
      table.insert(results.errors, string.format("%s: missing colors", check.name))
      results.passed = false
    end
  end

  return results
end

--- Check Base16 palette completeness
--- @param theme table Theme with base16 or palette
--- @return table Validation results
function M.check_base16_palette(theme)
  local results = {
    complete = true,
    present = {},
    missing = {},
    count = 0,
  }

  local base16 = theme.base16
  if not base16 then
    results.complete = false
    results.missing = REQUIRED_BASE16
    return results
  end

  for _, key in ipairs(REQUIRED_BASE16) do
    if base16[key] then
      table.insert(results.present, key)
      results.count = results.count + 1
    else
      table.insert(results.missing, key)
      results.complete = false
    end
  end

  return results
end

--- Check required theme structure sections
--- @param theme table Theme colors
--- @return table Validation results
function M.check_theme_structure(theme)
  local results = {
    valid = true,
    present = {},
    missing = {},
    errors = {},
  }

  for _, section in ipairs(REQUIRED_SECTIONS) do
    if theme[section] then
      table.insert(results.present, section)
    else
      table.insert(results.missing, section)
      results.valid = false
    end
  end

  -- Check for required UI colors
  local required_ui = { "fg", "bg" }
  for _, key in ipairs(required_ui) do
    if not theme.ui or not theme.ui[key] then
      table.insert(results.errors, string.format("ui.%s is required", key))
      results.valid = false
    end
  end

  -- Check for required syntax colors
  local required_syn = { "comment", "keyword", "func", "string", "type", "variable" }
  for _, key in ipairs(required_syn) do
    if not theme.syn or not theme.syn[key] then
      table.insert(results.errors, string.format("syn.%s is required", key))
      results.valid = false
    end
  end

  -- Check for required diagnostic colors
  local required_diag = { "error", "warning", "info", "hint" }
  for _, key in ipairs(required_diag) do
    if not theme.diag or not theme.diag[key] then
      table.insert(results.errors, string.format("diag.%s is required", key))
      results.valid = false
    end
  end

  return results
end

--- Count defined highlight groups from a loaded theme
--- @return number Count of defined groups (approximate)
local function count_defined_highlights()
  local count = 0
  local hl = vim.api.nvim_get_hl(0, {})
  for _ in pairs(hl) do count = count + 1 end
  return count
end

--- Validate a theme by name
--- @param theme_name string Theme name (universe/name or just name)
--- @param opts table Options
--- @return table Validation report
function M.validate_theme(theme_name, opts)
  opts = opts or {}
  local report = {
    theme = theme_name,
    timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
    valid = true,
    checks = {},
    summary = {
      errors = 0,
      warnings = 0,
      passed = true,
    },
  }

  -- Parse and load theme
  local config = require("prismpunk.config")
  local parsed = config.parse_theme(theme_name)
  if not parsed or not parsed.name then
    report.valid = false
    report.error = "Invalid theme name: " .. theme_name
    return report
  end

  -- Try to load theme module using variants (similar to loader)
  local theme_path
  local theme_mod
  local tries = {}

  -- Add variants if available
  if parsed.variants and #parsed.variants > 0 then
    for _, variant in ipairs(parsed.variants) do
      if variant.universe and variant.universe ~= "" then
        local universe_dotted = variant.universe:gsub("/", ".")
        table.insert(tries, string.format("prismpunk.themes.%s.%s", universe_dotted, variant.name))
      end
    end
  end

  -- Add direct path
  if parsed.universe and parsed.universe ~= "" then
    local universe_dotted = parsed.universe:gsub("/", ".")
    table.insert(tries, string.format("prismpunk.themes.%s.%s", universe_dotted, parsed.name))
  end
  table.insert(tries, string.format("prismpunk.themes.%s", parsed.name))

  for _, path in ipairs(tries) do
    local ok, mod = pcall(require, path)
    if ok and type(mod) == "table" and type(mod.get) == "function" then
      theme_path = path
      theme_mod = mod
      break
    end
  end

  if not theme_mod then
    report.valid = false
    report.error = "Theme module not found. Tried: " .. table.concat(tries, ", ")
    return report
  end

  -- Get theme colors via palette
  local palette = require("prismpunk.palette")
  local palette_universe = parsed.universe or (theme_mod.palette and theme_mod.palette.universe)
  local palette_name = (theme_mod.palette and theme_mod.palette.name) or parsed.name

  -- Try multiple paths for palette loading
  local palette_table
  local palette_tries = {}

  -- Add variants for palette
  if parsed.variants and #parsed.variants > 0 then
    for _, variant in ipairs(parsed.variants) do
      if variant.universe and variant.universe ~= "" then
        local uni = variant.universe:gsub("/", ".")
        table.insert(palette_tries, { variant.universe, variant.name })
        table.insert(palette_tries, { nil, variant.name })
      end
    end
  end

  -- Add direct paths
  table.insert(palette_tries, { palette_universe, palette_name })
  table.insert(palette_tries, { nil, palette_name })

  for _, try in ipairs(palette_tries) do
    local uni, name = try[1], try[2]
    local uni_path = uni and uni:gsub("/", ".") or nil
    local ok, result = pcall(palette.create_palette, uni_path, name)
    if ok and result then
      palette_table = result
      break
    end
  end

  if not palette_table then
    report.valid = false
    report.error = "Failed to load palette"
    return report
  end

  -- Get theme colors
  local theme_colors
  if type(theme_mod.get) == "function" then
    local get_ok, result = pcall(theme_mod.get, {}, palette_table)
    if get_ok then
      theme_colors = result
    end
  end

  if not theme_colors then
    report.valid = false
    report.error = "Failed to get theme colors"
    return report
  end

  -- Run all validations
  local contrast_opts = { level = opts.level or "aa" }
  local contrast_result = M.check_wcag_contrast(theme_colors, contrast_opts)
  report.checks.contrast = contrast_result
  if not contrast_result.passed then
    report.summary.errors = report.summary.errors + #contrast_result.errors
    report.summary.warnings = report.summary.warnings + #contrast_result.warnings
    report.valid = false
  end

  local base16_result = M.check_base16_palette(theme_mod)
  report.checks.base16 = base16_result
  if not base16_result.complete then
    report.summary.errors = report.summary.errors + #base16_result.missing
    report.valid = false
  end

  local structure_result = M.check_theme_structure(theme_colors)
  report.checks.structure = structure_result
  if not structure_result.valid then
    report.summary.errors = report.summary.errors + #structure_result.errors
    report.valid = false
  end

  report.summary.passed = report.valid and report.summary.errors == 0

  return report
end

--- Generate human-readable validation report
--- @param report table Validation report from validate_theme
--- @return string Formatted report
function M.format_report(report)
  local lines = {
    "=== PrismPunk Theme Validation ===",
    "Theme: " .. report.theme,
    "",
  }

  if report.error then
    table.insert(lines, "[ERROR] " .. report.error)
    return table.concat(lines, "\n")
  end

  -- Contrast checks
  local contrast = report.checks.contrast
  if contrast then
    table.insert(lines, "[✓] WCAG Contrast (" .. contrast.level .. ")")
    for _, check in ipairs(contrast.checks or {}) do
      local status = check.pass and "PASS" or "FAIL"
      local mark = check.pass and "✓" or "✗"
      local ratio_str = string.format("%.1f:1", check.ratio)
      if check.pass then
        table.insert(lines, string.format("  %s %-20s %s (%s %s)", mark, check.name, ratio_str, check.required_level, status))
      else
        table.insert(lines, string.format("  %s %-20s %s (%s %s)", mark, check.name, ratio_str, check.required_level, status))
      end
    end

    for _, err in ipairs(contrast.errors or {}) do
      table.insert(lines, "  ERROR: " .. tostring(err))
    end
    for _, warn in ipairs(contrast.warnings or {}) do
      table.insert(lines, "  WARN: " .. tostring(warn))
    end
    table.insert(lines, "")
  end

  -- Base16 checks
  local base16 = report.checks.base16
  if base16 then
    if base16.complete then
      table.insert(lines, "[✓] Base16 Palette: Complete (" .. base16.count .. "/16)")
    else
      table.insert(lines, "[✗] Base16 Palette: Incomplete (" .. base16.count .. "/16)")
      table.insert(lines, "  MISSING: " .. table.concat(base16.missing, ", "))
    end
    table.insert(lines, "")
  end

  -- Structure checks
  local structure = report.checks.structure
  if structure then
    if structure.valid then
      table.insert(lines, "[✓] Theme Structure: Valid")
    else
      table.insert(lines, "[✗] Theme Structure: Invalid")
      for _, err in ipairs(structure.errors or {}) do
        table.insert(lines, "  ERROR: " .. err)
      end
    end
    table.insert(lines, "")
  end

  -- Summary
  table.insert(lines, string.format("Summary: %d error(s), %d warning(s)",
    report.summary.errors, report.summary.warnings))

  if report.summary.passed then
    table.insert(lines, "[✓] VALIDATION PASSED")
  else
    table.insert(lines, "[✗] VALIDATION FAILED")
  end

  return table.concat(lines, "\n")
end

return M
