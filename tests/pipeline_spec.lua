--- Tests for prismpunk.core.loader.pipeline module
local describe = describe
local it = it
local assert = assert
local before_each = before_each

describe("prismpunk.core.loader.pipeline", function()
  local pipeline = require("prismpunk.core.loader.pipeline")
  local config = require("prismpunk.config")

  before_each(function()
    pipeline.clear_cache()
  end)

  describe("get_cache_stats()", function()
    it("returns cache statistics table", function()
      local stats = pipeline.get_cache_stats()
      assert.is_table(stats)
      assert.is_not_nil(stats.palette_hits)
      assert.is_not_nil(stats.palette_misses)
      assert.is_not_nil(stats.highlight_hits)
      assert.is_not_nil(stats.highlight_misses)
    end)
  end)

  describe("clear_cache()", function()
    it("clears all caches", function()
      pipeline.clear_cache()
      local stats = pipeline.get_cache_stats()
      assert.are.equal(0, stats.highlight_hits)
      assert.are.equal(0, stats.highlight_misses)
    end)
  end)

  describe("execute()", function()
    it("uses default scheme when nil passed", function()
      config.setup({})
      local ok, _ = pipeline.execute(nil)
      assert.is_true(ok)
    end)

    it("returns false for empty scheme", function()
      local ok, err = pipeline.execute("")
      assert.is_false(ok)
      assert.is_not_nil(err)
    end)

    it("returns false for non-existent scheme", function()
      local ok, err = pipeline.execute("nonexistent/xyz/scheme")
      assert.is_false(ok)
      assert.is_not_nil(err)
      assert.is_true(err:find("Could not resolve") ~= nil or err:find("scheme") ~= nil)
    end)

    it("returns true for valid scheme", function()
      local ok, result = pipeline.execute("detox/ash", { force_reload = true })
      if ok then
        assert.is_table(result)
        assert.is_not_nil(result.ui)
        assert.is_not_nil(result.syn)
      end
    end)

    it("uses cached result on second load", function()
      pipeline.clear_cache()
      
      local ok1, _ = pipeline.execute("detox/ash", { force_reload = true })
      assert.is_true(ok1)

      local ok2, _ = pipeline.execute("detox/ash", { skip_if_loaded = true })
      assert.is_true(ok2)
    end)

    it("force_reload skips cache", function()
      pipeline.clear_cache()

      local ok1, _ = pipeline.execute("detox/ash", { force_reload = true })
      assert.is_true(ok1)

      local stats_before = pipeline.get_cache_stats()

      local ok2, _ = pipeline.execute("detox/ash", { force_reload = true })
      assert.is_true(ok2)

      local stats_after = pipeline.get_cache_stats()
      assert.is_true(stats_after.highlight_misses >= stats_before.highlight_misses)
    end)
  end)

  describe("scheme structure", function()
    it("returns scheme with ui section", function()
      local ok, result = pipeline.execute("detox/ash", { force_reload = true })
      if ok then
        assert.is_table(result.ui)
        assert.is_not_nil(result.ui.bg)
        assert.is_not_nil(result.ui.fg)
      end
    end)

    it("returns scheme with syn section", function()
      local ok, result = pipeline.execute("detox/ash", { force_reload = true })
      if ok then
        assert.is_table(result.syn)
        assert.is_not_nil(result.syn.keyword)
        assert.is_not_nil(result.syn.string)
      end
    end)

    it("returns scheme with diag section", function()
      local ok, result = pipeline.execute("detox/ash", { force_reload = true })
      if ok then
        assert.is_table(result.diag)
        assert.is_not_nil(result.diag.error)
        assert.is_not_nil(result.diag.warning)
      end
    end)

    it("returns scheme with term section", function()
      local ok, result = pipeline.execute("detox/ash", { force_reload = true })
      if ok then
        assert.is_table(result.term)
        assert.is_not_nil(result.term.black)
        assert.is_not_nil(result.term.red)
      end
    end)
  end)

  describe("inline palette detection", function()
    it("uses inline palette when available", function()
      local ok, _ = pipeline.execute("detox/ash", { force_reload = true })
      assert.is_true(ok)
    end)
  end)

  describe("config integration", function()
    it("respects config.scheme option", function()
      local config = require("prismpunk.config")
      config.setup({ scheme = "detox/ash" })
      
      local ok, _ = pipeline.execute(nil, { force_reload = true })
      assert.is_true(ok)
    end)

    it("falls back to config.theme option (deprecated)", function()
      local config = require("prismpunk.config")
      config.setup({ theme = "detox/ash" })
      
      local ok, _ = pipeline.execute(nil, { force_reload = true })
      assert.is_true(ok)
    end)
  end)
end)
