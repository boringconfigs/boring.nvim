local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/nvim-mini/mini.nvim",
		mini_path,
	})
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })

local add = MiniDeps.add
add("stevearc/conform.nvim")
add("tpope/vim-surround")
add("neovim/nvim-lspconfig")
add("nvim-treesitter/nvim-treesitter")
add({ source = "nvim-telescope/telescope.nvim", checkout = "0.1.8", depends = { "nvim-lua/plenary.nvim" } })

add({
	source = "EskelinenAntti/omarchy-theme-loader.nvim",
	checkout = "dev",
	depends = {
		"ribru17/bamboo.nvim",
		{ source = "catppuccin/nvim", name = "catppuccin" },
		"neanias/everforest-nvim",
		"kepano/flexoki-neovim",
		"ellisonleao/gruvbox.nvim",
		"rebelot/kanagawa.nvim",
		"tahayvr/matteblack.nvim",
		"shaunsingh/nord.nvim",
		{ source = "rose-pine/neovim", name = "rose-pine" },
		"folke/tokyonight.nvim",
		"EdenEast/nightfox.nvim",
		"loctvl842/monokai-pro.nvim",
	},
})

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
