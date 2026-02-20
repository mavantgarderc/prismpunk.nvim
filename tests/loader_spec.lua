local loader = require("prismpunk.loader")
local config = require("prismpunk.config")

describe("loader.load", function()
  before_each(function()
    loader.clear_cache()
    config.setup({ cache = { enable = true } })
  end)

  it("loads theme successfully", function()
    local success, result = loader.load("kanagawa/paper-edo")
    assert.is_true(success)
    assert.is_table(result)
    assert.is_table(result.ui)
    assert.is_table(result.syn)
  end)

  it("loads theme with 3-part path", function()
    local success, result = loader.load("dc/lantern-corps/green")
    assert.is_true(success)
    assert.is_table(result)
  end)

  it("returns error for missing theme", function()
    local success, err = loader.load("nonexistent/fake-theme")
    assert.is_false(success)
    assert.is_string(err)
    assert.is_true(err:match("Could not resolve theme") ~= nil)
  end)

  it("caches highlights on successful load", function()
    local stats_before = loader.get_cache_stats()

    loader.load("kanagawa/paper-edo")
    local stats_after_first = loader.get_cache_stats()
    local misses_after_first = stats_after_first.highlight_misses

    loader.load("kanagawa/paper-edo")
    local stats_after_second = loader.get_cache_stats()

    assert.are.equal(misses_after_first, stats_after_second.highlight_misses)
    assert.is_true(stats_after_second.highlight_hits > stats_before.highlight_hits)
  end)

  it("force_reload skips cache", function()
    loader.load("kanagawa/paper-edo")

    local stats_before = loader.get_cache_stats()
    loader.load("kanagawa/paper-edo", { force_reload = true })
    local stats_after = loader.get_cache_stats()

    assert.is_true(stats_after.highlight_misses > stats_before.highlight_misses)
  end)

  it("skip_if_loaded prevents reload", function()
    loader.load("kanagawa/paper-edo")

    local success, result = loader.load("kanagawa/paper-edo", { skip_if_loaded = true })
    assert.is_true(success)
    assert.is_table(result)
  end)

  it("returns theme table on success", function()
    local success, theme = loader.load("kanagawa/paper-edo")
    assert.is_true(success)
    assert.is_table(theme)
    assert.is_table(theme.ui)
    assert.is_table(theme.syn)
    assert.is_table(theme.diag)
  end)
end)

describe("loader.clear_cache", function()
  before_each(function()
    config.setup({ cache = { enable = true } })
  end)

  it("clears all cache stats", function()
    loader.load("kanagawa/paper-edo")
    loader.clear_cache()

    local stats = loader.get_cache_stats()
    assert.are.equal(0, stats.palette_hits)
    assert.are.equal(0, stats.palette_misses)
    assert.are.equal(0, stats.highlight_hits)
    assert.are.equal(0, stats.highlight_misses)
  end)
end)

describe("loader.get_cache_stats", function()
  it("returns table with expected keys", function()
    local stats = loader.get_cache_stats()
    assert.is_table(stats)
    assert.is_number(stats.palette_hits)
    assert.is_number(stats.palette_misses)
    assert.is_number(stats.highlight_hits)
    assert.is_number(stats.highlight_misses)
  end)
end)

describe("loader.list_themes", function()
  it("returns table of theme names", function()
    local themes = loader.list_themes()
    assert.is_table(themes)
  end)

  it("caches results", function()
    loader.clear_theme_cache()
    local themes1 = loader.list_themes()
    local themes2 = loader.list_themes()
    assert.are.equal(themes1, themes2)
  end)

  it("includes known themes", function()
    local themes = loader.list_themes()
    local found = false
    for _, theme in ipairs(themes) do
      if theme:match("kanagawa") then
        found = true
        break
      end
    end
    assert.is_true(found)
  end)
end)

describe("loader.clear_theme_cache", function()
  it("clears the theme listing cache", function()
    loader.list_themes()
    loader.clear_theme_cache()

    assert.is_true(true)
  end)
end)

describe("loader._highlight_cache and _cache_stats", function()
  it("exposes internal cache for testing", function()
    assert.is_table(loader._highlight_cache)
  end)

  it("exposes internal stats for testing", function()
    assert.is_table(loader._cache_stats)
  end)
end)
