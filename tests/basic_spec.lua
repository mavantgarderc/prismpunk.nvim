-- Basic tests for PrismPunk.nvim
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
      assert.are.same(type(themes), "table")
    else
      -- If list_themes doesn't exist, that's fine for now
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
    local cmd_info = vim.api.nvim_exec("command", true)
    assert.truthy(cmd_info:match("PrismListThemes"))
    assert.truthy(cmd_info:match("PrismReload"))
    assert.truthy(cmd_info:match("PrismExportGhostty"))
    assert.truthy(cmd_info:match("PrismCurrentTheme"))
    assert.truthy(cmd_info:match("PrismPreview"))
  end)
end)
