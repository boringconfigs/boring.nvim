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
		config = function()
			require("monokai-pro").setup({
				filter = "ristretto",
				override = function()
					return {
						NonText = { fg = "#948a8b" },
						MiniIconsGrey = { fg = "#948a8b" },
						MiniIconsRed = { fg = "#fd6883" },
						MiniIconsBlue = { fg = "#85dacc" },
						MiniIconsGreen = { fg = "#adda78" },
						MiniIconsYellow = { fg = "#f9cc6c" },
						MiniIconsOrange = { fg = "#f38d70" },
						MiniIconsPurple = { fg = "#a8a9eb" },
						MiniIconsAzure = { fg = "#a8a9eb" },
						MiniIconsCyan = { fg = "#85dacc" },
					}
				end,
			})
		end,
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
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		priority = 1000,
	},
	{
		"EskelinenAntti/omarchy-theme-loader.nvim",
	},
}
