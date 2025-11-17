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

local deps = require("mini.deps")
deps.setup({ path = { package = path_package } })

local add = deps.add
add("stevearc/conform.nvim")
add("tpope/vim-surround")
add("neovim/nvim-lspconfig")
add("nvim-treesitter/nvim-treesitter")
add("EskelinenAntti/omarchy-theme-loader.nvim")
add("ibhagwan/fzf-lua")

deps.snap_load()
