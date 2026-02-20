--- PrismPunk.nvim - Main entry point
--- Public API for theme management
local M = {}

local config = require("prismpunk.config")
local loader = require("prismpunk.loader")

--- Setup the plugin with user configuration
--- @param user_config table|nil User configuration overrides
--- @return table Merged configuration
--- @usage require("prismpunk").setup({ theme = "phantom-corrupted" })
function M.setup(user_config)
  local opts = config.setup(user_config)

  -- Auto-load theme if specified (skip if already loaded by colorscheme command)
  if opts and opts.theme then
    vim.g.colors_name = "prismpunk" -- luacheck: ignore
    vim.schedule(function()
      local success, err = loader.load(opts.theme, {
        force_reload = false,
        skip_if_loaded = false,
      })
      if not success then vim.notify("[prismpunk] Failed to load theme: " .. tostring(err), vim.log.levels.ERROR) end
    end)
  end

  return opts
end

--- Apply theme programmatically (for Raphael integration)
--- @param theme_name string
function M.apply_theme(theme_name) return M.load(theme_name, { force_reload = false }) end

--- Load theme from colorscheme command (skip if already loaded by setup)
--- @param theme_spec string|table
--- @return boolean success
function M.load_colorscheme(theme_spec)
  return loader.load(theme_spec, {
    force_reload = false,
    skip_if_loaded = false,
  })
end

--- Load a theme programmatically
--- @param theme_spec string|table Theme name or specification
--- @param opts table|nil Options { force_reload = boolean }
--- @return boolean success
--- @return table|string theme_or_error
--- @usage require("prismpunk").load("phantom-corrupted", { force_reload = true })
function M.load(theme_spec, opts) return loader.load(theme_spec, opts or {}) end

--- Clear all plugin caches (palette + highlights)
--- @usage require("prismpunk").clear_cache()
function M.clear_cache()
  loader.clear_cache()
  vim.notify("[prismpunk] All caches cleared", vim.log.levels.INFO)
end

--- Get cache statistics
--- @return table Statistics { palette_hits, palette_misses, highlight_hits, highlight_misses }
function M.cache_stats() return loader.get_cache_stats() end

--- Preview terminal config without writing
--- @param theme_name string Theme to preview
--- @param terminal_name string Terminal emulator name (alacritty, kitty, ghostty)
--- @return string|nil config_content
function M.preview_terminal_config(theme_name, terminal_name)
  local terminals = require("prismpunk.core.terminals")
  return terminals.preview(theme_name, terminal_name)
end

--- Register user commands
local function register_commands()
  -- Clear cache command
  vim.api.nvim_create_user_command("PrismCacheClear", function() M.clear_cache() end, {
    desc = "Clear PrismPunk cache (palette + highlights)",
  })

  -- Cache stats command
  vim.api.nvim_create_user_command("PrismCacheStats", function()
    local stats = M.cache_stats()
    local msg = string.format(
      "Cache Statistics:\n  Palette: %d hits, %d misses\n  Highlights: %d hits, %d misses",
      stats.palette_hits,
      stats.palette_misses,
      stats.highlight_hits,
      stats.highlight_misses
    )
    vim.notify(msg, vim.log.levels.INFO)
  end, {
    desc = "Show PrismPunk cache statistics",
  })

  --- Preview terminal config without writing
  vim.api.nvim_create_user_command("PrismPreview", function(args)
    local parts = vim.split(args.args, "%s+")
    local theme = parts[1]
    local terminal = parts[2] or "kitty"

    if not theme then
      vim.notify("[prismpunk] Usage: :PrismPreview <theme> [terminal]", vim.log.levels.WARN)
      return
    end

    local content = M.preview_terminal_config(theme, terminal)
    if content then
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
      vim.api.nvim_buf_set_option_value(buf, "filetype", terminal)
      vim.api.nvim_buf_set_option_value(buf, "bufhidden", "wipe")

      -- FIX: Create new split instead of replacing current buffer
      vim.cmd("new")
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(win, buf)
    else
      vim.notify("[prismpunk] Failed to generate preview", vim.log.levels.ERROR)
    end
  end, {
    nargs = "+",
    desc = "Preview terminal config for theme",
    complete = function() return { "alacritty", "kitty", "ghostty" } end,
  })

  -- Load theme command
  vim.api.nvim_create_user_command("PrismLoad", function(args)
    local success, err = M.load(args.args, { force_reload = true })
    if not success then vim.notify("[prismpunk] " .. tostring(err), vim.log.levels.ERROR) end
  end, {
    nargs = 1,
    desc = "Load a PrismPunk theme",
  })
end

-- Auto-register commands on module load
register_commands()

return M
