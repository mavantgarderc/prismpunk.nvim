local terminals = require("prismpunk.core.terminals")
local palette = require("prismpunk.palette")
local config = require("prismpunk.config")

describe("terminals.get_palette", function()
  before_each(function()
    config.setup({})
  end)

  it("loads theme palette by name", function()
    local result = terminals.get_palette("kanagawa/paper-edo")
    assert.is_table(result)
    assert.is_table(result.palette)
    assert.is_table(result.base16)
  end)

  it("returns metadata with theme info", function()
    local result = terminals.get_palette("kanagawa/paper-edo")
    assert.is_table(result.metadata)
    assert.is_string(result.metadata.name)
  end)
end)

describe("terminals.export", function()
  it("exports ghostty config", function()
    local ghostty = require("prismpunk.core.terminals.ghostty")
    local result = ghostty.export("kanagawa/paper-edo")
    assert.is_string(result)
    assert.is_true(result:match("palette") ~= nil)
  end)

  it("exports kitty config", function()
    local kitty = require("prismpunk.core.terminals.kitty")
    local result = kitty.export("kanagawa/paper-edo")
    assert.is_string(result)
    assert.is_true(result:match("background") ~= nil)
  end)

  it("exports alacritty config", function()
    local alacritty = require("prismpunk.core.terminals.alacritty")
    local result = alacritty.export("kanagawa/paper-edo")
    assert.is_string(result)
    assert.is_true(result:match("colors") ~= nil)
  end)
end)

describe("terminals.write_config", function()
  it("writes ghostty config to file", function()
    local ghostty = require("prismpunk.core.terminals.ghostty")
    local tmp_path = "/tmp/prismpunk-test-ghostty.toml"
    local ok = ghostty.save("kanagawa/paper-edo", tmp_path)
    assert.is_true(ok)
  end)

  it("writes kitty config to file", function()
    local kitty = require("prismpunk.core.terminals.kitty")
    local tmp_path = "/tmp/prismpunk-test-kitty.conf"
    local ok = kitty.save("kanagawa/paper-edo", tmp_path)
    assert.is_true(ok)
  end)

  it("writes alacritty config to file", function()
    local alacritty = require("prismpunk.core.terminals.alacritty")
    local tmp_path = "/tmp/prismpunk-test-alacritty.toml"
    local ok = alacritty.save("kanagawa/paper-edo", tmp_path)
    assert.is_true(ok)
  end)
end)

describe("terminals.auto_export", function()
  it("is a callable function", function()
    assert.is_function(terminals.auto_export)
  end)
end)

describe("terminals.apply", function()
  it("applies terminal colors to nvim", function()
    local theme = {
      colors = {
        base00 = "#1a1b26",
        base01 = "#1f2335",
        base02 = "#292e42",
        base03 = "#414868",
        base04 = "#565f89",
        base05 = "#c0caf5",
        base06 = "#a9b1d6",
        base07 = "#c0caf5",
        base08 = "#f7768e",
        base09 = "#ff9e64",
        base0A = "#e0af68",
        base0B = "#9ece6a",
        base0C = "#7dcfff",
        base0D = "#7aa2f7",
        base0E = "#bb9af7",
        base0F = "#9ece6a",
      },
    }
    local ok, err = pcall(terminals.apply, theme)
    assert.is_true(ok)
  end)
end)
