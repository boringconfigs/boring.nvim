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
add({ source = "stevearc/conform.nvim" })
add({ source = "tpope/vim-surround" })
add({ source = "nvim-telescope/telescope.nvim", checkout = "0.1.8", depends = { "nvim-lua/plenary.nvim" } })
add({ source = "neovim/nvim-lspconfig" })
add({ source = "nvim-treesitter/nvim-treesitter" })
add({ source = "catppuccin/nvim", name = "catppuccin" })
