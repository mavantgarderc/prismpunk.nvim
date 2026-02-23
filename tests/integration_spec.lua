local prismpunk = require("prismpunk")
local loader = require("prismpunk.loader")
local config = require("prismpunk.config")

describe("full theme load cycle", function()
  before_each(function()
    loader.clear_cache()
    config.setup({ cache = { enable = true } })
  end)

  it("setup -> load -> highlights applied", function()
    local opts = prismpunk.setup({ theme = "kanagawa/paper-edo" })
    assert.is_table(opts)
    assert.are.equal("kanagawa/paper-edo", opts.theme)
  end)

  it("load returns valid theme structure", function()
    local success, theme = loader.load("kanagawa/paper-edo")
    assert.is_true(success)

    assert.is_table(theme.ui)
    assert.is_table(theme.syn)
    assert.is_table(theme.diag)
    assert.is_table(theme.diff)

    assert.is_string(theme.ui.fg)
    assert.is_string(theme.ui.bg)
    assert.is_string(theme.syn.keyword)
    assert.is_string(theme.syn.string)
  end)

  it("theme persists across multiple loads", function()
    loader.load("kanagawa/paper-edo")
    local success1, theme1 = loader.load("kanagawa/paper-edo", { skip_if_loaded = true })

    assert.is_true(success1)
    assert.is_table(theme1)
  end)

  it("overrides work end-to-end", function()
    local opts = {
      theme = "kanagawa/paper-edo",
      overrides = {
        colors = {
          custom = "#123456",
        },
      },
    }
    config.setup(opts)
    assert.are.equal("#123456", config.options.overrides.colors.custom)
  end)

  it("style options are preserved", function()
    local opts = {
      theme = "kanagawa/paper-edo",
      styles = {
        comments = { italic = true, bold = true },
        keywords = { bold = false },
      },
    }
    local result = config.setup(opts)

    assert.is_true(result.styles.comments.italic)
    assert.is_true(result.styles.comments.bold)
    assert.is_false(result.styles.keywords.bold)
  end)
end)

describe("theme resolution paths", function()
  it("resolves 2-part theme with known parent", function()
    local success, _ = loader.load("lantern-corps/green")
    assert.is_true(success)
  end)

  it("resolves 2-part theme without parent", function()
    local success, _ = loader.load("kanagawa/paper-edo")
    assert.is_true(success)
  end)

  it("resolves 3-part theme", function()
    local success, _ = loader.load("dc/lantern-corps/green")
    assert.is_true(success)
  end)

  it("resolves tmnt themes", function()
    local success, _ = loader.load("tmnt/leonardo")
    assert.is_true(success)
  end)
end)

describe("error recovery", function()
  it("returns error for invalid theme", function()
    local success, err = loader.load("invalid/universe/fake-theme")
    assert.is_false(success)
    assert.is_string(err)
  end)

  it("handles empty theme spec gracefully", function()
    local success, err = loader.load("")
    assert.is_false(success)
    assert.is_string(err)
    assert.is_true(err:match("No theme specified") ~= nil)
  end)

  it("handles nil theme spec gracefully", function()
    local success, err = loader.load(nil)
    assert.is_false(success)
    assert.is_string(err)
  end)
end)

describe("cache integration", function()
  before_each(function()
    loader.clear_cache()
    config.setup({ cache = { enable = true } })
  end)

  it("cache improves performance on second load", function()
    loader.load("kanagawa/paper-edo")
    local stats_after_first = loader.get_cache_stats()

    loader.load("kanagawa/paper-edo")
    local stats_after_second = loader.get_cache_stats()

    assert.is_true(stats_after_second.highlight_hits > stats_after_first.highlight_hits)
  end)

  it("clear_cache resets everything", function()
    loader.load("kanagawa/paper-edo")
    loader.clear_cache()

    local stats = loader.get_cache_stats()
    assert.are.equal(0, stats.palette_hits)
    assert.are.equal(0, stats.highlight_hits)
  end)
end)

describe("prismpunk public API", function()
  it("exposes setup function", function()
    assert.is_function(prismpunk.setup)
  end)

  it("exposes load function", function()
    assert.is_function(prismpunk.load)
  end)

  it("exposes apply_theme function", function()
    assert.is_function(prismpunk.apply_theme)
  end)

  it("exposes clear_cache function", function()
    assert.is_function(prismpunk.clear_cache)
  end)

  it("exposes cache_stats function", function()
    assert.is_function(prismpunk.cache_stats)
  end)

  it("exposes preview_terminal_config function", function()
    assert.is_function(prismpunk.preview_terminal_config)
  end)

  it("load returns success boolean and theme/error", function()
    local success, result = prismpunk.load("kanagawa/paper-edo")
    assert.is_boolean(success)
    assert.is_table(result)
  end)

  it("apply_theme delegates to load", function()
    local success, result = prismpunk.apply_theme("kanagawa/paper-edo")
    assert.is_boolean(success)
    assert.is_table(result)
  end)

  it("cache_stats returns statistics", function()
    prismpunk.load("kanagawa/paper-edo")
    local stats = prismpunk.cache_stats()
    assert.is_table(stats)
    assert.is_number(stats.palette_hits)
    assert.is_number(stats.highlight_hits)
  end)
end)

describe("command registration", function()
  it("registers PrismReload command", function()
    local cmd_info = vim.api.nvim_exec("command PrismReload", true)
    assert.is_true(cmd_info:match("PrismReload") ~= nil)
  end)

  it("registers PrismListThemes command", function()
    local cmd_info = vim.api.nvim_exec("command PrismListThemes", true)
    assert.is_true(cmd_info:match("PrismListThemes") ~= nil)
  end)

  it("registers PrismCurrentTheme command", function()
    local cmd_info = vim.api.nvim_exec("command PrismCurrentTheme", true)
    assert.is_true(cmd_info:match("PrismCurrentTheme") ~= nil)
  end)

  it("registers PrismLoad command", function()
    local cmd_info = vim.api.nvim_exec("command PrismLoad", true)
    assert.is_true(cmd_info:match("PrismLoad") ~= nil)
  end)

  it("registers PrismPreview command", function()
    local cmd_info = vim.api.nvim_exec("command PrismPreview", true)
    assert.is_true(cmd_info:match("PrismPreview") ~= nil)
  end)

  it("registers PrismCacheClear command", function()
    local cmd_info = vim.api.nvim_exec("command PrismCacheClear", true)
    assert.is_true(cmd_info:match("PrismCacheClear") ~= nil)
  end)

  it("registers PrismCacheStats command", function()
    local cmd_info = vim.api.nvim_exec("command PrismCacheStats", true)
    assert.is_true(cmd_info:match("PrismCacheStats") ~= nil)
  end)
end)
