#!/usr/bin/env lua
--- Migration script: Inline palettes into theme files
--- Run from project root: lua scripts/migrate_palettes.lua

local function read_file(path)
  local file = io.open(path, "r")
  if not file then return nil end
  local content = file:read("*a")
  file:close()
  return content
end

local function write_file(path, content)
  local file = io.open(path, "w")
  if not file then return false end
  file:write(content)
  file:close()
  return true
end

local function get_palette_path(theme_path)
  return theme_path:gsub("themes", "palettes")
end

local function find_themes()
  local themes = {}
  local handle = io.popen('find lua/prismpunk/themes -name "*.lua" -type f 2>/dev/null')
  if not handle then return themes end
  
  for line in handle:lines() do
    table.insert(themes, line)
  end
  handle:close()
  
  return themes
end

local function migrate_theme(theme_path)
  local palette_path = get_palette_path(theme_path)
  local palette_content = read_file(palette_path)
  
  if not palette_content then
    print("  [SKIP] No palette: " .. palette_path)
    return false
  end
  
  local theme_content = read_file(theme_path)
  if not theme_content then
    print("  [ERROR] Cannot read: " .. theme_path)
    return false
  end
  
  if theme_content:match("local palette = %{\n  ") then
    print("  [SKIP] Already migrated: " .. theme_path)
    return false
  end
  
  local palette_data = palette_content:gsub("^return%s*", ""):gsub("%s*$", "")
  
  local new_theme = theme_content
  
  new_theme = new_theme:gsub(
    'local color = require%("prismpunk%.utils%.color"%)\nlocal palette = require%("prismpunk%.palettes%.[^"]+"%)',
    'local color = require("prismpunk.utils.color")\n\nlocal palette = ' .. palette_data
  )
  
  if new_theme == theme_content then
    new_theme = new_theme:gsub(
      'local palette = require%("prismpunk%.palettes%.[^"]+"%)',
      'local palette = ' .. palette_data
    )
  end
  
  if new_theme == theme_content then
    print("  [ERROR] Could not replace: " .. theme_path)
    return false
  end
  
  write_file(theme_path, new_theme)
  return true
end

local function main()
  print("=== Migrating Palettes into Themes ===\n")
  
  local themes = find_themes()
  print(string.format("Found %d theme files\n", #themes))
  
  local migrated = 0
  local skipped = 0
  local errors = 0
  
  for _, theme_path in ipairs(themes) do
    local result = migrate_theme(theme_path)
    if result then
      migrated = migrated + 1
      print("  [OK] " .. theme_path)
    else
      skipped = skipped + 1
    end
  end
  
  print(string.format("\n=== Summary ==="))
  print(string.format("Migrated: %d", migrated))
  print(string.format("Skipped:  %d", skipped))
  print(string.format("Total:    %d", #themes))
end

main()
