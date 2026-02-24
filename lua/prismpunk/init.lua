--- PrismPunk.nvim - Main entry point
--- Public API for scheme management
local M = {}

local config = require("prismpunk.config")
local loader = require("prismpunk.loader")

--- Setup the plugin with user configuration
--- @param user_config table|nil User configuration overrides
--- @return table Merged configuration
--- @usage require("prismpunk").setup({ scheme = "phantom-corrupted" })
function M.setup(user_config)
  local opts = config.setup(user_config)

  local scheme_to_load = opts.scheme or opts.theme
  if opts and scheme_to_load then
    vim.g.colors_name = "prismpunk"
    vim.schedule(function()
      local success, err = loader.load(scheme_to_load, {
        force_reload = false,
        skip_if_loaded = false,
      })
      if not success then vim.notify("[prismpunk] Failed to load scheme: " .. tostring(err), vim.log.levels.ERROR) end
    end)
  end

  return opts
end

--- Apply scheme programmatically (for Raphael integration)
--- @param scheme_name string
function M.apply_scheme(scheme_name) return M.load(scheme_name, { force_reload = false }) end
M.apply_theme = M.apply_scheme

--- Load scheme from colorscheme command (skip if already loaded by setup)
--- @param scheme_spec string|table
--- @return boolean success
function M.load_colorscheme(scheme_spec)
  return loader.load(scheme_spec, {
    force_reload = false,
    skip_if_loaded = false,
  })
end

--- Load a scheme programmatically
--- @param scheme_spec string|table Scheme name or specification
--- @param opts table|nil Options { force_reload = boolean }
--- @return boolean success
--- @return table|string scheme_or_error
--- @usage require("prismpunk").load("phantom-corrupted", { force_reload = true })
function M.load(scheme_spec, opts) return loader.load(scheme_spec, opts or {}) end

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
--- @param scheme_name string Scheme to preview
--- @param terminal_name string Terminal emulator name (alacritty, kitty, ghostty)
--- @return string|nil config_content
function M.preview_terminal_config(scheme_name, terminal_name)
  local terminals = require("prismpunk.core.terminals")
  return terminals.preview(scheme_name, terminal_name)
end

--- Register user commands
local function register_commands()
  vim.api.nvim_create_user_command("PrismCacheClear", function() M.clear_cache() end, {
    desc = "Clear PrismPunk cache (palette + highlights)",
  })

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

  vim.api.nvim_create_user_command("PrismPreview", function(args)
    local parts = vim.split(args.args, "%s+")
    local scheme = parts[1]
    local terminal = parts[2] or "kitty"

    if not scheme then
      vim.notify("[prismpunk] Usage: :PrismPreview <scheme> [terminal]", vim.log.levels.WARN)
      return
    end

    local loader_ok, ldr = pcall(require, "prismpunk.loader")
    if loader_ok then
      local info = ldr.get_scheme_info(scheme)
      if info then
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
        vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
      end
    end

    local content = M.preview_terminal_config(scheme, terminal)
    if content then
      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
      vim.api.nvim_buf_set_option_value(buf, "filetype", terminal)
      vim.api.nvim_buf_set_option_value(buf, "bufhidden", "wipe")

      vim.cmd("new")
      local win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(win, buf)
    else
      vim.notify("[prismpunk] Failed to generate preview", vim.log.levels.ERROR)
    end
  end, {
    nargs = "+",
    desc = "Preview terminal config for scheme",
    complete = function() return { "alacritty", "kitty", "ghostty" } end,
  })

  vim.api.nvim_create_user_command("PrismLoad", function(args)
    local success, err = M.load(args.args, { force_reload = true })
    if not success then vim.notify("[prismpunk] " .. tostring(err), vim.log.levels.ERROR) end
  end, {
    nargs = 1,
    desc = "Load a PrismPunk scheme",
  })
end

register_commands()

return M
