--- PrismPunk Theme Validation Module
--- Validates themes against WCAG, Base16, color format, and schema standards
local M = {}

local color = require("prismpunk.utils.color")
local schema = require("prismpunk.utils.schema")

M.STRICT_HEX_PATTERN = "^#%x%x%x%x%x%x$"

local WCAG = {
  AA_NORMAL = 4.5,
  AA_LARGE = 3.0,
  AAA_NORMAL = 7.0,
  AAA_LARGE = 4.5,
}

local REQUIRED_BASE16 = schema.BASE16_KEYS

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

local REQUIRED_SECTIONS = { "ui", "syn", "diag", "term" }

-- ============================================================================
-- HEX COLOR VALIDATION
-- ============================================================================

--- Validate a hex color string against strict pattern
--- @param s any Value to validate
--- @param context string|nil Context for error messages
--- @return boolean valid, string|nil normalized, string|nil error
function M.validate_hex(s, context)
  context = context or "unknown"
  if type(s) ~= "string" then
    return false, nil, string.format("[%s] expected string, got %s", context, type(s))
  end
  if not s:match(M.STRICT_HEX_PATTERN) then
    return false, nil, string.format("[%s] invalid hex: '%s'", context, s)
  end
  return true, s:upper(), nil
end

--- Normalize a hex color (auto-fix common issues)
--- @param s any Input value
--- @return string normalized_hex, string|nil error
function M.normalize_hex(s)
  if type(s) ~= "string" then return "#000000", "expected string, got " .. type(s) end

  local hex = s:gsub("%s+", "")

  if hex:sub(1, 1) ~= "#" then hex = "#" .. hex end

  if #hex == 4 then
    hex = "#" .. hex:sub(2, 2):rep(2) .. hex:sub(3, 3):rep(2) .. hex:sub(4, 4):rep(2)
  end

  if not hex:match(M.STRICT_HEX_PATTERN) then
    return "#000000", string.format("cannot normalize: '%s'", s)
  end

  return hex:upper(), nil
end

--- Validate and optionally fix a single color value
--- @param value any Color value to validate
--- @param key string Key name for context
--- @return boolean valid, string normalized, string|nil error, boolean was_fixed
function M.validate_color_value(value, key)
  if type(value) ~= "string" then
    return false, "#000000", string.format("%s: expected string, got %s", key, type(value)), false
  end

  local valid, normalized, err = M.validate_hex(value, key)
  if valid then return true, normalized, nil, false end

  local fixed, fix_err = M.normalize_hex(value)
  if not fix_err then return true, fixed, nil, true end

  return false, "#000000", string.format("%s: %s", key, err), false
end

--- Validate all color values in a table
--- @param tbl table Table with color values
--- @param context string Context for error messages
--- @return table results { valid, errors, warnings, fixed, invalid_colors }
function M.validate_color_table(tbl, context)
  context = context or "colors"
  local results = {
    valid = true,
    errors = {},
    warnings = {},
    fixed = {},
    invalid_colors = {},
  }

  if type(tbl) ~= "table" then
    table.insert(results.errors, string.format("[%s] expected table, got %s", context, type(tbl)))
    results.valid = false
    return results
  end

  for key, value in pairs(tbl) do
    if type(value) == "string" and (value:match("^#") or schema.is_color_key(key)) then
      local valid, normalized, err, was_fixed = M.validate_color_value(value, string.format("%s.%s", context, key))
      if not valid then
        table.insert(results.errors, err)
        table.insert(results.invalid_colors, { key = key, value = value, error = err })
        results.valid = false
      elseif was_fixed then
        results.fixed[key] = normalized
        table.insert(results.warnings, string.format("%s.%s: normalized '%s' -> '%s'", context, key, value, normalized))
      end
    end
  end

  return results
end

-- ============================================================================
-- SMART DERIVATION FUNCTIONS
-- ============================================================================

local function key_matches_pattern(key, patterns)
  for _, pattern in ipairs(patterns) do
    if key:lower():match(pattern:lower()) then return true end
  end
  return false
end

local function score_derivation_key(key, derivation_type)
  local hints = schema.DERIVATION_HINTS[derivation_type]
  if not hints then return 0 end

  local score = 0
  if key_matches_pattern(key, hints.prefer_patterns) then
    score = score + 10
  end
  if key_matches_pattern(key, hints.exclude_patterns) then
    score = score - 20
  end
  return score
end

--- Smart derive bg_darkest by finding lowest luminance color in palette
--- @param palette table Palette to scan
--- @return table result { value, source_key, luminance, scored_candidates }
function M.smart_derive_bg_darkest(palette)
  local result = {
    value = "#000000",
    source_key = "default",
    luminance = 0,
    scored_candidates = {},
  }

  if type(palette) ~= "table" then return result end

  local candidates = {}

  for key, value in pairs(palette) do
    if type(value) == "string" and value:match("^#%x%x%x%x%x%x$") then
      local lum = color.get_luminance(value)
      local score = score_derivation_key(key, "darkest")

      if score >= 0 then
        table.insert(candidates, {
          key = key,
          value = value,
          luminance = lum,
          score = score,
        })
      end
    end
  end

  table.sort(candidates, function(a, b)
    if a.score ~= b.score then return a.score > b.score end
    return a.luminance < b.luminance
  end)

  result.scored_candidates = candidates

  if #candidates > 0 then
    result.value = candidates[1].value
    result.source_key = candidates[1].key
    result.luminance = candidates[1].luminance
  end

  return result
end

--- Smart derive fg_lightest by finding highest luminance color in palette
--- @param palette table Palette to scan
--- @return table result { value, source_key, luminance, scored_candidates }
function M.smart_derive_fg_lightest(palette)
  local result = {
    value = "#ffffff",
    source_key = "default",
    luminance = 1,
    scored_candidates = {},
  }

  if type(palette) ~= "table" then return result end

  local candidates = {}

  for key, value in pairs(palette) do
    if type(value) == "string" and value:match("^#%x%x%x%x%x%x$") then
      local lum = color.get_luminance(value)
      local score = score_derivation_key(key, "lightest")

      if score >= 0 then
        table.insert(candidates, {
          key = key,
          value = value,
          luminance = lum,
          score = score,
        })
      end
    end
  end

  table.sort(candidates, function(a, b)
    if a.score ~= b.score then return a.score > b.score end
    return a.luminance > b.luminance
  end)

  result.scored_candidates = candidates

  if #candidates > 0 then
    result.value = candidates[1].value
    result.source_key = candidates[1].key
    result.luminance = candidates[1].luminance
  end

  return result
end

-- ============================================================================
-- PALETTE SCHEMA VALIDATION
-- ============================================================================

--- Validate palette against schema
--- @param palette table Palette to validate
--- @return table results { valid, errors, warnings, missing_required, missing_recommended }
function M.validate_palette_schema(palette)
  local results = {
    valid = true,
    errors = {},
    warnings = {},
    missing_required = {},
    missing_recommended = {},
  }

  if type(palette) ~= "table" then
    table.insert(results.errors, "palette must be a table")
    results.valid = false
    return results
  end

  for _, item in ipairs(schema.PALETTE_SCHEMA.required) do
    if not palette[item.key] then
      table.insert(results.errors, string.format("missing required: %s (%s)", item.key, item.desc))
      table.insert(results.missing_required, item.key)
      results.valid = false
    elseif type(palette[item.key]) ~= "string" then
      table.insert(results.errors, string.format("%s must be string, got %s", item.key, type(palette[item.key])))
      results.valid = false
    else
      local valid, _, err = M.validate_hex(palette[item.key], item.key)
      if not valid then
        table.insert(results.errors, string.format("%s: %s", item.key, err))
        results.valid = false
      end
    end
  end

  for _, item in ipairs(schema.PALETTE_SCHEMA.recommended) do
    if not palette[item.key] then
      table.insert(results.warnings, string.format("missing recommended: %s (%s)", item.key, item.desc))
      table.insert(results.missing_recommended, item.key)
    end
  end

  return results
end

-- ============================================================================
-- THEME COLOR VALIDATION
-- ============================================================================

--- Deep scan all color values in theme
--- @param theme table Theme colors from get()
--- @return table results { valid, errors, warnings, invalid_colors, sections }
function M.check_color_formats(theme)
  local results = {
    valid = true,
    errors = {},
    warnings = {},
    invalid_colors = {},
    sections = {},
  }

  if type(theme) ~= "table" then
    table.insert(results.errors, "theme must be a table")
    results.valid = false
    return results
  end

  local function scan_table(tbl, path)
    if type(tbl) ~= "table" then return end
    for key, value in pairs(tbl) do
      local full_path = path and (path .. "." .. key) or key
      if type(value) == "string" then
        if value:match("^#") then
          local valid, _, err = M.validate_hex(value, full_path)
          if not valid then
            table.insert(results.errors, err)
            table.insert(results.invalid_colors, { path = full_path, value = value, error = err })
            results.valid = false
          end
        end
      elseif type(value) == "table" then
        scan_table(value, full_path)
      end
    end
  end

  scan_table(theme, nil)

  results.count = #results.errors
  return results
end

--- Validate theme color schema (required sections/keys)
--- @param theme table Theme colors from get()
--- @return table results { valid, errors, warnings, missing }
function M.check_theme_color_schema(theme)
  local results = {
    valid = true,
    errors = {},
    warnings = {},
    missing = {},
    sections = {},
  }

  if type(theme) ~= "table" then
    table.insert(results.errors, "theme must be a table")
    results.valid = false
    return results
  end

  for section_name, section_schema in pairs(schema.THEME_COLOR_SCHEMA) do
    local section_result = {
      name = section_name,
      present = false,
      missing_required = {},
      missing_recommended = {},
      has_errors = false,
    }

    if not theme[section_name] then
      if #section_schema.required > 0 then
        table.insert(results.errors, string.format("missing section: %s", section_name))
        section_result.has_errors = true
        results.valid = false
      end
    else
      section_result.present = true

      for _, key in ipairs(section_schema.required) do
        if not theme[section_name][key] then
          local missing_key = string.format("%s.%s", section_name, key)
          table.insert(results.missing, missing_key)
          table.insert(results.errors, string.format("missing required: %s", missing_key))
          table.insert(section_result.missing_required, key)
          results.valid = false
        end
      end

      for _, key in ipairs(section_schema.recommended) do
        if not theme[section_name][key] then
          local missing_key = string.format("%s.%s", section_name, key)
          table.insert(results.warnings, string.format("missing recommended: %s", missing_key))
          table.insert(section_result.missing_recommended, key)
        end
      end
    end

    table.insert(results.sections, section_result)
  end

  return results
end

-- ============================================================================
-- AUTO-FIX FUNCTIONS
-- ============================================================================

--- Auto-fix a palette (normalize hex, add missing keys with defaults)
--- @param palette table Palette to fix
--- @param opts table|nil Options { generate_missing: boolean }
--- @return table fixed_palette, table changes
function M.fix_palette(palette, opts)
  opts = opts or {}
  local fixed = vim.tbl_deep_extend("force", {}, palette or {})
  local changes = { normalized = {}, added = {}, schema_fixed = {} }

  for key, value in pairs(fixed) do
    if type(value) == "string" and (value:match("^#") or schema.is_color_key(key)) then
      local normalized, err = M.normalize_hex(value)
      if not err and normalized ~= value then
        changes.normalized[key] = { from = value, to = normalized }
        fixed[key] = normalized
      elseif err then
        changes.normalized[key] = { from = value, to = "#000000", error = err }
        fixed[key] = "#000000"
      end
    end
  end

  if opts.generate_missing then
    if not fixed.bg_darkest then
      local derived = M.smart_derive_bg_darkest(fixed)
      fixed.bg_darkest = derived.value
      changes.added.bg_darkest = {
        source = derived.source_key,
        value = derived.value,
        luminance = derived.luminance,
        derivation = "smart",
      }
    end

    if not fixed.fg_lightest then
      local derived = M.smart_derive_fg_lightest(fixed)
      fixed.fg_lightest = derived.value
      changes.added.fg_lightest = {
        source = derived.source_key,
        value = derived.value,
        luminance = derived.luminance,
        derivation = "smart",
      }
    end

    for _, item in ipairs(schema.PALETTE_SCHEMA.recommended) do
      if not fixed[item.key] then
        changes.schema_fixed[item.key] = { status = "missing", desc = item.desc }
      end
    end
  end

  return fixed, changes
end

--- Auto-fix base16 palette (fill missing colors)
--- @param base16 table Base16 colors
--- @return table fixed_base16, table changes
function M.fix_base16(base16)
  local fixed = vim.tbl_deep_extend("force", {}, base16 or {})
  local changes = {}

  local bg = fixed.base00 or "#000000"
  local fg = fixed.base05 or "#ffffff"

  local default_base16 = {
    base00 = bg,
    base01 = bg,
    base02 = bg,
    base03 = "#4a4a4a",
    base04 = "#8a8a8a",
    base05 = fg,
    base06 = fg,
    base07 = "#ffffff",
    base08 = "#ff0000",
    base09 = "#ff8800",
    base0A = "#ffff00",
    base0B = "#00ff00",
    base0C = "#00ffff",
    base0D = "#0000ff",
    base0E = "#ff00ff",
    base0F = "#884400",
  }

  for i = 0, 15 do
    local key = string.format("base%02X", i)
    if not fixed[key] then
      fixed[key] = default_base16[key]
      changes[key] = { status = "generated", value = default_base16[key] }
    else
      local normalized, err = M.normalize_hex(fixed[key])
      if err then
        changes[key] = { status = "fixed", from = fixed[key], to = normalized }
        fixed[key] = normalized
      elseif normalized ~= fixed[key] then
        changes[key] = { status = "normalized", from = fixed[key], to = normalized }
        fixed[key] = normalized
      end
    end
  end

  return fixed, changes
end

-- ============================================================================
-- WCAG CONTRAST VALIDATION
-- ============================================================================

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

local function calc_contrast(fg, bg)
  if not fg or not bg then return 0 end
  local lum1 = color.get_luminance(fg)
  local lum2 = color.get_luminance(bg)
  local ratio = color.calculate_contrast(lum1, lum2)
  return ratio, lum1, lum2
end

--- Check WCAG contrast for theme colors
--- @param theme table Theme colors table
--- @param opts table|nil Options { level: "aa"|"aaa" }
--- @return table Validation results
function M.check_wcag_contrast(theme, opts)
  opts = opts or {}
  local level = opts.level or "aa"
  local threshold = level == "aaa" and WCAG.AAA_NORMAL or WCAG.AA_NORMAL

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

--- Suggest color adjustments to meet WCAG contrast
--- @param fg string Current foreground hex
--- @param bg string Current background hex
--- @param target_ratio number Target contrast ratio (4.5 for AA, 7 for AAA)
--- @return table suggestions { current_ratio, target_ratio, fg_suggestion, bg_suggestion, actions }
function M.suggest_contrast_fix(fg, bg, target_ratio)
  local suggestions = {
    current_ratio = 0,
    target_ratio = target_ratio,
    fg_current = fg,
    bg_current = bg,
    fg_suggestion = nil,
    bg_suggestion = nil,
    actions = {},
    passes = false,
  }

  local lum1 = color.get_luminance(fg)
  local lum2 = color.get_luminance(bg)
  suggestions.current_ratio = color.calculate_contrast(lum1, lum2)

  if suggestions.current_ratio >= target_ratio then
    suggestions.passes = true
    return suggestions
  end

  local bg_is_dark = lum2 < 0.5
  local fg_obj = color.new(fg)
  local bg_obj = color.new(bg)

  local fg_adjusted = color.new(fg)
  local steps = 0
  while steps < 20 do
    if bg_is_dark then
      fg_adjusted = color.new(fg_adjusted:to_hex()):brighten(0.05)
    else
      fg_adjusted = color.new(fg_adjusted:to_hex()):darken(0.05)
    end
    local new_lum = color.get_luminance(fg_adjusted:to_hex())
    local new_ratio = color.calculate_contrast(new_lum, lum2)
    if new_ratio >= target_ratio then
      suggestions.fg_suggestion = fg_adjusted:to_hex()
      table.insert(suggestions.actions, string.format(
        "Adjust fg: %s -> %s (ratio: %.1f:1)", fg, fg_adjusted:to_hex(), new_ratio))
      break
    end
    steps = steps + 1
  end

  local bg_adjusted = color.new(bg)
  steps = 0
  while steps < 20 do
    if bg_is_dark then
      bg_adjusted = color.new(bg_adjusted:to_hex()):darken(0.05)
    else
      bg_adjusted = color.new(bg_adjusted:to_hex()):brighten(0.05)
    end
    local new_lum = color.get_luminance(bg_adjusted:to_hex())
    local new_ratio = color.calculate_contrast(lum1, new_lum)
    if new_ratio >= target_ratio then
      suggestions.bg_suggestion = bg_adjusted:to_hex()
      table.insert(suggestions.actions, string.format(
        "Adjust bg: %s -> %s (ratio: %.1f:1)", bg, bg_adjusted:to_hex(), new_ratio))
      break
    end
    steps = steps + 1
  end

  if not suggestions.fg_suggestion and not suggestions.bg_suggestion then
    table.insert(suggestions.actions, "Consider using a more contrasting color pair")
  end

  return suggestions
end

-- ============================================================================
-- BASE16 VALIDATION
-- ============================================================================

--- Check Base16 palette completeness
--- @param theme table Theme with base16 or palette
--- @return table Validation results
function M.check_base16_palette(theme)
  local results = {
    complete = true,
    present = {},
    missing = {},
    count = 0,
    invalid = {},
  }

  local base16 = theme.base16
  if not base16 then
    results.complete = false
    results.missing = REQUIRED_BASE16
    return results
  end

  for _, key in ipairs(REQUIRED_BASE16) do
    if base16[key] then
      local valid, _, err = M.validate_hex(base16[key], key)
      if not valid then
        table.insert(results.invalid, { key = key, value = base16[key], error = err })
      else
        table.insert(results.present, key)
        results.count = results.count + 1
      end
    else
      table.insert(results.missing, key)
      results.complete = false
    end
  end

  if #results.invalid > 0 then
    results.complete = false
  end

  return results
end

-- ============================================================================
-- THEME STRUCTURE VALIDATION
-- ============================================================================

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

  local required_ui = { "fg", "bg" }
  for _, key in ipairs(required_ui) do
    if not theme.ui or not theme.ui[key] then
      table.insert(results.errors, string.format("ui.%s is required", key))
      results.valid = false
    end
  end

  local required_syn = { "comment", "keyword", "func", "string", "type", "variable" }
  for _, key in ipairs(required_syn) do
    if not theme.syn or not theme.syn[key] then
      table.insert(results.errors, string.format("syn.%s is required", key))
      results.valid = false
    end
  end

  local required_diag = { "error", "warning", "info", "hint" }
  for _, key in ipairs(required_diag) do
    if not theme.diag or not theme.diag[key] then
      table.insert(results.errors, string.format("diag.%s is required", key))
      results.valid = false
    end
  end

  return results
end

-- ============================================================================
-- MAIN VALIDATION FUNCTION
-- ============================================================================

--- Validate a theme by name
--- @param theme_name string Theme name (universe/name or just name)
--- @param opts table|nil Options { level, fix, schema, color_formats, strict }
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
    fixes = {},
  }

  local config = require("prismpunk.config")
  local parsed = config.parse_theme(theme_name)
  if not parsed or not parsed.name then
    report.valid = false
    report.error = "Invalid theme name: " .. theme_name
    return report
  end

  local theme_path
  local theme_mod
  local tries = {}

  if parsed.variants and #parsed.variants > 0 then
    for _, variant in ipairs(parsed.variants) do
      if variant.universe and variant.universe ~= "" then
        local universe_dotted = variant.universe:gsub("/", ".")
        table.insert(tries, string.format("prismpunk.themes.%s.%s", universe_dotted, variant.name))
      end
    end
  end

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

  local palette = require("prismpunk.palette")
  local palette_universe = parsed.universe or (theme_mod.palette and theme_mod.palette.universe)
  local palette_name = (theme_mod.palette and theme_mod.palette.name) or parsed.name

  local palette_table
  local palette_tries = {}

  if parsed.variants and #parsed.variants > 0 then
    for _, variant in ipairs(parsed.variants) do
      if variant.universe and variant.universe ~= "" then
        local uni = variant.universe:gsub("/", ".")
        table.insert(palette_tries, { variant.universe, variant.name })
        table.insert(palette_tries, { nil, variant.name })
      end
    end
  end

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

  local contrast_opts = { level = opts.level or "aa" }
  local contrast_result = M.check_wcag_contrast(theme_colors, contrast_opts)
  report.checks.contrast = contrast_result
  if not contrast_result.passed then
    report.summary.errors = report.summary.errors + #contrast_result.errors
    report.summary.warnings = report.summary.warnings + #contrast_result.warnings
    if not opts.schema then report.valid = false end
  end

  local base16_result = M.check_base16_palette(theme_mod)
  report.checks.base16 = base16_result
  if not base16_result.complete then
    report.summary.errors = report.summary.errors + #base16_result.missing + #base16_result.invalid
    if not opts.schema then report.valid = false end
  end

  local structure_result = M.check_theme_structure(theme_colors)
  report.checks.structure = structure_result
  if not structure_result.valid then
    report.summary.errors = report.summary.errors + #structure_result.errors
    if not opts.schema then report.valid = false end
  end

  local color_format_result = M.check_color_formats(theme_colors)
  report.checks.color_formats = color_format_result
  if not color_format_result.valid then
    report.summary.errors = report.summary.errors + #color_format_result.errors
    if not opts.schema then report.valid = false end
  end

  local palette_schema_result = M.validate_palette_schema(palette_table)
  report.checks.palette_schema = palette_schema_result
  if not palette_schema_result.valid then
    report.summary.errors = report.summary.errors + #palette_schema_result.errors
    if not opts.schema then report.valid = false end
  end

  local theme_schema_result = M.check_theme_color_schema(theme_colors)
  report.checks.theme_schema = theme_schema_result
  if not theme_schema_result.valid then
    report.summary.errors = report.summary.errors + #theme_schema_result.errors
    if not opts.schema then report.valid = false end
  end
  report.summary.warnings = report.summary.warnings + #theme_schema_result.warnings

  if opts.strict then
    if #contrast_result.warnings > 0 or #palette_schema_result.warnings > 0 or #theme_schema_result.warnings > 0 then
      report.valid = false
    end
  end

  if opts.fix then
    if not palette_schema_result.valid or color_format_result.valid == false then
      local fixed_palette, palette_changes = M.fix_palette(palette_table, { generate_missing = true })
      report.fixes.palette = palette_changes
    end
    if not base16_result.complete or #base16_result.invalid > 0 then
      local fixed_base16, base16_changes = M.fix_base16(theme_mod.base16 or {})
      report.fixes.base16 = base16_changes
    end
  end

  report.summary.passed = report.valid and report.summary.errors == 0

  return report
end

-- ============================================================================
-- REPORT FORMATTING
-- ============================================================================

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

  local function format_check_result(passed, label)
    if passed then
      return "[OK] " .. label
    else
      return "[FAIL] " .. label
    end
  end

  local contrast = report.checks.contrast
  if contrast then
    table.insert(lines, format_check_result(contrast.passed, "WCAG Contrast (" .. contrast.level .. ")"))
    for _, check in ipairs(contrast.checks or {}) do
      local mark = check.pass and "  OK " or "  FAIL"
      local ratio_str = string.format("%.1f:1", check.ratio)
      if check.pass then
        table.insert(lines, string.format("%s %-20s %s (%s)", mark, check.name, ratio_str, check.required_level))
      else
        table.insert(lines, string.format("%s %-20s %s (needs %s)", mark, check.name, ratio_str, check.required_level))
        local threshold = check.required_level == "AAA" and 7.0 or 4.5
        local suggestions = M.suggest_contrast_fix(check.fg, check.bg, threshold)
        for _, action in ipairs(suggestions.actions) do
          table.insert(lines, "    SUGGEST: " .. action)
        end
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

  local base16 = report.checks.base16
  if base16 then
    if base16.complete and #base16.invalid == 0 then
      table.insert(lines, string.format("[OK] Base16 Palette: Complete (%d/16)", base16.count))
    else
      table.insert(lines, string.format("[FAIL] Base16 Palette: %d/16 complete", base16.count))
      if #base16.missing > 0 then
        table.insert(lines, "  MISSING: " .. table.concat(base16.missing, ", "))
      end
      for _, inv in ipairs(base16.invalid or {}) do
        table.insert(lines, string.format("  INVALID: %s = '%s' (%s)", inv.key, inv.value, inv.error))
      end
    end
    table.insert(lines, "")
  end

  local structure = report.checks.structure
  if structure then
    if structure.valid then
      table.insert(lines, "[OK] Theme Structure: Valid")
    else
      table.insert(lines, "[FAIL] Theme Structure: Invalid")
      for _, err in ipairs(structure.errors or {}) do
        table.insert(lines, "  ERROR: " .. err)
      end
    end
    table.insert(lines, "")
  end

  local color_formats = report.checks.color_formats
  if color_formats then
    if color_formats.valid then
      table.insert(lines, "[OK] Color Formats: All valid")
    else
      table.insert(lines, string.format("[FAIL] Color Formats: %d invalid", #color_formats.invalid_colors))
      for _, inv in ipairs(color_formats.invalid_colors) do
        table.insert(lines, string.format("  INVALID: %s = '%s'", inv.path, inv.value))
      end
    end
    table.insert(lines, "")
  end

  local palette_schema = report.checks.palette_schema
  if palette_schema then
    if palette_schema.valid then
      table.insert(lines, "[OK] Palette Schema: Valid")
    else
      table.insert(lines, "[FAIL] Palette Schema: Invalid")
      for _, err in ipairs(palette_schema.errors or {}) do
        table.insert(lines, "  ERROR: " .. err)
      end
    end
    for _, warn in ipairs(palette_schema.warnings or {}) do
      table.insert(lines, "  WARN: " .. warn)
    end
    table.insert(lines, "")
  end

  local theme_schema = report.checks.theme_schema
  if theme_schema then
    if theme_schema.valid then
      table.insert(lines, "[OK] Theme Schema: Valid")
    else
      table.insert(lines, "[FAIL] Theme Schema: Invalid")
      for _, err in ipairs(theme_schema.errors or {}) do
        table.insert(lines, "  ERROR: " .. err)
      end
    end
    for _, warn in ipairs(theme_schema.warnings or {}) do
      table.insert(lines, "  WARN: " .. warn)
    end
    table.insert(lines, "")
  end

  if report.fixes and next(report.fixes) then
    table.insert(lines, "--- Auto-Fixes Applied ---")
    if report.fixes.palette then
      for key, change in pairs(report.fixes.palette.normalized or {}) do
        table.insert(lines, string.format("  %s: '%s' -> '%s'", key, change.from, change.to))
      end
      for key, change in pairs(report.fixes.palette.added or {}) do
        if change.derivation == "smart" and change.luminance then
          table.insert(lines, string.format("  %s: derived from %s (lum: %.3f)", key, change.source, change.luminance))
        else
          table.insert(lines, string.format("  %s: added from %s", key, change.source))
        end
      end
    end
    if report.fixes.base16 then
      for key, change in pairs(report.fixes.base16) do
        table.insert(lines, string.format("  %s: %s", key, change.status))
      end
    end
    table.insert(lines, "")
  end

  table.insert(lines, string.format("Summary: %d error(s), %d warning(s)",
    report.summary.errors, report.summary.warnings))

  if report.summary.passed then
    table.insert(lines, "[OK] VALIDATION PASSED")
  else
    table.insert(lines, "[FAIL] VALIDATION FAILED")
  end

  return table.concat(lines, "\n")
end

return M
