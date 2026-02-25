# PrismPunk.nvim Theme Authoring Guide

## Overview

PrismPunk.nvim is a sophisticated Neovim colorscheme plugin featuring a multi-universe theme system. This guide will help you create beautiful, accessible themes that integrate seamlessly with PrismPunk's ecosystem.

## Theme Architecture

### Project Structure
Themes are organized into "universes" - thematic groups of color schemes:

```
lua/prismpunk/
├── schemes/             # Theme definitions
│   ├── dc/              # DC Comics universe
│   ├── tmnt/            # TMNT universe
│   ├── kanagawa/        # Kanagawa-inspired themes
│   ├── punk-cultures/   # Punk subcultures
│   ├── detox/           # Minimal themes
│   └── nvim-builtins/   # Neovim default theme variations
├── core/                # Core functionality
└── utils/               # Utility functions
```

## Theme Anatomy

A complete theme consists of:
1. **Palette Definition**: Raw color values
2. **Base16 Palette**: Standardized 16-color compatibility layer
3. **Theme Generation Function**: Returns color assignments for all UI elements

## Creating Your First Theme

### Step 1: Choose a Universe

Select or create a universe directory that matches your theme's aesthetic. For a new theme:

```bash
mkdir -p lua/prismpunk/schemes/my-universe
```

### Step 2: Create Theme File

Create a Lua file for your theme (e.g., `lua/prismpunk/schemes/my-universe/my-theme.lua`):

```lua
local color = require("prismpunk.utils.color")

-- Step 1: Define your color palette
local palette = {
  -- Required base colors
  bg_darkest = "#000000",
  fg_lightest = "#FFFFFF",
  
  -- Recommended background shades
  bg_darker = "#111111",
  bg_dark = "#222222",
  bg_mid = "#333333",
  bg_light = "#444444",
  
  -- Recommended foreground shades
  fg_light = "#DDDDDD",
  fg_mid = "#AAAAAA",
  fg_dark = "#777777",
  
  -- Custom theme colors
  my_accent = "#FF5500",
  my_primary = "#00FF55",
  my_secondary = "#5500FF",
}

local M = {}

-- Step 2: Theme generation function
---@param opts table|nil User configuration options
---@param plt table|nil Color palette (defaults to local palette)
---@return table Complete theme definition
M.get = function(opts, plt)
  plt = plt or palette
  opts = opts or {}
  
  return {
    -- Vim mode colors
    modes = {
      normal = plt.my_primary,
      insert = plt.my_accent,
      visual = plt.my_secondary,
      replace = "#FF0000",
      command = "#FFFF00",
    },
    
    -- Accent colors (for highlights, borders, etc.)
    accent = {
      accent1 = plt.my_accent,
      accent2 = plt.my_primary,
      accent3 = plt.my_secondary,
    },
    
    -- Rainbow colors (for indent guides, etc.)
    rainbow = {
      rainbow1 = plt.my_accent,
      rainbow2 = plt.my_primary,
      rainbow3 = plt.my_secondary,
      rainbow4 = "#FF00FF",
      rainbow5 = "#00FFFF",
      rainbow6 = "#FFFF00",
      rainbow7 = "#FF0000",
    },
    
    -- UI element colors
    ui = {
      fg = plt.fg_lightest,
      fg_dim = plt.fg_light,
      fg_dimmer = plt.fg_mid,
      fg_dark = plt.fg_dark,
      bg = plt.bg_darkest,
      bg_dim = plt.bg_darker,
      bg_m1 = plt.bg_dark,
      bg_m2 = plt.bg_mid,
      bg_m3 = plt.bg_light,
      bg_p1 = plt.bg_dark,
      bg_p2 = plt.bg_mid,
      bg_gutter = (opts.gutter ~= false) and plt.bg_mid or "none",
      bg_cursorline = plt.bg_mid,
      bg_cursorline_alt = plt.bg_light,
      bg_search = plt.my_accent,
      bg_visual = plt.bg_mid,
      bg_statusline = plt.bg_light,
      border = plt.my_accent,
      nontext = plt.fg_dark,
      whitespace = plt.fg_dark,
      win_separator = plt.my_accent,
      indent = plt.bg_mid,
      indent_scope = plt.my_accent,
      picker = plt.my_accent,
      yank = plt.my_accent,
      mark = plt.my_accent,
      scrollbar = plt.bg_mid,
      selection = plt.bg_mid,
      line_nr = plt.fg_mid,
      line_nr_dim = plt.fg_dark,
      line_nr_active = plt.fg_lightest,
      
      -- Floating window colors
      float = {
        fg = plt.fg_light,
        bg = plt.bg_mid,
        fg_border = plt.fg_dark,
        bg_border = plt.bg_mid,
      },
      
      -- Popup menu colors
      pmenu = {
        fg = plt.fg_lightest,
        fg_sel = plt.fg_lightest,
        fg_border = plt.fg_dark,
        bg = plt.bg_mid,
        bg_sel = plt.bg_light,
        bg_border = plt.bg_mid,
        bg_sbar = plt.bg_mid,
        bg_thumb = plt.bg_light,
      },
      
      -- Tabline colors
      tabline = {
        bg = plt.bg_darkest,
        bg_inactive = plt.bg_darkest,
        bg_selected = plt.bg_mid,
        bg_alternate = plt.bg_darkest,
        fg_inactive = plt.fg_mid,
        fg_selected = plt.fg_lightest,
        fg_alternate = plt.my_accent,
        indicator = plt.my_accent,
      },
    },
    
    -- Syntax highlight colors
    syn = {
      attribute = plt.my_accent,
      boolean = plt.my_accent,
      comment = plt.fg_mid,
      constant = plt.my_accent,
      deprecated = plt.fg_dark,
      func = plt.my_primary,
      identifier = plt.fg_lightest,
      keyword = plt.my_accent,
      method = plt.my_primary,
      number = plt.my_accent,
      operator = plt.my_accent,
      parameter = plt.fg_mid,
      preproc = plt.my_accent,
      punct = plt.fg_mid,
      regex = plt.my_accent,
      special = plt.my_accent,
      statement = plt.my_accent,
      string = plt.my_primary,
      symbol = plt.my_accent,
      type = plt.my_primary,
      variable = plt.fg_lightest,
    },
    
    -- Diagnostic colors
    diag = {
      error = "#FF0000",
      warning = "#FFFF00",
      info = "#00FF00",
      hint = "#00FFFF",
    },
    
    -- Diff colors
    diff = {
      add = plt.my_primary,
      change = plt.my_accent,
      delete = "#FF0000",
      text = plt.my_secondary,
    },
    
    -- Version control colors
    vcs = {
      added = plt.my_primary,
      changed = plt.my_accent,
      removed = "#FF0000",
    },
    
    -- Terminal colors
    term = {
      black = plt.bg_darkest,
      red = "#FF0000",
      green = plt.my_primary,
      yellow = "#FFFF00",
      blue = plt.my_secondary,
      magenta = plt.my_accent,
      cyan = "#00FFFF",
      white = plt.fg_lightest,
      
      black_bright = color(plt.bg_darkest):brighten(0.6):to_hex(),
      red_bright = color("#FF0000"):brighten(0.2):to_hex(),
      green_bright = color(plt.my_primary):brighten(0.1):to_hex(),
      yellow_bright = color("#FFFF00"):brighten(0.2):to_hex(),
      blue_bright = color(plt.my_secondary):brighten(0.3):to_hex(),
      magenta_bright = color(plt.my_accent):brighten(0.2):to_hex(),
      cyan_bright = color("#00FFFF"):brighten(0.1):to_hex(),
      white_bright = color(plt.fg_lightest):brighten(0.2):to_hex(),
    },
  }
end

-- Step 3: Export theme metadata
return {
  name = "My Universe – My Theme",
  author = "Your Name",
  description = "A beautiful theme with custom colors",
  
  base16 = {
    base00 = palette.bg_darkest,  -- Default Background
    base01 = palette.bg_darker,  -- Lighter Background (status bars)
    base02 = palette.bg_mid,     -- Selection Background
    base03 = palette.fg_dark,    -- Comments, Invisibles
    base04 = palette.fg_mid,     -- Dark Foreground (status bars)
    base05 = palette.fg_light,   -- Default Foreground
    base06 = palette.fg_lightest, -- Light Foreground
    base07 = palette.fg_lightest, -- Light Background
    base08 = palette.my_accent,  -- Variables, XML Tags
    base09 = palette.my_accent,  -- Integers, Boolean
    base0A = palette.my_accent,  -- Classes, Markup Bold
    base0B = palette.my_primary, -- Strings, Markup Code
    base0C = palette.my_accent,  -- Support, Regular Expressions
    base0D = palette.my_primary, -- Functions, Methods
    base0E = palette.my_accent,  -- Keywords, Storage
    base0F = palette.my_accent,  -- Deprecated, Embedded Tags
  },
  
  palette = palette,
  get = M.get,
}
```

## Palette Requirements

### Required Fields

Every palette must have these:

```lua
local palette = {
  bg_darkest = "#000000",  -- Darkest background color
  fg_lightest = "#FFFFFF", -- Lightest foreground color
}
```

### Recommended Fields

These create a more polished theme:

```lua
local palette = {
  -- Background shades (for depth)
  bg_darker = "#111111",
  bg_dark = "#222222",
  bg_mid = "#333333",
  bg_light = "#444444",
  
  -- Foreground shades (for hierarchy)
  fg_light = "#DDDDDD",
  fg_mid = "#AAAAAA",
  fg_dark = "#777777",
  
  -- Alternate backgrounds
  bg_alt1 = "#050505",
  bg_alt2 = "#0A0A0A",
  bg_alt3 = "#101010",
}
```

## Theme Sections

### Required Sections

Every theme must include these:

#### UI Colors
```lua
ui = {
  fg = plt.fg_lightest,  -- Required
  bg = plt.bg_darkest,  -- Required
  -- ... other UI colors
}
```

#### Syntax Colors
```lua
syn = {
  comment = plt.fg_mid,    -- Required
  keyword = plt.my_accent, -- Required
  func = plt.my_primary,   -- Required
  string = plt.my_primary, -- Required
  type = plt.my_primary,   -- Required
  variable = plt.fg_lightest, -- Required
}
```

#### Diagnostic Colors
```lua
diag = {
  error = "#FF0000",    -- Required
  warning = "#FFFF00",  -- Required
  info = "#00FF00",     -- Required
  hint = "#00FFFF",     -- Required
}
```

#### Terminal Colors
```lua
term = {
  black = plt.bg_darkest,  -- Required
  red = "#FF0000",        -- Required
  green = plt.my_primary, -- Required
  yellow = "#FFFF00",     -- Required
  blue = plt.my_secondary,-- Required
  magenta = plt.my_accent,-- Required
  cyan = "#00FFFF",       -- Required
  white = plt.fg_lightest,-- Required
}
```

### Recommended Sections

#### Modes
```lua
modes = {
  normal = plt.my_primary,
  insert = plt.my_accent,
  visual = plt.my_secondary,
  replace = "#FF0000",
  command = "#FFFF00",
}
```

#### Accents
```lua
accent = {
  accent1 = plt.my_accent,
  accent2 = plt.my_primary,
  accent3 = plt.my_secondary,
}
```

#### Diff and VCS
```lua
diff = {
  add = plt.my_primary,
  change = plt.my_accent,
  delete = "#FF0000",
  text = plt.my_secondary,
}

vcs = {
  added = plt.my_primary,
  changed = plt.my_accent,
  removed = "#FF0000",
}
```

## Base16 Compatibility

The Base16 palette is a standardized 16-color system for compatibility:

```lua
base16 = {
  base00 = palette.bg_darkest,  -- Default Background
  base01 = palette.bg_darker,  -- Lighter Background (status bars)
  base02 = palette.bg_mid,     -- Selection Background
  base03 = palette.fg_dark,    -- Comments, Invisibles
  base04 = palette.fg_mid,     -- Dark Foreground (status bars)
  base05 = palette.fg_light,   -- Default Foreground
  base06 = palette.fg_lightest, -- Light Foreground
  base07 = palette.fg_lightest, -- Light Background
  base08 = palette.my_accent,  -- Variables, XML Tags
  base09 = palette.my_accent,  -- Integers, Boolean
  base0A = palette.my_accent,  -- Classes, Markup Bold
  base0B = palette.my_primary, -- Strings, Markup Code
  base0C = palette.my_accent,  -- Support, Regular Expressions
  base0D = palette.my_primary, -- Functions, Methods
  base0E = palette.my_accent,  -- Keywords, Storage
  base0F = palette.my_accent,  -- Deprecated, Embedded Tags
}
```

## Validation and Testing

### Run Validation

Check if your theme meets all requirements:

```vim
:PrismValidate my-universe/my-theme
```

### Validation Checks

PrismPunk validates:
- **WCAG Contrast**: Ensures readability (AA/AAA levels)
- **Base16 Palette**: Completeness of 16-color palette
- **Color Formats**: Valid hex color codes
- **Scheme Structure**: Required sections and keys
- **Contrast for UI Elements**: FG/BG combinations

### Fix Issues

Use validation suggestions to fix problems:

```
[FAIL] WCAG Contrast (aa)
  FAIL Normal FG vs BG: 3.2:1 (needs AA)
    SUGGEST: Adjust fg: #DDDDDD -> #EEEEEE (ratio: 4.6:1)
```

## Best Practices

### Color Harmony

1. **Limit your palette**: 5-8 main colors plus shades
2. **Ensure contrast**: 
   - AA level: 4.5:1 (normal text)
   - AAA level: 7.0:1 (large text)
3. **Use color theory**: Monochromatic, complementary, or analogous schemes

### Accessibility

1. **High contrast for text**: FG/BG contrast of at least 4.5:1
2. **Consistent colors**: Use semantic color names
3. **Test with different color vision deficiencies**

### Performance

1. **Precompute colors**: Avoid runtime calculations
2. **Use hex colors**: #RRGGBB format for best performance
3. **Cache where possible**: PrismPunk caches themes automatically

### Maintainability

1. **Semantic color names**: Describe purpose, not appearance
2. **Consistent structure**: Follow existing theme patterns
3. **Document your theme**: Add detailed description

## Advanced Features

### Treesitter and LSP Support

Add semantic highlighting:

```lua
treesitter = {
  ["@comment"] = plt.fg_mid,
  ["@comment.documentation"] = plt.fg_light,
  ["@constant"] = plt.my_accent,
  ["@function"] = plt.my_primary,
  ["@keyword"] = plt.my_accent,
  ["@string"] = plt.my_primary,
  ["@type"] = plt.my_secondary,
  -- ... more Tree-sitter groups
},

lsp = {
  ["@lsp.type.class"] = plt.my_primary,
  ["@lsp.type.interface"] = plt.my_primary,
  ["@lsp.type.struct"] = plt.my_primary,
  ["@lsp.type.enum"] = plt.my_primary,
  -- ... more LSP semantic tokens
},
```

### Color Manipulation

Use the color utility for dynamic colors:

```lua
local color = require("prismpunk.utils.color")

-- Brighten by 20%
local light_color = color("#FF0000"):brighten(0.2):to_hex()

-- Darken by 10%
local dark_color = color("#FF0000"):darken(0.1):to_hex()

-- Adjust saturation
local saturated = color("#FF0000"):saturate(0.3):to_hex()

-- Rotate hue
local rotated = color("#FF0000"):rotate(45):to_hex()
```

### Customization Options

Support user overrides:

```lua
M.get = function(opts, plt)
  plt = plt or palette
  opts = opts or {}
  
  return {
    ui = {
      bg_gutter = (opts.gutter ~= false) and plt.bg_mid or "none",
      -- ... other customizable colors
    },
    -- ... rest of theme
  }
end
```

## Testing Your Theme

### Live Reload

Test changes without restarting Neovim:

```lua
require("prismpunk.loader").clear_cache()
require("prismpunk").load("my-universe/my-theme")
```

### Preview Before Loading

Preview your theme:

```vim
:PrismpunkPreview my-universe/my-theme
```

### Check Scheme Information

View theme details:

```vim
:PrismpunkInfo my-universe/my-theme
```

## Submitting Your Theme

### 1. Create Universe (if new)

If creating a new universe, add it to `lua/prismpunk/loader/resolver.lua`.

### 2. Add Theme File

Place your theme file in the appropriate universe directory.

### 3. Test Thoroughly

- Run validation: `:PrismValidate my-universe/my-theme`
- Check for errors: `:checkhealth prismpunk`
- Test with different language files

### 4. Update Documentation

Add your theme to the documentation if applicable.

## Example Themes

For inspiration, examine existing themes:

- **kanagawa/paper-edo.lua**: Traditional Japanese aesthetics
- **dc/justice-league/superman.lua**: Bold, heroic colors
- **punk-cultures/cyberpunk.lua**: Neon dystopia theme

## Resources

- [WCAG 2.1 Contrast Guidelines](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
- [Color Theory for Developers](https://m2.material.io/design/color/the-color-system.html)
- [Base16 Specification](https://github.com/chriskempson/base16)

## Troubleshooting

### Common Issues

1. **Colors not applying**: Clear cache with `:PrismpunkReload`
2. **Contrast errors**: Adjust FG/BG pairs to meet 4.5:1 ratio
3. **Invalid hex colors**: Use `#RRGGBB` format
4. **Missing sections**: Ensure all required sections exist

### Debugging Tips

1. Check health: `:checkhealth prismpunk`
2. View logs: `:messages`
3. Inspect highlights: `:highlight`
4. Check terminal colors: `:echo &t_8f`

## License

Themes should follow the project's license. Check `LICENSE` file for details.
