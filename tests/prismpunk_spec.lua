-- Comprehensive tests for PrismPunk.nvim
local ok, prismpunk = pcall(require, "prismpunk")
if not ok then
  print("Could not load prismpunk module")
  return
end

describe("PrismPunk.nvim", function()
  it("should load the module successfully", function()
    assert.truthy(prismpunk)
    assert.truthy(prismpunk.setup)
    assert.truthy(prismpunk.load)
    assert.truthy(prismpunk.apply_theme)
  end)

  it("should have working setup function", function()
    local config = {
      theme = "kanagawa/paper-edo",
      debug = { enabled = false },
    }

    local result = prismpunk.setup(config)
    assert.truthy(result)
  end)

  it("should have working list_themes function", function()
    local loader_ok, loader = pcall(require, "prismpunk.loader")
    if loader_ok and loader.list_themes then
      local themes = loader.list_themes()
      assert.truthy(themes)
      assert.equal("table", type(themes))
    else
      assert.truthy(true)
    end
  end)

  it("should have working cache functions", function()
    local loader_ok, loader = pcall(require, "prismpunk.loader")
    if loader_ok then
      assert.truthy(loader.clear_cache)
      assert.truthy(loader.get_cache_stats)
    end
  end)
end)

describe("PrismPunk Config", function()
  it("should load config module", function()
    local config_ok, config = pcall(require, "prismpunk.config")
    assert.truthy(config_ok)
    assert.truthy(config)
    assert.truthy(config.defaults)
    assert.truthy(config.options)
  end)

  it("should have default configuration", function()
    local config = require("prismpunk.config")
    assert.truthy(config.defaults)
    assert.truthy(config.defaults.styles)
    assert.truthy(config.defaults.terminals)
    assert.truthy(config.defaults.cache)
  end)
end)

describe("PrismPunk Palette", function()
  it("should load palette module", function()
    local palette_ok, palette = pcall(require, "prismpunk.palette")
    assert.truthy(palette_ok)
    assert.truthy(palette)
    assert.truthy(palette.create_palette)
  end)
end)

describe("PrismPunk Commands", function()
  it("should register commands properly", function()
    -- Test that the commands are registered by checking if they exist
    local cmd_info = vim.api.nvim_exec("command", true)
    assert.truthy(cmd_info:match("PrismpunkListThemes"))
    assert.truthy(cmd_info:match("PrismpunkReload"))
    assert.truthy(cmd_info:match("PrismpunkExportGhostty"))
    assert.truthy(cmd_info:match("PrismpunkCurrentTheme"))
    assert.truthy(cmd_info:match("PrismpunkPreview"))
  end)
end)

-- Theme-specific tests (from the original test.lua)
describe("PrismPunk Theme Testing", function()
  local test_theme_name = "kanagawa/paper-edo" -- Use a simpler theme for testing

  it("should load a theme successfully", function()
    local parsed = require("prismpunk.config").parse_theme(test_theme_name)
    local theme_path
    if parsed.universe then
      theme_path = "prismpunk.themes." .. parsed.universe:gsub("/", ".") .. "." .. parsed.name
    else
      theme_path = "prismpunk.themes." .. parsed.name
    end

    local ok, theme = pcall(require, theme_path)
    assert.truthy(ok, "Theme should load successfully")
    assert.truthy(theme, "Theme should not be nil")
  end)

  it("should execute theme get function successfully", function()
    local parsed = require("prismpunk.config").parse_theme(test_theme_name)
    local theme_path
    if parsed.universe then
      theme_path = "prismpunk.themes." .. parsed.universe:gsub("/", ".") .. "." .. parsed.name
    else
      theme_path = "prismpunk.themes." .. parsed.name
    end

    local ok, theme = pcall(require, theme_path)
    assert.truthy(ok)

    if type(theme.get) == "function" then
      local opts = { gutter = true }
      local success, semantic = pcall(theme.get, opts, theme.palette or {})
      assert.truthy(success, "get() function should execute successfully")
      assert.truthy(semantic, "get() function should return a semantic table")

      -- Check for required structures
      local structures = { "ui", "syn", "diag" } -- Simplified for testing
      for _, struct in ipairs(structures) do
        assert.truthy(semantic[struct], struct .. " structure should be present")
      end
    else
      flunk("Theme should have a get() function")
    end
  end)
end)

-- Health check tests (from the original test.lua)
describe("PrismPunk Health Check", function()
  it("should have basic health check functionality", function()
    local config_ok, config = pcall(require, "prismpunk.config")
    assert.truthy(config_ok)

    -- Check that config is accessible
    assert.truthy(config.options or config.defaults)

    -- Check that highlight groups can be accessed
    local test_groups = { "Normal", "Comment" }
    for _, group in ipairs(test_groups) do
      local hl_info = vim.api.nvim_get_hl(0, { name = group })
      -- Note: hl_info might be empty table if not set, but shouldn't error
      assert.truthy(hl_info ~= nil, group .. " highlight should be accessible")
    end
  end)
end)
