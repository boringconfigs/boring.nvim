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

add("EskelinenAntti/omarchy-theme-loader.nvim")
require("omarchy-theme-loader").setup({
	themes = {
		["tokyo-night"] = { colorscheme = "slate" },
		["catppuccin"] = { colorscheme = "blue" },
		["everforest"] = { colorscheme = "desert" },
		["gruvbox"] = { colorscheme = "retrobox" },
		["osaka-jade"] = { colorscheme = "slate" },
		["kanagawa"] = { colorscheme = "slate" },
		["nord"] = { colorscheme = "blue" },
		["matte-black"] = { colorscheme = "koehler" },
		["ristretto"] = { colorscheme = "koehler" },
		["flexoki-light"] = { colorscheme = "morning" },
		["rose-pine"] = { colorscheme = "morning" },
		["catppuccin-latte"] = { colorscheme = "delek" },
	},
})

vim.cmd.colorscheme("retrobox")
require("omarchy-theme-loader.transparency").set_transparent_background()

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
