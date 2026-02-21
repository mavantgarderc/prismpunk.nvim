# PrismPunk.nvim

A NeoVim colorscheme plugin including: Impressionism, Kanagawa, Michelangelo from TMNT, DecoPunk, & so many more...

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "mavantgarderc/prismpunk.nvim",
  priority = 1000,
  config = function()
    require("prismpunk").setup({
      theme = "justice-league/wonder-woman",
    })
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "mavantgarderc/prismpunk.nvim",
  config = function()
    require("prismpunk").setup({
      theme = "justice-league/wonder-woman",
    })
  end,
}
```

## Usage

### Setup in your init.lua

```lua
return {
  "mavantgarderc/prismpunk.nvim",
  lazy = false,
  priority = 1000,

  config = function()
    require("prismpunk").setup({
      theme = "lantern-corps/green", -- Choose your theme

      -- Optional: Style customization
      styles = {
        comments = { italic = true },
        keywords = { bold = false },
        functions = { bold = false },
        variables = {}, -- Added for variable styles
      },

      -- Optional: Color overrides
      overrides = {
        colors = {
          base0B = "#custom-color", -- Override specific Base16 colors
        },
        highlights = {
          Comment = { fg = "#custom-color" }, -- Override highlight groups
        },
      },
      terminal = {
        enabled = true,
        emulator = { "ghostty" }, -- alacrity, kitty, zellij

        ghostty = {
          enabled = true,
          auto_reload = true,
          config_path = vim.fn.expand("~/.config/ghostty/themes/prismpunk.toml"), -- colorscheme file path
        },
      },
    })
  end,
}
```

### Theme Filtering (Optional)

Limit which themes are available for command completion:

```lua
require("prismpunk").setup({
  theme = "kanagawa/paper-edo",  -- Default theme to load

  -- Whitelist of allowed themes/universes
  themes = {
    "kanagawa/paper-edo",  -- Individual theme
    "kanagawa/paper-dawn", -- Another kanagawa theme
    "tmnt",                -- Universe: loads all tmnt themes
    "dc",                  -- Universe: loads all dc themes
  },
})
```

- Use `"universe/name"` for individual themes (e.g., `"kanagawa/paper-edo"`)
- Use `"universe"` to include all themes in that universe (e.g., `"tmnt"`)
- When `themes = {}` (default), all themes are available

### Theme Selection Formats

All of these work:

- Slash notation (recommended): `"lantern-corps/green"`
- Dot notation: `"lantern-corps.green"`
- Table notation: `{ universe = "lantern-corps", variant = "green" }`

### Switch Themes Dynamically

- In Neovim command mode: `:lua require("prismpunk").load("lantern-corps/yellow")`
- Or use the traditional way: `:colorscheme prismpunk`

### Commands
- `:PrismpunkExportGhostty`: Export current theme to Ghostty config.
- `:PrismpunkReload`: Clear cache and reload the current theme (for live dev changes).
- `:PrismpunkListThemes`: List all available themes.
- `:PrismpunkCurrentTheme`: Show the currently active theme.
- `:PrismpunkPreview <theme_name>`: Preview a theme without loading it.
- More commands coming soon for preview and random selection.

## Features
- **Customizable Styles**: Toggle italics/bold for comments, keywords, functions, variables.
- **Overrides**: Easily override colors or highlight groups.
- **Terminal Integration**: Full support for Ghostty (export TOML, auto-reload via SIGUSR2).
- **Plugin Support**: Extended highlights for popular plugins including:
  - Treesitter and LSP semantic tokens (expanded coverage for classes, interfaces, async, etc.).
  - Telescope, NvimTree, Lualine, nvim-cmp, nvim-dap, mini.nvim, indent-blankline.
  - Which-key, Flash, Oil (new!).
- **Caching & Live Reload**: Fast loading with cache; clear and reload for dev.
- **Accessibility**: Base16 palette with potential for contrast checks (coming soon).

## Terminal Emulator Integration

### Ghostty

Remove all color-codes in `~/.config/ghostty/config`, & add `theme = "prismpunk.toml"` at the end of configuration file.

Then touch a file at `~/.config/ghostty/themes/` named `prismpunk.toml`

(Or don't... it is automated baby :D ...)

### Alacritty

Remove all color-codes & related flags in `~/.config/alacritty/alacritty.toml` & add below lines:

```toml
[general]
import = [
  "~/.config/alacritty/prismpunk.toml"
]
```

> If you experienced exceptions, try `alacritty migrate` command to debug.

Then you touch `prismpunk.toml` at the directory you mentioned in `alacritty.toml`.

### Kitty

Add these lines at an appropriate place of your `~/.config/kitty/kitty.conf`.

```conf
include prismpunk.conf
allow_remote_control yes
listen_on unix:/tmp/kitty-socket
```

Then, touch the placeholder file: `prrismpunk.conf`; or don't :) .

### Terminal Tools

#### tmux

If you use tmux, use this format on your navbar elements (remove all color codes; tmux will automatically absorbs term colors). This is my partially my own tmux config:

```conf
set -g renumber-windows on   # for taste's sake :)
set -g status on             # for taste's sake :)
set -g status-position top   # for taste's sake :)
set -g status-justify centre # for taste's sake :)

set -g status-style "bg=default,fg=default"

set -g status-style "bg=colour0,fg=colour15"

set -g status-left "\
#[bg=colour8,fg=colour0,bold] #S \
#[bg=colour0,fg=colour6,bold] #(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null | awk '{print\"\"$1\"%\"}') \
#[bg=colour0,fg=colour1,bold]%H:%M \
#[bg=colour0,fg=colour3,bold]#(bash /home/mava/dotfiles/tmux/net_status.sh)\
"

set -g status-right "\
#[bg=colour0,fg=colour2,bold]#(free -m | awk 'NR==2{printf \" %.0f%%\", $3*100/$2}') \
#[bg=colour0,fg=colour5,bold]#(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null | head -1 | awk '{if(NF) printf \"󱁉 %.0f%%\", $1; else print \"󱁉 N/A\"}') \
#[bg=colour0,fg=colour4,bold]#(grep 'cpu ' /proc/stat | awk '{u=($2+$4); t=u+$5; printf \" %.0f%%\", 100*u/t}') \
"

set -g window-status-style "bg=colour0,fg=colour8"
set -g window-status-format " #I:#W "
set -g window-status-separator ""
set -g window-status-current-style "bg=colour0,fg=colour7,bold"
set -g window-status-current-format " #I:#W "
set -g window-status-activity-style "bg=colour0,fg=colour1"
set -g window-status-bell-style "bg=colour0,fg=colour5,bold"

# Pane settings
set -g pane-border-style "fg=colour8"
set -g pane-active-border-style "fg=colour4,bold"

set -g mode-style "bg=colour3,fg=colour0"
```

#### Zellij

Remove any color-codes in your `~/.config/zellij/config.kdl`, the append: `theme "prismpunk"` somewhere.

Of course, touch a placeholder file at `~/.config/zellij/themes/` named `prismpunk.kdl`; or don't :) .

> There is a problem... Zellij doesn't support hot-reload; you need to restart it & this action will definitely kill the soul of PrismPunk, chief. Let's wait what devs will do to this badboy.

## Configuration

```lua
require("prismpunk").setup({
  theme = "kanagawa/paper-edo",
  
  styles = {
    comments = { italic = true },
    keywords = { bold = false },
    functions = { bold = false },
    variables = {},
  },
  
  overrides = {
    colors = {},
    highlights = {},
  },
  
  integrations = {
    cmp = true,
    telescope = true,
    gitsigns = true,
    lualine = true,
  },
  
  terminal = {
    enabled = true,
    emulator = { "ghostty", "alacritty", "kitty" },
    
    ghostty = {
      enabled = true,
      auto_reload = true,
      config_path = vim.fn.expand("~/.config/ghostty/themes/prismpunk.toml"),
    },
    
    alacritty = {
      enabled = true,
      auto_reload = true,
      config_path = vim.fn.expand("~/.config/alacritty/prismpunk.toml"),
    },
  },
})
```

## Development

### Live Reload

```lua
-- Clear cache and reload theme
require("prismpunk.loader").clear_cache()
require("prismpunk").load("lantern-corps/green")
```

## Testing

To run the tests for PrismPunk.nvim:

```bash
# If using plenary.nvim for testing
nvim --headless -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.lua'}"
```

## Contributing
See CONTRIBUTING.md for guidelines. Pull requests for new themes or fixes welcome!
