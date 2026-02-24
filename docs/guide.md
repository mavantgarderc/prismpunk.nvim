# PrismPunk.nvim - Complete User Guide 🎨

> A Neovim colorscheme plugin inspired by legendary characters from DC, Marvel, mythology, and cinema.

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
- [Available Schemes](#available-schemes)
- [Scheme Switching](#scheme-switching)
- [Customization](#customization)
- [Terminal Integration](#terminal-integration)
- [Development Mode](#development-mode)
- [Creating Custom Schemes](#creating-custom-schemes)
- [Commands Reference](#commands-reference)
- [Troubleshooting](#troubleshooting)

---

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim) (Recommended)

```lua
{
  'mavantgarderc/prismpunk.nvim',
  priority = 1000,  -- Load before other plugins
  config = function()
    require('prismpunk').setup({
      scheme = 'lantern-corps/green',
    })
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'mavantgarderc/prismpunk.nvim',
  config = function()
    require('prismpunk').setup({
      scheme = 'lantern-corps/green',
    })
  end,
}
```

### Manual Installation

```bash
# Clone the repository
cd ~/.local/share/nvim/site/pack/plugins/start/
git clone https://github.com/mavantgarderc/prismpunk.nvim

# Or for local development
cd ~/your-projects/
git clone https://github.com/mavantgarderc/prismpunk.nvim
```

Then in your `init.lua`:

```lua
-- Add to runtime path
vim.opt.rtp:prepend('~/your-projects/prismpunk.nvim')

-- Setup scheme
require('prismpunk').setup({
  scheme = 'lantern-corps/green',
})
```

---

## Quick Start

### Basic Setup

```lua
-- Minimal configuration
require('prismpunk').setup({
  scheme = 'lantern-corps/green',
})
```

### Full Configuration with Options

```lua
require('prismpunk').setup({
  -- Scheme selection (choose one)
  scheme = 'lantern-corps/green',  -- Recommended format
  -- scheme = 'lantern-corps.green',  -- Also works
  -- scheme = { universe = 'lantern-corps', variant = 'green' },  -- Table format
  
  -- Style options
  styles = {
    comments = { italic = true },
    keywords = { bold = false },
    functions = { bold = false },
    variables = {},
  },
  
  -- Color and highlight overrides
  overrides = {
    colors = {
      -- Override specific Base16 colors
      -- base0B = '#custom-color',
    },
    highlights = {
      -- Override specific highlight groups
      -- Comment = { fg = '#custom-color', italic = true },
    },
  },
  
  -- Plugin integrations
  integrations = {
    cmp = true,
    telescope = true,
    gitsigns = true,
    lualine = true,
  },
  
  -- Terminal colors
  terminal_colors = true,  -- Apply scheme to :terminal
})
```

> **Note:** The `theme` option is deprecated but still works. Use `scheme` for new configurations.

---

## Configuration

### Scheme Selection Formats

All three formats work identically:

```lua
-- Format 1: Slash notation (recommended)
scheme = 'lantern-corps/green'

-- Format 2: Dot notation
scheme = 'lantern-corps.green'

-- Format 3: Table notation
scheme = { 
  universe = 'lantern-corps', 
  variant = 'green' 
}
```

### Style Options

Customize how different syntax elements appear:

```lua
styles = {
  comments = { 
    italic = true,      -- Italicize comments
    bold = false 
  },
  keywords = { 
    bold = true,        -- Bold keywords
    italic = false 
  },
  functions = { 
    bold = false,       -- Functions styling
    italic = false 
  },
  variables = {         -- Variable styling
    -- empty = use scheme defaults
  },
}
```

### Color Overrides

Override specific colors without creating a new scheme:

```lua
overrides = {
  colors = {
    base0B = '#ff00ff',  -- Change string color
    base00 = '#000000',  -- Change background
  },
}
```

### Highlight Group Overrides

Override specific highlight groups:

```lua
overrides = {
  highlights = {
    Comment = { 
      fg = '#5c6370', 
      italic = true, 
      bold = false 
    },
    Function = { 
      fg = '#61afef', 
      bold = true 
    },
    -- Override any highlight group
  },
}
```

---

## Scheme Switching

### At Runtime

Switch schemes without restarting Neovim:

```vim
" Using prismpunk's load function
:lua require('prismpunk').load('lantern-corps/yellow')

" Using traditional colorscheme command
:colorscheme prismpunk
```

### In Configuration

Change default scheme in your config:

```lua
require('prismpunk').setup({
  scheme = 'lantern-corps/yellow',  -- Changed from green
})
```

Restart Neovim or run:

```vim
:source ~/.config/nvim/init.lua
```

### Create Scheme Picker

Using [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim):

```lua
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local function scheme_picker()
  local schemes = {
    'lantern-corps/green',
    'lantern-corps/yellow',
    -- Add more as you create them
  }
  
  pickers.new({}, {
    prompt_title = 'PrismPunk Schemes',
    finder = finders.new_table({
      results = schemes,
    }),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        require('prismpunk').load(selection.value)
      end)
      return true
    end,
  }):find()
end

-- Keybinding
vim.keymap.set('n', '<leader>tp', scheme_picker, { desc = 'PrismPunk: Pick scheme' })
```

---

## Customization

### Example: Darker Background

```lua
require('prismpunk').setup({
  scheme = 'lantern-corps/green',
  overrides = {
    colors = {
      base00 = '#000000',  -- Pure black background
      base01 = '#0a0a0a',  -- Darker sidebars
    },
  },
})
```

### Example: More Vibrant Strings

```lua
overrides = {
  colors = {
    base0B = '#00ff00',  -- Brighter green for strings
  },
}
```

### Example: Custom Comment Style

```lua
overrides = {
  highlights = {
    Comment = {
      fg = '#7c8896',
      italic = true,
      bold = false,
    },
  },
}
```

### Example: Transparent Background

```lua
overrides = {
  highlights = {
    Normal = { bg = 'NONE' },
    NormalFloat = { bg = 'NONE' },
    NormalNC = { bg = 'NONE' },
  },
}
```

---

## Terminal Integration

### Built-in Terminal Colors

PrismPunk automatically applies colors to Neovim's built-in terminal:

```vim
" Open terminal
:terminal

" Now terminal output uses your scheme colors
ls --color
git status
```

### Export to External Terminals

Export your scheme to use in Ghostty, Kitty, Alacritty, etc:

#### Export All Formats

```vim
:PrismpunkExportAll
```

This creates configs in `~/.config/nvim/prismpunk-exports/`:

```
prismpunk-exports/
├── ghostty/
│   └── lantern-corps-green.conf
├── kitty/
│   └── lantern-corps-green.conf
└── alacritty/
    └── lantern-corps-green.toml
```

#### Export Specific Format

```vim
" Export current scheme to Ghostty
:PrismpunkExportGhostty

" Export specific scheme
:PrismpunkExportGhostty lantern-corps/yellow
```

### Apply to Your Terminal

#### Ghostty

```bash
# Copy scheme
cp ~/.config/nvim/prismpunk-exports/ghostty/lantern-corps-green.conf \
   ~/.config/ghostty/themes/

# Use in config
echo 'scheme = lantern-corps-green' >> ~/.config/ghostty/config
```

#### Kitty

```bash
# In ~/.config/kitty/kitty.conf
include ~/.config/nvim/prismpunk-exports/kitty/lantern-corps-green.conf
```

#### Alacritty

```toml
# In ~/.config/alacritty/alacritty.toml
[general]
import = [
  "~/.config/nvim/prismpunk-exports/alacritty/lantern-corps-green.toml"
]
```

---

## Development Mode

### Hot Reload

Reload scheme without restarting Neovim (useful when creating schemes):

```vim
:PrismpunkReload
```

Or create a keybinding:

```lua
vim.keymap.set('n', '<leader>pr', function()
  require('prismpunk.loader').clear_cache()
  require('prismpunk').setup(_G.prismpunk_config or {})
  vim.notify('PrismPunk reloaded!', vim.log.levels.INFO)
end, { desc = 'Reload PrismPunk scheme' })
```

### Debug Colors

Print current scheme's color palette:

```vim
:PrismpunkPrintPalette

" Or for specific scheme
:PrismpunkPrintPalette lantern-corps/yellow
```

Output:
```
=== Lantern Corps - Yellow (Fear) ===

--- Rich Palette ---
dreadBlack           #0a0800
terrorVoid           #141200
fearYellow           #ffff00
...

--- Base16 Colors ---
base00   #0a0800
base01   #141200
...
```

### Inspect Scheme Structure

```vim
:lua print(vim.inspect(require('prismpunk.core.terminal').get_palette('lantern-corps/green')))
```

---

## Creating Custom Schemes

### Quick Scheme (5 minutes)

Create a simple scheme using Base16 auto-generation:

```lua
-- lua/prismpunk/schemes/marvel/test-hero.lua

local base16 = require('prismpunk.utils.base16')

return {
  name = 'Test Hero',
  author = 'Your Name',
  description = 'Quick test scheme',
  
  -- Auto-generate from 3 colors
  base16 = base16.generate({
    bg = '#1a1a1a',      -- Background
    fg = '#e0e0e0',      -- Foreground
    accent = '#ff0000',  -- Main color
  }),
}
```

### Rich Scheme (30 minutes)

Create a fully customized scheme:

```lua
-- lua/prismpunk/schemes/dc/hero/custom.lua

local palette = {
  -- Backgrounds
  deepBlack = '#0a0a0a',
  voidGray = '#1a1a1a',
  
  -- Character colors
  heroRed = '#ff0000',
  heroGold = '#ffd700',
  heroBlue = '#0080ff',
  
  -- UI colors
  textGray = '#c0c0c0',
  commentGray = '#707070',
}

local M = {}

M.get = function(opts, plt)
  plt = plt or palette
  return {
    modes = {
      normal = plt.heroBlue,
      insert = plt.heroGold,
      visual = plt.heroRed,
      replace = plt.heroRed,
      command = plt.heroGold,
    },
    
    ui = {
      bg = plt.deepBlack,
      fg = plt.textGray,
      line_nr_active = plt.heroRed,
      -- ... more UI settings
    },
    
    syn = {
      string = plt.heroRed,
      keyword = plt.heroGold,
      func = plt.heroBlue,
      comment = plt.commentGray,
      variable = plt.textGray,
    },
    
    diag = {
      error = '#ff0000',
      warning = '#ff8800',
      info = '#0080ff',
      hint = '#00ff00',
    },
  }
end

return {
  name = 'Custom Hero',
  author = 'Your Name',
  
  palette = palette,
  get = M.get,
  
  base16 = {
    base00 = palette.deepBlack,
    base05 = palette.textGray,
    base0B = palette.heroRed,
    -- ... rest of base16
  },
}
```

### Test Your Scheme

```vim
:lua require('prismpunk.loader').clear_cache()
:lua require('prismpunk').load('custom-hero/custom')
```

---

## Commands Reference

### User Commands

| Command | Description |
|---------|-------------|
| `:PrismpunkReload` | Reload current scheme (dev mode) |
| `:PrismpunkExportAll` | Export to all terminal formats |
| `:PrismpunkExportGhostty [scheme]` | Export to Ghostty format |
| `:PrismpunkPrintPalette [scheme]` | Print color palette |

### Lua API

```lua
-- Load a scheme
require('prismpunk').load('lantern-corps/green')

-- Setup with config
require('prismpunk').setup({
  scheme = 'lantern-corps/green',
  -- ... options
})

-- Clear cache (development)
require('prismpunk.loader').clear_cache()

-- Export terminal config
require('prismpunk.core.terminal').export_all('lantern-corps/green')

-- Get scheme colors
local colors = require('prismpunk.core.terminal').get_palette('lantern-corps/green')

-- Generate Base16 colors
local base16 = require('prismpunk.utils.base16')
local colors = base16.generate({
  bg = '#000000',
  fg = '#ffffff',
  accent = '#00ff88'
})
```

---

## Troubleshooting

### Scheme Not Loading

**Problem:** Scheme doesn't change when you load it.

**Solution:**
```vim
" Clear module cache
:lua for k in pairs(package.loaded) do if k:match('^prismpunk') then package.loaded[k] = nil end end

" Reload
:lua require('prismpunk').setup({ scheme = 'lantern-corps/green' })
```

### Module Not Found Error

**Problem:** `module 'prismpunk.schemes.dc.lantern-corps.green' not found`

**Solution:**
1. Check file exists: `lua/prismpunk/schemes/dc/lantern-corps/green.lua`
2. Check `init.lua` exists in parent dirs
3. Verify plugin is in runtimepath:
   ```vim
   :lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))
   ```

### Colors Don't Look Right

**Problem:** Colors are wrong or not showing.

**Solution:**
```vim
" Enable true color support
:set termguicolors

" Check your terminal supports 24-bit color
" In terminal: echo $COLORTERM
" Should show: truecolor or 24bit
```

### Terminal Colors Not Applied

**Problem:** Built-in terminal doesn't use scheme colors.

**Solution:**
```lua
require('prismpunk').setup({
  scheme = 'lantern-corps/green',
  terminal_colors = true,  -- Make sure this is true
})
```

---

## FAQ

### Can I use multiple schemes in one session?

Yes! Switch schemes anytime:
```vim
:lua require('prismpunk').load('lantern-corps/yellow')
:lua require('prismpunk').load('lantern-corps/green')
```

### How do I make my terminal match Neovim?

Use the export commands:
```vim
:PrismpunkExportAll
```
Then apply the config to your terminal (see Terminal Integration).

### Can I create schemes without coding?

Use the Base16 quick generator:
```lua
local base16 = require('prismpunk.utils.base16')
local scheme = base16.quick_scheme(
  "My Scheme",
  "#000000",  -- background
  "#ffffff",  -- foreground
  "#00ff00"   -- accent color
)
```

### How do I contribute schemes?

1. Create your scheme following the structure
2. Test it thoroughly
3. Export terminal configs
4. Submit a PR with screenshots

### Does Prismpunk support TreeSitter?

Yes! Full TreeSitter and LSP semantic token support included.

### Does it work with plugins like telescope/cmp?

Yes! Integrations for popular plugins are built-in:
- nvim-cmp
- telescope.nvim
- gitsigns.nvim
- lualine.nvim
- nvim-notify
- indent-blankline
- nvim-dap-ui
- neotest
- lazy.nvim

### Can I disable terminal colors?

```lua
require('prismpunk').setup({
  terminal_colors = false,
})
```

### How do I reset to defaults?

```lua
require('prismpunk').setup()  -- No arguments = defaults
```

---

## Tips & Tricks

### Keybindings

```lua
-- Quick scheme switching
vim.keymap.set('n', '<leader>pg', function()
  require('prismpunk').load('lantern-corps/green')
end, { desc = 'Green Lantern' })

vim.keymap.set('n', '<leader>py', function()
  require('prismpunk').load('lantern-corps/yellow')
end, { desc = 'Yellow Lantern' })

-- Scheme picker
vim.keymap.set('n', '<leader>pt', ':Telescope prismpunk<CR>', { desc = 'Pick scheme' })

-- Reload scheme (development)
vim.keymap.set('n', '<leader>pr', ':PrismpunkReload<CR>', { desc = 'Reload scheme' })
```

### Auto-switch Based on Time

```lua
-- Dark scheme at night, light scheme during day
local hour = tonumber(os.date('%H'))
local scheme = hour >= 18 or hour < 6 
  and 'lantern-corps/green'   -- Night: Green Lantern
  or 'lantern-corps/yellow'   -- Day: Yellow Lantern

require('prismpunk').setup({ scheme = scheme })
```

### Match Lualine

```lua
-- In your lualine config
local prismpunk_colors = require('prismpunk.core.terminal').get_palette('lantern-corps/green')

require('lualine').setup({
  options = {
    theme = {
      normal = {
        a = { 
          fg = prismpunk_colors.base16.base00, 
          bg = prismpunk_colors.base16.base0B 
        },
      },
    },
  },
})
```
