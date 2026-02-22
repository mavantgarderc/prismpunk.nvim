#!/usr/bin/env nvim -l
--- scripts/fix_palettes.lua
--- Auto-fix palette issues: derive missing required keys, normalize hex values
--- Usage: nvim -l scripts/fix_palettes.lua [--dry-run] [--verbose]

local M = {}

local validate = require("prismpunk.core.validate")

local function parse_args()
  local args = {
    dry_run = false,
    verbose = false,
    theme = nil,
  }
  for _, arg in ipairs(_G.arg or {}) do
    if arg == "--dry-run" then args.dry_run = true end
    if arg == "--verbose" or arg == "-v" then args.verbose = true end
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
    return nil, "Failed to read file"
  end

  local lua_code = table.concat(content, "\n")
  local ok, palette = pcall(loadstring(lua_code))
  if not ok then
    return nil, "Failed to parse: " .. tostring(palette)
  end

  if type(palette) == "function" then
    ok, palette = pcall(palette)
    if not ok then
      return nil, "Failed to execute palette function"
    end
  end

  if type(palette) ~= "table" then
    return nil, "Palette must return a table"
  end

  return palette, nil
end

local function derive_missing_keys(palette)
  local fixed = vim.deepcopy(palette)
  local changes = {}

  if not fixed.bg_darkest then
    local source = "default"
    local value = "#000000"

    if fixed.bg then
      source, value = "bg", fixed.bg
    elseif fixed.bg_darker then
      source, value = "bg_darker", fixed.bg_darker
    elseif fixed.bg_dark then
      source, value = "bg_dark", fixed.bg_dark
    elseif fixed.bg_mid then
      source, value = "bg_mid", fixed.bg_mid
    elseif fixed.base00 then
      source, value = "base00", fixed.base00
    end

    fixed.bg_darkest = value
    table.insert(changes, { key = "bg_darkest", action = "derived", source = source, value = value })
  end

  if not fixed.fg_lightest then
    local source = "default"
    local value = "#ffffff"

    if fixed.fg then
      source, value = "fg", fixed.fg
    elseif fixed.fg_light then
      source, value = "fg_light", fixed.fg_light
    elseif fixed.fg_mid then
      source, value = "fg_mid", fixed.fg_mid
    elseif fixed.base05 then
      source, value = "base05", fixed.base05
    end

    fixed.fg_lightest = value
    table.insert(changes, { key = "fg_lightest", action = "derived", source = source, value = value })
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

local function generate_palette_content(palette, filepath)
  local lines = { "--- Auto-generated palette", "--- Source: " .. filepath, "", "return {" }

  local sorted_keys = {}
  for key in pairs(palette) do
    table.insert(sorted_keys, key)
  end
  table.sort(sorted_keys)

  for _, key in ipairs(sorted_keys) do
    local value = palette[key]
    if type(value) == "string" then
      table.insert(lines, string.format("  %s = \"%s\",", key, value))
    end
  end

  table.insert(lines, "}")
  table.insert(lines, "")

  return lines
end

local function fix_palette_file(filepath, args)
  local palette, err = load_palette_file(filepath)
  if not palette then
    return { success = false, error = err }
  end

  local all_changes = {}
  local has_changes = false

  local normalized, norm_changes = normalize_hex_values(palette)
  if #norm_changes > 0 then
    has_changes = true
    vim.list_extend(all_changes, norm_changes)
    palette = normalized
  end

  local derived, deriv_changes = derive_missing_keys(palette)
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

  local lines = generate_palette_content(palette, filepath)
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
    if change.action == "derived" then
      print(string.format("    + %s = \"%s\" (from %s)", change.key, change.value, change.source))
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
