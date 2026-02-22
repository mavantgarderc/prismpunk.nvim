-- plugin/prismpunk.lua
if vim.fn.has("nvim-0.10") == 0 then
  vim.notify(
    "[prismpunk] Neovim 0.10+ required. Current version: " .. vim.version().major .. "." .. vim.version().minor,
    vim.log.levels.ERROR
  )
  return
end

local function get_config()
  local ok, prismpunk = pcall(require, "prismpunk.config")
  if ok and prismpunk.options then return prismpunk.options end
  return _G.prismpunk_config or {}
end

local DEFAULT_THEME = "kanagawa/paper-edo"

local function get_current_theme(arg)
  if arg and arg ~= "" then return arg end

  local config = get_config()
  return config.theme or DEFAULT_THEME
end

vim.api.nvim_create_user_command("PrismExportGhostty", function(opts)
  local theme = get_current_theme(opts.args)

  local ok, terminals = pcall(require, "prismpunk.core.terminals")
  if not ok then
    vim.notify("[prismpunk] Failed to load terminals module", vim.log.levels.ERROR)
    return
  end

  if terminals.save_ghostty then
    terminals.save_ghostty(theme)
  else
    vim.notify("[prismpunk] save_ghostty function not found", vim.log.levels.ERROR)
  end
end, {
  nargs = "?",
  complete = function()
    local ok, loader = pcall(require, "prismpunk.loader")
    if ok and loader.get_allowed_theme_list then return loader.get_allowed_theme_list() end
    if ok and loader.list_themes then return loader.list_themes() end
    return {}
  end,
  desc = "Export current theme to Ghostty config",
})

vim.api.nvim_create_user_command("PrismPrintPalette", function(opts)
  local theme = get_current_theme(opts.args)

  local ok, terminals = pcall(require, "prismpunk.core.terminals")
  if not ok then
    vim.notify("[prismpunk] Failed to load terminals module", vim.log.levels.ERROR)
    return
  end

  if terminals.print_palette then
    terminals.print_palette(theme)
  else
    vim.notify("[prismpunk] print_palette function not found", vim.log.levels.ERROR)
  end
end, {
  nargs = "?",
  complete = function()
    local ok, loader = pcall(require, "prismpunk.loader")
    if ok and loader.get_allowed_theme_list then return loader.get_allowed_theme_list() end
    if ok and loader.list_themes then return loader.list_themes() end
    return {}
  end,
  desc = "Print theme color palette",
})

vim.api.nvim_create_user_command("PrismReload", function()
  local ok, loader = pcall(require, "prismpunk.loader")
  if not ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  loader.clear_cache()

  local config = get_config()
  local prismpunk_ok, prismpunk = pcall(require, "prismpunk")
  if prismpunk_ok and config.theme then
    prismpunk.setup(config)
    vim.notify("[prismpunk] Reloaded theme: " .. config.theme, vim.log.levels.INFO)
  else
    vim.notify("[prismpunk] Failed to reload", vim.log.levels.ERROR)
  end
end, {
  desc = "Clear cache and reload PrismPunk theme",
})

vim.api.nvim_create_user_command("PrismListThemes", function()
  local ok, loader = pcall(require, "prismpunk.loader")
  if not ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  if loader.list_themes then
    local themes = loader.list_themes()
    if #themes > 0 then
      local theme_list = "Available themes:\n" .. table.concat(themes, "\n")
      vim.notify(theme_list, vim.log.levels.INFO)
    else
      vim.notify("[prismpunk] No themes found", vim.log.levels.WARN)
    end
  else
    vim.notify("[prismpunk] list_themes function not found", vim.log.levels.ERROR)
  end
end, {
  desc = "List all available PrismPunk themes",
})

-- Add command to show current theme
vim.api.nvim_create_user_command("PrismCurrentTheme", function()
  local config_ok, config = pcall(require, "prismpunk.config")
  if not config_ok then
    vim.notify("[prismpunk] Failed to load config module", vim.log.levels.ERROR)
    return
  end

  local current_theme = config.options and config.options.theme or "Not set"
  vim.notify("[prismpunk] Current theme: " .. current_theme, vim.log.levels.INFO)
end, {
  desc = "Show current PrismPunk theme",
})

-- Add PrismInfo command
vim.api.nvim_create_user_command("PrismInfo", function(opts)
  local theme_name = opts.args and opts.args ~= "" and opts.args or nil

  if not theme_name then
    local config_ok, cfg = pcall(require, "prismpunk.config")
    if config_ok and cfg.options then
      theme_name = cfg.options.theme
    end
  end

  if not theme_name then
    vim.notify("[prismpunk] No theme specified and no default theme set", vim.log.levels.WARN)
    return
  end

  local loader_ok, loader = pcall(require, "prismpunk.loader")
  if not loader_ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  local info = loader.get_theme_info(theme_name)
  if not info then
    vim.notify("[prismpunk] Theme not found: " .. theme_name, vim.log.levels.ERROR)
    return
  end

  local lines = {
    "=== " .. info.name .. " ===",
    "Author: " .. info.author,
    "Universe: " .. (info.universe or "none"),
    "",
    info.description,
    "",
    "--- Base16 Colors ---",
  }

  for i = 0, 15 do
    local key = i == 0 and "base00" or string.format("base%02X", i)
    if info.base16[key] then
      table.insert(lines, string.format("%-8s %s", key, info.base16[key]))
    end
  end

  if info.palette and next(info.palette) then
    table.insert(lines, "")
    table.insert(lines, "--- Rich Palette ---")
    for name, color in pairs(info.palette) do
      table.insert(lines, string.format("%-20s %s", name, color))
    end
  end

  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
end, {
  nargs = "?",
  desc = "Show theme information",
})

-- Add PrismRandom command
vim.api.nvim_create_user_command("PrismRandom", function(opts)
  local loader_ok, loader = pcall(require, "prismpunk.loader")
  if not loader_ok then
    vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
    return
  end

  local themes = loader.get_allowed_theme_list()
  if #themes == 0 then
    themes = loader.list_themes()
  end

  if #themes == 0 then
    vim.notify("[prismpunk] No themes available", vim.log.levels.ERROR)
    return
  end

  local universe_filter = opts.args and opts.args ~= "" and opts.args or nil
  if universe_filter then
    -- Convert dashes to slashes for compatibility (universe/name format)
    universe_filter = universe_filter:gsub("-", "/", 1)
    local filtered = {}
    local prefix = universe_filter .. "/"
    for _, t in ipairs(themes) do
      if t:sub(1, #prefix) == prefix then
        table.insert(filtered, t)
      end
    end
    if #filtered > 0 then themes = filtered end
  end

  local random_index = math.random(1, #themes)
  local random_theme = themes[random_index]

  local prismpunk_ok, prismpunk = pcall(require, "prismpunk")
  if prismpunk_ok then
    local success, err = prismpunk.load(random_theme)
    if success then
      vim.notify("[prismpunk] Loaded random theme: " .. random_theme, vim.log.levels.INFO)
    else
      vim.notify("[prismpunk] Failed to load theme: " .. tostring(err), vim.log.levels.ERROR)
    end
  end
end, {
  nargs = "?",
  desc = "Load a random theme",
})

-- Add PrismValidate command
vim.api.nvim_create_user_command("PrismValidate", function(opts)
  local args = vim.split(opts.args, "%s+", { plain = false, trimempty = true })
  local theme_name = nil
  local opts_internal = { level = "aa" }
  local output_format = "text"
  local validate_all = false

  for _, arg in ipairs(args) do
    if arg == "--json" then
      output_format = "json"
    elseif arg == "--quiet" then
      output_format = "quiet"
    elseif arg == "--all" then
      validate_all = true
    elseif arg == "--verbose" or arg == "-v" then
      opts_internal.verbose = true
    elseif arg == "--aaa" then
      opts_internal.level = "aaa"
    elseif arg == "--aa" then
      opts_internal.level = "aa"
    elseif arg == "--fix" then
      opts_internal.fix = true
    elseif arg == "--schema" then
      opts_internal.schema = true
    elseif arg == "--strict" then
      opts_internal.strict = true
    elseif arg == "--color-formats" then
      opts_internal.color_formats = true
    elseif arg ~= "" and not arg:match("^%-%w+") then
      theme_name = arg
    end
  end

  local validate = require("prismpunk.core.validate")

  if validate_all then
    local loader_ok, loader = pcall(require, "prismpunk.loader")
    if not loader_ok then
      vim.notify("[prismpunk] Failed to load loader module", vim.log.levels.ERROR)
      return
    end

    local themes = loader.list_themes()
    if #themes == 0 then
      vim.notify("[prismpunk] No themes found", vim.log.levels.WARN)
      return
    end

    local results = {}
    local error_count = 0
    local pass_count = 0
    local failed_themes = {}
    local passed_themes = {}
    local total_fixes = {}

    for _, theme in ipairs(themes) do
      local report = validate.validate_theme(theme, opts_internal)
      table.insert(results, report)
      if report.summary.passed then
        pass_count = pass_count + 1
        table.insert(passed_themes, theme)
      else
        error_count = error_count + 1
        table.insert(failed_themes, theme)
      end
      if report.fixes and next(report.fixes) then
        total_fixes[theme] = report.fixes
      end
    end

    if output_format == "json" then
      vim.notify(vim.json.encode(results), vim.log.levels.INFO)
    elseif output_format == "quiet" then
      vim.cmd(string.format("exit %d", error_count > 0 and 1 or 0))
    else
      local lines = {
        string.format("=== Validation Summary ==="),
        string.format("Total: %d themes", #themes),
        string.format("Passed: %d", pass_count),
        string.format("Failed: %d", error_count),
        "",
      }

      if opts_internal.fix and next(total_fixes) then
        table.insert(lines, "--- Auto-Fixes Applied ---")
        for theme_name, fixes in pairs(total_fixes) do
          if fixes.palette then
            for key, change in pairs(fixes.palette.normalized or {}) do
              table.insert(lines, string.format("  %s.%s: '%s' -> '%s'", theme_name, key, change.from, change.to))
            end
          end
        end
        table.insert(lines, "")
      end

      if #failed_themes > 0 and #failed_themes <= 50 then
        table.insert(lines, "--- Failed Themes ---")
        for _, theme in ipairs(failed_themes) do
          table.insert(lines, "  x " .. theme)
        end
        table.insert(lines, "")
      end

      if #passed_themes > 0 and #passed_themes <= 50 then
        table.insert(lines, "--- Passed Themes ---")
        for _, theme in ipairs(passed_themes) do
          table.insert(lines, "  ok " .. theme)
        end
        table.insert(lines, "")
      end

      if #failed_themes > 50 then
        table.insert(lines, string.format("(Showing first 50 of %d failed themes)", #failed_themes))
        for i = 1, 50 do
          table.insert(lines, "  x " .. failed_themes[i])
        end
        table.insert(lines, "")
      end

      vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
    end

    return
  end

  if not theme_name or theme_name == "" then
    local config_ok, cfg = pcall(require, "prismpunk.config")
    if config_ok and cfg.options then
      theme_name = cfg.options.theme
    end
  end

  if not theme_name or theme_name == "" then
    vim.notify("[prismpunk] No theme specified and no default theme set", vim.log.levels.WARN)
    return
  end

  local report = validate.validate_theme(theme_name, opts_internal)

  if output_format == "json" then
    vim.notify(vim.json.encode(report), vim.log.levels.INFO)
  elseif output_format == "quiet" then
    vim.cmd(string.format("exit %d", report.summary.passed and 0 or 1))
  else
    local report_text = validate.format_report(report)
    if report.summary.passed then
      vim.notify(report_text, vim.log.levels.INFO)
    else
      vim.notify(report_text, vim.log.levels.WARN)
    end
  end
end, {
  nargs = "*",
  desc = "Validate theme(s) against WCAG, color format, and schema standards",
  complete = function(_, cmdline, _)
    local args = vim.split(cmdline, "%s+", { trimempty = true })
    local flags = { "--json", "--quiet", "--all", "--verbose", "-v", "--aaa", "--aa", "--fix", "--schema", "--strict", "--color-formats" }

    if #args == 1 then
      local ok, loader = pcall(require, "prismpunk.loader")
      if ok then
        local themes = loader.list_themes()
        local completions = {}
        for _, f in ipairs(flags) do table.insert(completions, f) end
        for _, t in ipairs(themes) do table.insert(completions, t) end
        return completions
      end
      return flags
    end

    return flags
  end,
})
