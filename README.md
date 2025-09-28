# boring.nvim

A Neovim configuration that aims to be simple and boring.

## Features

This configuration includes a curated set of plugins to provide a modern Neovim experience.

- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) is used for plugin management.
- **Theme**: [Catppuccin](https://github.com/catppuccin/nvim) (Macchiato flavor) is the default colorscheme.
- **Completion**: [blink-cmp](https://github.com/saghen/blink.cmp) provides autocompletion.
- **Formatting**: [conform.nvim](https://github.com/stevearc/conform.nvim) is used for code formatting, configured to format on save.
- **LSP**: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) provides LSP support for various languages.
- **Surrounding**: [nvim-surround](https://github.com/kylechui/nvim-surround) for working with surrounding pairs.
- **Fuzzy Finder**: [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for finding files, live grep, and more.
- **Syntax Highlighting**: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for better syntax highlighting.

## Keymaps

The leader key is set to `space`.

| Keymap        | Description                  |
|---------------|------------------------------|
| `<leader>e`   | Open file explorer           |
| `<C-K>` (Insert) | Trigger completion           |
| `gd`          | Go to definition (LSP)       |
| `<leader>f`   | Find files with Telescope    |
| `<leader>/`   | Live grep with Telescope     |
| `<leader>g`   | Open lazygit in a terminal   |

## Options

- **Clipboard**: Uses the system clipboard.
- **Line Numbers**: Relative line numbers are enabled.
- **Wrapping**: Line wrapping is disabled.
- **Indentation**: Uses 4 spaces for tabs.
- **Search**: Smart case search is enabled.
