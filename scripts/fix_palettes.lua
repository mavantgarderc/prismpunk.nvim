#!/usr/bin/env nvim -l
--- scripts/fix_palettes.lua
--- Auto-fix palette issues: derive missing required keys, normalize hex values
--- Usage: nvim -l scripts/fix_palettes.lua [--dry-run] [--verbose] [--rederive]
--- Preserves human-curated key ordering

vim.opt.rtp:prepend(vim.fn.getcwd())

local M = {}

local validate = require("prismpunk.core.validate")

local function parse_args()
  local args = {
    dry_run = false,
    verbose = false,
    rederive = false,
    theme = nil,
  }
  for _, arg in ipairs(_G.arg or {}) do
    if arg == "--dry-run" then args.dry_run = true end
    if arg == "--verbose" or arg == "-v" then args.verbose = true end
    if arg == "--rederive" then args.rederive = true end
    if not arg:match("^%-") then args.theme = arg end
  end
  return args
end

local function find_palette_files()
  local palette_dir = "lua/prismpunk/palettes"
  local files = {}

  local function scan_dir(dir, prefix)
    prefix = prefix or ""
    local entries = vim.fn.readdir(dir)
    if not entries then return end

    for _, name in ipairs(entries) do
      local full_path = dir .. "/" .. name
      if vim.fn.isdirectory(full_path) == 1 then
        scan_dir(full_path, prefix .. name .. "/")
      elseif name:match("%.lua$") then
        table.insert(files, {
          path = full_path,
          theme_name = prefix .. name:gsub("%.lua$", ""),
        })
      end
    end
  end

  if vim.fn.isdirectory(palette_dir) == 1 then
    scan_dir(palette_dir)
  end

  return files
end

local function load_palette_file(filepath)
  local content = vim.fn.readfile(filepath)
  if not content or #content == 0 then
    return nil, "Failed to read file", nil
  end

  local content_str = table.concat(content, "\n")
  local ok, palette = pcall(loadstring(content_str))
  if not ok then
    return nil, "Failed to parse: " .. tostring(palette), nil
  end

  if type(palette) == "function" then
    ok, palette = pcall(palette)
    if not ok then
      return nil, "Failed to execute palette function", nil
    end
  end

  if type(palette) ~= "table" then
    return nil, "Palette must return a table", nil
  end

  return palette, nil, content_str
end

local function extract_key_order(content)
  local keys = {}
  local seen = {}
  for line in content:gmatch("[^\r\n]+") do
    local key = line:match("^%s*(%w[%w_]*)%s*=")
    if key and not seen[key] then
      table.insert(keys, key)
      seen[key] = true
    end
  end
  return keys, seen
end

local function extract_header_comments(content)
  local lines = {}
  for line in content:gmatch("[^\r\n]+") do
    local trimmed = line:match("^%s*(.-)%s*$")
    if trimmed and trimmed:match("^%-%-") then
      table.insert(lines, line)
    else
      break
    end
  end
  return lines
end

local function derive_missing_keys(palette, original_seen)
  local fixed = vim.deepcopy(palette)
  local changes = {}
  local new_keys = {}

  if not original_seen["bg_darkest"] and not fixed.bg_darkest then
    local derived = validate.smart_derive_bg_darkest(fixed)
    fixed.bg_darkest = derived.value
    new_keys.bg_darkest = true
    table.insert(changes, {
      key = "bg_darkest",
      action = "derived",
      source = derived.source_key,
      value = derived.value,
      luminance = derived.luminance,
    })
  end

  if not original_seen["fg_lightest"] and not fixed.fg_lightest then
    local derived = validate.smart_derive_fg_lightest(fixed)
    fixed.fg_lightest = derived.value
    new_keys.fg_lightest = true
    table.insert(changes, {
      key = "fg_lightest",
      action = "derived",
      source = derived.source_key,
      value = derived.value,
      luminance = derived.luminance,
    })
  end

  return fixed, changes, new_keys
end

local DUMB_DEFAULTS = {
  bg_darkest = { "#000000", "#000" },
  fg_lightest = { "#ffffff", "#fff", "#FFFFFF", "#FFF" },
}

local function is_dumb_default(key, value)
  local defaults = DUMB_DEFAULTS[key]
  if not defaults then return false end
  local lower_val = value:lower()
  for _, default in ipairs(defaults) do
    if lower_val == default:lower() then return true end
  end
  return false
end

local function rederive_existing_keys(palette)
  local fixed = vim.deepcopy(palette)
  local changes = {}

  if fixed.bg_darkest and is_dumb_default("bg_darkest", fixed.bg_darkest) then
    local derived = validate.smart_derive_bg_darkest(fixed)
    if derived.source_key ~= "default" then
      table.insert(changes, {
        key = "bg_darkest",
        action = "rederived",
        from = fixed.bg_darkest,
        source = derived.source_key,
        value = derived.value,
        luminance = derived.luminance,
      })
      fixed.bg_darkest = derived.value
    end
  end

  if fixed.fg_lightest and is_dumb_default("fg_lightest", fixed.fg_lightest) then
    local derived = validate.smart_derive_fg_lightest(fixed)
    if derived.source_key ~= "default" then
      table.insert(changes, {
        key = "fg_lightest",
        action = "rederived",
        from = fixed.fg_lightest,
        source = derived.source_key,
        value = derived.value,
        luminance = derived.luminance,
      })
      fixed.fg_lightest = derived.value
    end
  end

  return fixed, changes
end

local function normalize_hex_values(palette)
  local fixed = vim.deepcopy(palette)
  local changes = {}

  for key, value in pairs(fixed) do
    if type(value) == "string" and (value:match("^#") or key:match("^[bf]g") or key:match("fg_") or key:match("bg_")) then
      local normalized, err = validate.normalize_hex(value)
      if not err and normalized ~= value then
        fixed[key] = normalized
        table.insert(changes, { key = key, action = "normalized", from = value, to = normalized })
      elseif err and value:match("^#") then
        fixed[key] = "#000000"
        table.insert(changes, { key = key, action = "fixed_invalid", from = value, to = "#000000", error = err })
      end
    end
  end

  return fixed, changes
end

local function generate_palette_content(palette, original_content, new_keys)
  local original_keys, original_seen = extract_key_order(original_content)
  local header_lines = extract_header_comments(original_content)
  local lines = {}

  for _, line in ipairs(header_lines) do
    table.insert(lines, line)
  end

  if #header_lines > 0 then
    table.insert(lines, "")
  end

  table.insert(lines, "return {")

  for _, key in ipairs(original_keys) do
    if palette[key] and type(palette[key]) == "string" then
      table.insert(lines, string.format("  %s = \"%s\",", key, palette[key]))
    end
  end

  local new_key_list = {}
  for key in pairs(new_keys) do
    table.insert(new_key_list, key)
  end
  table.sort(new_key_list)

  if #new_key_list > 0 then
    table.insert(lines, "")
    for _, key in ipairs(new_key_list) do
      if palette[key] then
        table.insert(lines, string.format("  %s = \"%s\",", key, palette[key]))
      end
    end
  end

  table.insert(lines, "}")
  table.insert(lines, "")

  return lines
end

local function fix_palette_file(filepath, args)
  local palette, err, original_content = load_palette_file(filepath)
  if not palette then
    return { success = false, error = err }
  end

  local all_changes = {}
  local has_changes = false

  local original_keys, original_seen = extract_key_order(original_content)

  local normalized, norm_changes = normalize_hex_values(palette)
  if #norm_changes > 0 then
    has_changes = true
    vim.list_extend(all_changes, norm_changes)
    palette = normalized
  end

  if args.rederive then
    local rederived, rederiv_changes = rederive_existing_keys(palette)
    if #rederiv_changes > 0 then
      has_changes = true
      vim.list_extend(all_changes, rederiv_changes)
      palette = rederived
    end
  end

  local derived, deriv_changes, new_keys = derive_missing_keys(palette, original_seen)
  if #deriv_changes > 0 then
    has_changes = true
    vim.list_extend(all_changes, deriv_changes)
    palette = derived
  end

  if not has_changes then
    return { success = true, changes = {}, no_changes = true }
  end

  if args.dry_run then
    return { success = true, changes = all_changes, dry_run = true }
  end

  local lines = generate_palette_content(palette, original_content, new_keys)
  local write_ok, write_err = pcall(vim.fn.writefile, lines, filepath)

  if not write_ok then
    return { success = false, error = tostring(write_err) }
  end

  return { success = true, changes = all_changes }
end

local function print_changes(result, filepath, verbose)
  if result.no_changes then
    if verbose then
      print("  [OK] " .. filepath)
    end
    return
  end

  if result.dry_run then
    print("  [DRY-RUN] " .. filepath)
  else
    print("  [FIXED] " .. filepath)
  end

  for _, change in ipairs(result.changes) do
    if change.action == "rederived" then
      print(string.format("    ~ %s: \"%s\" -> \"%s\" (from %s, lum: %.3f)", change.key, change.from, change.value, change.source, change.luminance))
    elseif change.action == "derived" then
      if change.luminance then
        print(string.format("    + %s = \"%s\" (from %s, lum: %.3f)", change.key, change.value, change.source, change.luminance))
      else
        print(string.format("    + %s = \"%s\" (from %s)", change.key, change.value, change.source))
      end
    elseif change.action == "normalized" then
      print(string.format("    ~ %s: \"%s\" -> \"%s\"", change.key, change.from, change.to))
    elseif change.action == "fixed_invalid" then
      print(string.format("    ! %s: \"%s\" -> \"%s\" (invalid: %s)", change.key, change.from, change.to, change.error))
    end
  end
end

function M.run()
  local args = parse_args()

  print("=== PrismPunk Palette Fix Script ===")
  if args.dry_run then
    print("Mode: DRY-RUN (no files will be modified)")
  end
  if args.rederive then
    print("Mode: REDERIVE (replacing dumb defaults with smart values)")
  end
  print("")

  local files = find_palette_files()

  if args.theme then
    files = vim.tbl_filter(function(f)
      return f.theme_name:find(args.theme, 1, true)
    end, files)
  end

  print(string.format("Found %d palette files\n", #files))

  local stats = {
    total = #files,
    fixed = 0,
    unchanged = 0,
    errors = 0,
  }

  for _, file in ipairs(files) do
    local result = fix_palette_file(file.path, args)

    if not result.success then
      print("  [ERROR] " .. file.path .. ": " .. (result.error or "unknown"))
      stats.errors = stats.errors + 1
    elseif result.no_changes then
      stats.unchanged = stats.unchanged + 1
      if args.verbose then
        print_changes(result, file.path, args.verbose)
      end
    else
      stats.fixed = stats.fixed + 1
      print_changes(result, file.path, args.verbose)
    end
  end

  print("")
  print("=== Summary ===")
  print(string.format("Total:   %d", stats.total))
  print(string.format("Fixed:   %d", stats.fixed))
  print(string.format("Unchanged: %d", stats.unchanged))
  print(string.format("Errors:  %d", stats.errors))

  if args.dry_run and stats.fixed > 0 then
    print("")
    print("Run without --dry-run to apply changes")
  end
end

M.run()

return M
