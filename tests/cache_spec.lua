--- Tests for prismpunk.core.cache module
local describe = describe
local it = it
local assert = assert

describe("prismpunk.core.cache", function()
  local cache = require("prismpunk.core.cache")

  describe("new()", function()
    it("creates a new cache instance", function()
      local c = cache.new({ namespace = "test" })
      assert.is_not_nil(c)
      assert.is_table(c)
    end)

    it("creates independent cache instances", function()
      local c1 = cache.new({ namespace = "test1" })
      local c2 = cache.new({ namespace = "test2" })

      c1:set("key", "value1")
      c2:set("key", "value2")

      assert.are.equal("value1", c1:get("key"))
      assert.are.equal("value2", c2:get("key"))
    end)
  end)

  describe("get() and set()", function()
    it("stores and retrieves values", function()
      local c = cache.new({ namespace = "test", enable_disk = false })
      c:set("mykey", { data = "myvalue" })

      local value = c:get("mykey")
      assert.is_table(value)
      assert.are.equal("myvalue", value.data)
    end)

    it("returns nil for missing keys", function()
      local c = cache.new({ namespace = "test", enable_disk = false })
      local value = c:get("nonexistent")
      assert.is_nil(value)
    end)

    it("returns source as second return value", function()
      local c = cache.new({ namespace = "test", enable_disk = false })
      c:set("key", "value")
      local _, source = c:get("key")
      assert.are.equal("memory", source)
    end)
  end)

  describe("has()", function()
    it("returns true for existing keys", function()
      local c = cache.new({ namespace = "test", enable_disk = false })
      c:set("key", "value")
      assert.is_true(c:has("key"))
    end)

    it("returns false for missing keys", function()
      local c = cache.new({ namespace = "test", enable_disk = false })
      assert.is_false(c:has("missing"))
    end)
  end)

  describe("delete()", function()
    it("removes a key from cache", function()
      local c = cache.new({ namespace = "test", enable_disk = false })
      c:set("key", "value")
      assert.is_true(c:has("key"))

      c:delete("key")
      assert.is_false(c:has("key"))
    end)
  end)

  describe("clear()", function()
    it("removes all keys from cache", function()
      local c = cache.new({ namespace = "test", enable_disk = false })
      c:set("key1", "value1")
      c:set("key2", "value2")
      c:set("key3", "value3")

      c:clear()

      assert.is_false(c:has("key1"))
      assert.is_false(c:has("key2"))
      assert.is_false(c:has("key3"))
    end)
  end)

  describe("stats_snapshot()", function()
    it("tracks hits and misses", function()
      local c = cache.new({ namespace = "test", enable_disk = false })
      c:set("key", "value")

      c:get("key") -- hit
      c:get("key") -- hit
      c:get("missing") -- miss

      local stats = c:stats_snapshot()
      assert.are.equal(2, stats.hits)
      assert.are.equal(1, stats.misses)
    end)

    it("includes namespace in stats", function()
      local c = cache.new({ namespace = "mynamespace", enable_disk = false })
      local stats = c:stats_snapshot()
      assert.are.equal("mynamespace", stats.namespace)
    end)
  end)

  describe("get_instance()", function()
    it("returns the same instance for the same name", function()
      local c1 = cache.get_instance("shared")
      local c2 = cache.get_instance("shared")
      assert.are.equal(c1, c2)
    end)

    it("creates new instance if not exists", function()
      cache._instances = {}
      local c = cache.get_instance("newone")
      assert.is_not_nil(c)
    end)
  end)

  describe("hash()", function()
    it("generates consistent hash for same input", function()
      local h1 = cache.hash({ "a", "b", "c" })
      local h2 = cache.hash({ "a", "b", "c" })
      assert.are.equal(h1, h2)
    end)

    it("generates different hash for different input", function()
      local h1 = cache.hash({ "a", "b", "c" })
      local h2 = cache.hash({ "x", "y", "z" })
      assert.are_not.equal(h1, h2)
    end)
  end)
end)
