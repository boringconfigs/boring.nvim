local theme = vim.fn.stdpath("config") .. "/lua/plugins/local/theme.lua"
local omarchytheme = vim.fn.stdpath("config") .. "/lua/plugins/local/omarchy-theme.lua"
if vim.fn.filereadable(theme) == 1 then
    -- User has defined their own theme, configure nothing on our behalf
    return {}
elseif vim.fn.filereadable(omarchytheme) == 1 then
    -- Running in Omarcy
    return {
      {
        "ribru17/bamboo.nvim",
        lazy = true,
        priority = 1000,
      },
      {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        priority = 1000,
      },
      {
        "neanias/everforest-nvim",
        lazy = true,
        priority = 1000,
      },
      {
        "kepano/flexoki-neovim",
        lazy = true,
        priority = 1000,
      },
      {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        priority = 1000,
      },
      {
        "rebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000,
      },
      {
        "tahayvr/matteblack.nvim",
        lazy = true,
        priority = 1000,
      },
      {
        "loctvl842/monokai-pro.nvim",
        lazy = true,
        priority = 1000,
      },
      {
        "shaunsingh/nord.nvim",
        lazy = true,
        priority = 1000,
      },
      {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        priority = 1000,
      },
      {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
      },
    }
else
    -- Fallback to catppuccin
    return {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-macchiato")
        end,
      }
end
