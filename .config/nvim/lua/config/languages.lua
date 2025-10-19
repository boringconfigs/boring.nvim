return {
	--[[ List of enabled language servers. In order to add new languages, you need to do the following:
    --     1. Find and install the language server for the language.
    --     2. Find the configuration for the language server in nvim-lspconfig in https://github.com/neovim/nvim-lspconfig/tree/master/lsp
    --     3. Add the name of it (the name of the file without .lua extension) to below list.
    --]]
	language_servers = {
		"ts_ls",
		"tailwindcss",
		"kotlin_lsp",
		"gopls",
	},
	--[[ List of formatters by filetype. In order to add new formatters, you need to do the following:
    --     1. Find and install the formatter.
    --     2. Find the configuration for the formatter in https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
    --     3. Add the name of the configuration (the name of the file without .lua extension) to below list with filetype.
    --]]
	formatters_by_ft = {
		lua = { "stylua" },
		kotlin = { "ktfmt" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		markdown = { "prettier" },
		go = { "gofmt" },
	},
}
