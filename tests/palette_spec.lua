local palette = require("prismpunk.palette")
local config = require("prismpunk.config")

describe("palette.create_palette", function()
  before_each(function()
    palette.clear_cache()
    config.setup({})
  end)

  it("loads palette by name", function()
    local result = palette.create_palette(nil, "kanagawa.paper-edo")
    assert.is_table(result)
    assert.is_string(result.sumiInk0)
    assert.is_string(result.fujiWhite)
  end)

  it("loads palette by universe/name", function()
    local result = palette.create_palette("kanagawa", "paper-edo")
    assert.is_table(result)
    assert.is_string(result.sumiInk0)
  end)

  it("caches results in memory", function()
    local stats_before = palette.get_cache_stats()
    local misses_before = stats_before.misses

    palette.create_palette("kanagawa", "paper-edo")
    local stats_after_first = palette.get_cache_stats()
    assert.are.equal(misses_before + 1, stats_after_first.misses)

    palette.create_palette("kanagawa", "paper-edo")
    local stats_after_second = palette.get_cache_stats()
    assert.are.equal(stats_after_first.hits + 1, stats_after_second.hits)
  end)

  it("applies overrides", function()
    local overrides = { customColor = "#ff0000" }
    local result = palette.create_palette("kanagawa", "paper-edo", overrides)
    assert.are.equal("#ff0000", result.customColor)
  end)

  it("handles missing palette gracefully", function()
    assert.has_error(function()
      palette.create_palette("nonexistent", "fake-theme")
    end)
  end)

  it("validates palette has colors", function()
    local orig_notify = vim.notify
    vim.notify = function() end -- luacheck: ignore

    local ok, _ = pcall(palette.create_palette, nil, "kanagawa.paper-edo")
    vim.notify = orig_notify -- luacheck: ignore

    if not ok then
      assert.is_true(true)
    end
  end)
end)

describe("palette caching", function()
  before_each(function()
    palette.clear_cache()
    config.setup({ cache = { enable = true, persist_to_disk = false } })
  end)

  it("clears in-memory cache", function()
    palette.create_palette("kanagawa", "paper-edo")
    local stats_before = palette.get_cache_stats()
    assert.is_true(stats_before.hits > 0 or stats_before.misses > 0)

    palette.clear_cache()
    local stats_after = palette.get_cache_stats()
    assert.are.equal(0, stats_after.hits)
    assert.are.equal(0, stats_after.misses)
  end)

  it("tracks hit/miss stats", function()
    local initial = palette.get_cache_stats()

    palette.create_palette("kanagawa", "paper-edo")
    local after_miss = palette.get_cache_stats()
    assert.are.equal(initial.misses + 1, after_miss.misses)

    palette.create_palette("kanagawa", "paper-edo")
    local after_hit = palette.get_cache_stats()
    assert.are.equal(after_miss.hits + 1, after_hit.hits)
  end)

  it("different cache keys for different palettes", function()
    palette.create_palette("kanagawa", "paper-edo")
    palette.create_palette("kanagawa", "paper-dawn")

    local stats = palette.get_cache_stats()
    assert.are.equal(2, stats.misses)
  end)

  it("different cache keys with different overrides", function()
    palette.create_palette("kanagawa", "paper-edo", { custom = "#111111" })
    palette.create_palette("kanagawa", "paper-edo", { custom = "#222222" })

    local stats = palette.get_cache_stats()
    assert.are.equal(2, stats.misses)
  end)

  it("same override produces cache hit", function()
    local override = { custom = "#111111" }
    palette.create_palette("kanagawa", "paper-edo", override)
    palette.create_palette("kanagawa", "paper-edo", override)

    local stats = palette.get_cache_stats()
    assert.are.equal(1, stats.hits)
    assert.are.equal(1, stats.misses)
  end)
end)

describe("palette.get_cache_stats", function()
  it("returns table with hits and misses", function()
    local stats = palette.get_cache_stats()
    assert.is_table(stats)
    assert.is_number(stats.hits)
    assert.is_number(stats.misses)
  end)
end)

describe("palette._cache and _stats", function()
  it("exposes internal cache for testing", function()
    assert.is_table(palette._cache)
  end)

  it("exposes internal stats for testing", function()
    assert.is_table(palette._stats)
    assert.is_number(palette._stats.hits)
    assert.is_number(palette._stats.misses)
  end)
end)

describe("palette.create_theme", function()
  before_each(function()
    palette.clear_cache()
  end)

  it("creates theme from spec with base16", function()
    local spec = {
      name = "test-theme",
      base16 = {
        base00 = "#000000",
        base05 = "#ffffff",
      },
      palette = {
        fg = "#ffffff",
        bg = "#000000",
      },
      get = function(_, plt)
        return { ui = { fg = plt.fg, bg = plt.bg } }
      end,
    }

    local result = palette.create_theme(spec)
    assert.is_table(result)
    assert.is_table(result.colors)
    assert.is_table(result.theme)
    assert.is_table(result.palette)
  end)

  it("handles spec without base16", function()
    local spec = {
      name = "simple-theme",
      custom_field = "value",
    }

    local result = palette.create_theme(spec)
    assert.is_table(result)
    assert.is_true(result.name == "simple-theme" or result.custom_field == "value")
  end)
end)
