--- Validates installation and configuration
local M = {}

local health_start = vim.health.start or vim.health.report_start
local health_ok = vim.health.ok or vim.health.report_ok
local health_warn = vim.health.warn or vim.health.report_warn
local health_error = vim.health.error or vim.health.report_error
local health_info = vim.health.info or vim.health.report_info

local function check_nvim_version()
  health_start("Neovim version")

  local required = { 0, 10, 0 }
  local current = vim.version() or { major = 0, minor = 0, patch = 0 }

  local ok =
    current.major > required[1]
    or (current.major == required[1] and current.minor > required[2])
    or (current.major == required[1] and current.minor == required[2] and current.patch >= required[3])

  if ok then
    health_ok(
      string.format(
        "Neovim %d.%d.%d (>= %d.%d.%d)",
        current.major,
        current.minor,
        current.patch,
        required[1],
        required[2],
        required[3]
      )
    )
  else
    health_error(
      string.format("Neovim %d.%d.%d", current.major, current.minor, current.patch),
      { string.format("PrismPunk requires Neovim >= %d.%d.%d", required[1], required[2], required[3]) }
    )
  end
end

local function check_config()
  health_start("Configuration")

  local ok, config = pcall(require, "prismpunk.config")
  if not ok then
    health_error("Failed to load config module", { tostring(config) })
    return
  end

  local opts = config.options

  if not opts then
    health_warn("Configuration not initialized", { "Run require('prismpunk').setup()" })
    return
  end

  health_ok("Configuration loaded")
  health_info(string.format("Theme: %s", opts.theme or "none"))
  if opts.cache then
    health_info(string.format("Cache enabled: %s", tostring(opts.cache.enable)))
  end
  if opts.terminals then
    health_info(string.format("Terminals enabled: %s", tostring(opts.terminals.enabled)))
  end
end

local function check_modules()
  health_start("Core modules")

  local modules = {
    "prismpunk.palette",
    "prismpunk.loader",
    "prismpunk.core.highlights",
    "prismpunk.core.terminals",
    "prismpunk.utils.color",
    "prismpunk.utils.base16",
    "prismpunk.utils.hsluv",
  }

  for _, mod_path in ipairs(modules) do
    local ok, mod = pcall(require, mod_path)
    if ok then
      health_ok(mod_path)
    else
      health_error(mod_path, { tostring(mod) })
    end
  end
end

local function check_cache()
  health_start("Cache")

  local cache_root = vim.fn.stdpath("cache") .. "/prismpunk"

  if vim.fn.isdirectory(cache_root) == 1 then
    health_ok(string.format("Cache directory exists: %s", cache_root))

    local palette_cache = cache_root .. "/palettes"
    local highlight_cache = cache_root .. "/highlights"

    local palette_count = vim.fn.len(vim.fn.glob(palette_cache .. "/*.lua", false, true))
    local highlight_count = vim.fn.len(vim.fn.glob(highlight_cache .. "/*.lua", false, true))

    health_info(string.format("Cached palettes: %d", palette_count))
    health_info(string.format("Cached highlights: %d", highlight_count))
  else
    health_info(string.format("Cache directory will be created on first use: %s", cache_root))
  end

  local test_dir = cache_root .. "/.health_test"
  local ok = pcall(vim.fn.mkdir, test_dir, "p")
  if ok then
    pcall(vim.fn.delete, test_dir, "rf")
    health_ok("Cache directory is writable")
  else
    health_warn("Cache directory may not be writable", { "Check permissions: " .. cache_root })
  end
end

local function check_terminals()
  health_start("Terminal integration")

  local ok, config = pcall(require, "prismpunk.config")
  if not ok or not config.options then
    health_warn("Configuration not loaded for terminal checks")
    return
  end

  local term_conf = config.options.terminals
  if not term_conf then
    health_info("Terminal integration not configured")
    return
  end

  if not term_conf.enabled then
    health_info("Terminal integration disabled")
    return
  end

  if term_conf.auto_detect then
    local core_ok, _ = pcall(require, "prismpunk.core.terminals")
    if core_ok then
      health_ok("Auto-detect enabled")
    else
      health_warn("Auto-detect enabled but prismpunk.core.terminals failed to load")
    end

    local term_program = vim.env.TERM_PROGRAM or vim.env.TERM or "unknown"
    health_info(string.format("Detected terminal: %s", term_program))
  end

  local enabled_terminals = {}
  for _, term_name in ipairs({ "alacritty", "kitty", "ghostty" }) do
    if term_conf[term_name] and term_conf[term_name].enabled then
      table.insert(enabled_terminals, term_name)
    end
  end

  if #enabled_terminals == 0 then
    health_info("No per-terminal configs (alacritty/kitty/ghostty) enabled")
    return
  end

  local common_ok, common = pcall(require, "prismpunk.core.terminals.common")
  if not common_ok then
    health_info("prismpunk.core.terminals.common not available; skipping per-terminal path checks")
    return
  end

  for _, term_name in ipairs(enabled_terminals) do
    local t = term_conf[term_name]
    local path = t.path or common.get_default_path(term_name)

    if path then
      local dir = vim.fn.fnamemodify(path, ":h")
      if vim.fn.isdirectory(dir) == 1 then
        health_ok(string.format("%s: %s", term_name, path))
      else
        health_warn(
          string.format("%s: directory does not exist", term_name),
          { string.format("Create or adjust directory: %s", dir) }
        )
      end
    else
      health_warn(
        string.format("%s: no path configured", term_name),
        { "Set path in config.terminals." .. term_name .. ".path" }
      )
    end
  end
end

local function check_theme()
  health_start("Theme loading")

  local ok, config = pcall(require, "prismpunk.config")
  if not ok or not config.options then
    health_warn("Configuration not loaded")
    return
  end

  local theme = config.options.theme
  if not theme or theme == "" then
    health_info("No theme configured")
    return
  end

  local ok_loader, loader = pcall(require, "prismpunk.loader")
  if not ok_loader then
    health_error("Failed to load prismpunk.loader", { tostring(loader) })
    return
  end

  local success, result = loader.load(theme, { force_reload = false })

  if success then
    health_ok(string.format("Theme loaded: %s", theme))

    local stats_ok, stats = pcall(loader.get_cache_stats)
    if stats_ok and stats then
      health_info(
        string.format(
          "Cache stats - Palette: %d hits/%d misses, Highlights: %d hits/%d misses",
          stats.palette_hits or 0,
          stats.palette_misses or 0,
          stats.highlight_hits or 0,
          stats.highlight_misses or 0
        )
      )
    end
  else
    health_error(string.format("Failed to load theme: %s", theme), { tostring(result) })
  end
end

function M.check()
  check_nvim_version()
  check_config()
  check_modules()
  check_cache()
  check_terminals()
  check_theme()
end

return M
