<div align="center">
    <h3>
        Stilla for <a href="https://neovim.io/">Neovim</a>
    </h3>
    <h5>/ˈstɪtla/ - stilla : From Old Norse: “to calm down” - minimal neovim theme</h5>
    <img src="https://i.imgur.com/kLBy4ge.png" title="Neovim Stilla colorscheme" style="width: 100%; max-width: 700px; text-align: center;"/>
</div>

## Features

- Integrations with Treesitter, Telescope and many other plugins

## Installation

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{ "dlvandenberg/stilla.nvim", name = "stilla", priority = 1000 }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "dlvandenberg/stilla.nvim", as = "stilla" }
```

## Usage

```lua
colorscheme stilla
```

```lua
vim.cmd.colorscheme "stilla"
```

## Configuration

Below you'll find the default configuration, which can be altered to your liking:

```lua
require("stilla").setup({
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true, bold = true },
    functions = {},
    variables = {},
  },
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses lazy.nvim to load plugins automatically
    auto = true,
    -- add any plugins here that you want to enable
  },
})
```

## Overrides

### Color Palette

You can override the color palette by using the `on_colors` function:

```lua
require("stilla").setup({
    on_colors = function(colors)
        colors.gutter_highlight = "#EE2424"
    end,
})
```

### Highlight groups

If you do not like the current color for a specific highlight group, you can override it in the setup:

```lua
require("stilla").setup({
    on_highlights = function(highlight, colors)
        ColorColumn = { fg = "#ff0000", bg = colors.bg },
        ["@variable.builtin"] = { fg = "#ff0000" },
    end,
})
```

## Supported Plugins

Below is a list of supported integrations.

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [neotest](https://github.com/nvim-neotest/neotest)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [octo.nvim](https://github.com/pwntester/octo.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [which-key.nvim](https://github.com/folke/which-key.nvim)

## Extras

| Tool                                                        | Extra                                       |
| ----------------------------------------------------------- | ------------------------------------------- |
| [Bat](https://github.com/sharkdp/bat)                       | [extras/bat](extras/fzf)                    |
| [Oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh)  | [extras/oh-my-posh](extras/oh-my-posh.toml) |
| [WezTerm](https://wezfurlong.org/wezterm/config/files.html) | [extras/wezterm](extras/wezterm.toml)       |

## Credits

The setup of this theme is heavily inspired by the following themes:

- [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [TokyoNight](https://github.com/folke/tokyonight.nvim)
