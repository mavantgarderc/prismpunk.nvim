--- PrismPunk configuration management
--- Handles validation, merging, and theme spec parsing
local M = {}

--- Default configuration schema
M.defaults = {
  debug = {
    enabled = false,
    profile_startup = false,
  },

  theme = nil, -- Theme name (e.g., "phantom-corrupted" or "lantern-corps/phantom-corrupted")
  gutter = true, -- Enable gutter background
  validate_contrast = false, -- Validate color contrast (opt-in)

  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    parameters = {},
    types = {},
    constants = {},

    diagnostics = {
      error = {},
      warn = {},
      info = {},
      hint = {},
      ok = {},
      underline = {},
      virtual_text = {},
    },

    git = {
      add = {},
      change = {},
      delete = {},
    },

    ui = {
      search = {},
      cursorline = {},
      statusline = {},
      winbar = {},
      floats = {},
      tabline = {},
      popup = {},
    },

    lsp = {
      references = {},
      inlay_hints = {},
      codelens = {},
    },
  },

  terminals = {
    enabled = true,
    auto_detect = true, -- Auto-detect terminal from environment
    emulator = {}, -- List of emulators to use
    alacritty = {
      enabled = false,
      path = nil, -- Auto-detect if nil
      config_path = nil, -- Alias for path
      auto_reload = false,
    },
    kitty = {
      enabled = false,
      path = nil,
      config_path = nil,
      auto_reload = false,
    },
    ghostty = {
      enabled = false,
      path = nil,
      config_path = nil,
      auto_reload = true,
    },
  },

  cache = {
    enable = true,
    persist_to_disk = true,
  },

  overrides = {
    colors = {}, -- Color overrides
    highlights = {}, -- Global highlight overrides
    themes = {}, -- Per-theme overrides { ["theme-name"] = { Normal = {...} } }
  },

  integrations = {}, -- Plugin integrations
  plugins = {}, -- Plugin-specific options
}

--- Current merged configuration
M.options = vim.tbl_deep_extend("force", {}, M.defaults)

--- Configuration schema for validation
local schema = {
  debug = {
    type = "table",
    fields = {
      enabled = { type = "boolean" },
      profile_startup = { type = "boolean" },
    },
  },

  theme = { type = { "string", "nil" } },
  gutter = { type = "boolean" },
  validate_contrast = { type = "boolean" },

  styles = {
    type = "table",
    fields = {
      comments = { type = "table" },
      keywords = { type = "table" },
      functions = { type = "table" },
      variables = { type = "table" },
      parameters = { type = "table" },
      types = { type = "table" },
      constants = { type = "table" },

      diagnostics = {
        type = "table",
        fields = {
          error = { type = "table" },
          warn = { type = "table" },
          info = { type = "table" },
          hint = { type = "table" },
          ok = { type = "table" },
          underline = { type = "table" },
          virtual_text = { type = "table" },
        },
      },

      git = {
        type = "table",
        fields = {
          add = { type = "table" },
          change = { type = "table" },
          delete = { type = "table" },
        },
      },

      ui = {
        type = "table",
        fields = {
          search = { type = "table" },
          cursorline = { type = "table" },
          statusline = { type = "table" },
          winbar = { type = "table" },
          floats = { type = "table" },
          tabline = { type = "table" },
          popup = { type = "table" },
        },
      },

      lsp = {
        type = "table",
        fields = {
          references = { type = "table" },
          inlay_hints = { type = "table" },
          codelens = { type = "table" },
        },
      },
    },
  },

  terminals = {
    type = "table",
    fields = {
      enabled = { type = "boolean" },
      auto_detect = { type = "boolean" },
      emulator = { type = "table" },
      alacritty = {
        type = "table",
        fields = {
          enabled = { type = "boolean" },
          path = { type = { "string", "nil" } },
          config_path = { type = { "string", "nil" } },
          auto_reload = { type = "boolean" },
        },
      },
      kitty = {
        type = "table",
        fields = {
          enabled = { type = "boolean" },
          path = { type = { "string", "nil" } },
          config_path = { type = { "string", "nil" } },
          auto_reload = { type = "boolean" },
        },
      },
      ghostty = {
        type = "table",
        fields = {
          enabled = { type = "boolean" },
          path = { type = { "string", "nil" } },
          config_path = { type = { "string", "nil" } },
          auto_reload = { type = "boolean" },
        },
      },
    },
  },

  cache = {
    type = "table",
    fields = {
      enable = { type = "boolean" },
      persist_to_disk = { type = "boolean" },
    },
  },

  overrides = {
    type = "table",
    fields = {
      colors = { type = "table" },
      highlights = { type = "table" },
      themes = { type = "table" },
    },
  },

  integrations = { type = "table" },
  plugins = { type = "table" },
}

--- Validate value against schema type(s)
--- @param value any
--- @param allowed_types table|string
--- @return boolean, string|nil
local function validate_type(value, allowed_types)
  if type(allowed_types) == "string" then allowed_types = { allowed_types } end

  local value_type = type(value)
  if value == nil then value_type = "nil" end

  for _, allowed in ipairs(allowed_types) do
    if value_type == allowed then return true end
  end

  return false, table.concat(allowed_types, " or ")
end

--- Validate configuration against schema
--- @param cfg table Configuration to validate
--- @param sch table Schema definition
--- @param path string Current path for error messages
--- @return boolean, string|nil
local function validate_config(cfg, sch, path)
  path = path or "config"

  if not cfg or type(cfg) ~= "table" then return false, string.format("[prismpunk] %s must be a table", path) end

  for key, value in pairs(cfg) do
    local field_schema = sch[key]

    if not field_schema then
      -- Unknown key - warn but don't error
      vim.notify(string.format("[prismpunk] Unknown config key: %s.%s", path, key), vim.log.levels.WARN)
      goto continue
    end

    -- Validate type
    local valid, expected = validate_type(value, field_schema.type)
    if not valid then
      return false, string.format("[prismpunk] %s.%s must be %s, got %s", path, key, expected, type(value))
    end

    -- Recursively validate nested tables
    if type(value) == "table" and field_schema.fields then
      local nested_valid, nested_err = validate_config(value, field_schema.fields, path .. "." .. key)
      if not nested_valid then return false, nested_err end
    end

    ::continue::
  end

  return true
end

--- Setup configuration with user overrides
--- @param user_config table|nil User configuration
--- @return table Merged configuration
function M.setup(user_config)
  user_config = user_config or {}

  -- Validate user config
  local valid, err = validate_config(user_config, schema)
  if not valid then error(err) end

  -- Deep merge with defaults
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, user_config)

  return M.options
end

--- Parse theme specification into normalized form
--- Auto-discovers themes by checking filesystem
--- @param theme_spec string|table|nil
--- @return table Normalized spec { universe = string|nil, name = string, variants = table }
--- Parse theme specification (SIMPLE & RELIABLE VERSION)
function M.parse_theme(theme_spec)
  if not theme_spec or theme_spec == "" then return { universe = nil, name = nil, variants = {} } end

  if type(theme_spec) == "string" then
    local variants = {}

    -- Split by slashes
    local parts = vim.split(theme_spec, "/")

    if #parts == 3 then
      -- Format: "dc/lantern-corps/phantom-corrupted"
      local universe = parts[1] .. "/" .. parts[2]
      local name = parts[3]
      table.insert(variants, { universe = universe, name = name })
      return { universe = universe, name = name, variants = variants }
    elseif #parts == 2 then
      -- Format: "lantern-corps/phantom-corrupted" or "kanagawa/paper-sunset"
      local category = parts[1]
      local name = parts[2]

      -- Special handling for known categories
      if category == "lantern-corps" or category == "ultraviolet" then
        -- These belong to dc universe
        local universe = "dc/" .. category
        table.insert(variants, { universe = universe, name = name })
        return { universe = universe, name = name, variants = variants }
      else
        -- Others (like kanagawa) are their own universe
        table.insert(variants, { universe = category, name = name })
        return { universe = category, name = name, variants = variants }
      end
    else
      -- Plain name (no slashes)
      return { universe = nil, name = theme_spec, variants = {} }
    end
  elseif type(theme_spec) == "table" then
    return {
      universe = theme_spec.universe,
      name = theme_spec.name or theme_spec[1],
      opts = theme_spec.opts or {},
      variants = {},
    }
  else
    error(string.format("[prismpunk] Invalid theme_spec type: %s (expected string or table)", type(theme_spec)))
  end
end

return M
