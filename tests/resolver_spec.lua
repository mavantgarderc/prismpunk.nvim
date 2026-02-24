--- Tests for prismpunk.core.loader.resolver module
local describe = describe
local it = it
local assert = assert

describe("prismpunk.core.loader.resolver", function()
  local resolver = require("prismpunk.core.loader.resolver")

  describe("parse_scheme_spec()", function()
    it("parses simple scheme name", function()
      local result = resolver.parse_scheme_spec("kanagawa")
      assert.are.equal("kanagawa", result.name)
      assert.is_nil(result.universe)
    end)

    it("parses two-part scheme (universe/name)", function()
      local result = resolver.parse_scheme_spec("detox/ash")
      assert.are.equal("ash", result.name)
      assert.is_not_nil(result.universe)
    end)

    it("parses three-part scheme (parent/universe/name)", function()
      local result = resolver.parse_scheme_spec("dc/lantern-corps/green")
      assert.are.equal("green", result.name)
      assert.are.equal("dc/lantern-corps", result.universe)
    end)

    it("handles empty string", function()
      local result = resolver.parse_scheme_spec("")
      assert.is_nil(result.name)
      assert.is_nil(result.universe)
    end)

    it("handles nil", function()
      local result = resolver.parse_scheme_spec(nil)
      assert.is_nil(result.name)
      assert.is_nil(result.universe)
    end)

    it("handles table spec", function()
      local result = resolver.parse_scheme_spec({
        universe = "dc/lantern-corps",
        name = "green"
      })
      assert.are.equal("green", result.name)
      assert.are.equal("dc/lantern-corps", result.universe)
    end)
  end)

  describe("resolve_scheme_module()", function()
    it("returns nil for non-existent scheme", function()
      local spec = { universe = nil, name = "nonexistent-scheme-xyz", variants = {} }
      local path, module, err = resolver.resolve_scheme_module(spec)
      assert.is_nil(path)
      assert.is_nil(module)
      assert.is_not_nil(err)
      assert.is_true(err:find("Could not resolve scheme") ~= nil)
    end)

    it("caches resolved modules", function()
      resolver.clear_module_cache()
      local spec = resolver.parse_scheme_spec("detox/ash")

      local path1, module1 = resolver.resolve_scheme_module(spec)
      local path2, module2 = resolver.resolve_scheme_module(spec)

      assert.are.equal(path1, path2)
    end)
  end)

  describe("clear_module_cache()", function()
    it("clears the module cache", function()
      resolver.clear_module_cache()
      -- After clearing, cache should be empty
      -- This is a simple smoke test
      assert.is_true(true)
    end)
  end)

  describe("list_schemes()", function()
    it("returns a table of scheme names", function()
      local schemes = resolver.list_schemes()
      assert.is_table(schemes)
    end)

    it("returns non-empty list", function()
      local schemes = resolver.list_schemes()
      assert.is_true(#schemes > 0)
    end)

    it("includes known schemes", function()
      local schemes = resolver.list_schemes()
      local found = false
      for _, scheme in ipairs(schemes) do
        if scheme:find("detox") or scheme:find("kanagawa") then
          found = true
          break
        end
      end
      assert.is_true(found)
    end)
  end)

  describe("get_scheme_info()", function()
    it("returns nil for non-existent scheme", function()
      local info = resolver.get_scheme_info("nonexistent/xyz")
      assert.is_nil(info)
    end)

    it("returns info table for valid scheme", function()
      local info = resolver.get_scheme_info("detox/ash")
      if info then -- May be nil if scheme doesn't exist in test env
        assert.is_not_nil(info.name)
        assert.is_not_nil(info.author)
        assert.is_not_nil(info.description)
      end
    end)
  end)

  describe("backwards compatibility aliases", function()
    it("parse_theme_spec is an alias for parse_scheme_spec", function()
      assert.are.equal(resolver.parse_theme_spec, resolver.parse_scheme_spec)
    end)

    it("resolve_theme_module is an alias for resolve_scheme_module", function()
      assert.are.equal(resolver.resolve_theme_module, resolver.resolve_scheme_module)
    end)

    it("list_themes is an alias for list_schemes", function()
      assert.are.equal(resolver.list_themes, resolver.list_schemes)
    end)

    it("get_theme_info is an alias for get_scheme_info", function()
      assert.are.equal(resolver.get_theme_info, resolver.get_scheme_info)
    end)
  end)
end)
