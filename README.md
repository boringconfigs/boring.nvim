# boring.nvim

Minimalistic Neovim configuration for purists.

Comes with:

- LSP
- Autocomplete
- Treesitter
- Formatter
- Fuzzyfinding
- Sane Vim settings

To setup new language servers and formatters, check
[languages.lua](./lua/config/languages.lua).

## Installation

If you are doing a fresh install it is as simple as

```sh
brew bundle
```

This will install Neovim, ripgrep, language servers as well as create
configuration under ~/.config/nvim
