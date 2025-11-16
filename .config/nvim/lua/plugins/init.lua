require("plugins.install")
require("plugins.lsp")

require("conform").setup({
	format_on_save = {},
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
})

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"^.git/",
			"^node_modules/",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			additional_args = function(_)
				return { "--hidden" }
			end,
		},
		buffers = {
			mappings = {
				n = {
					["dd"] = "delete_buffer",
				},
			},
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>r", builtin.lsp_references, { desc = "Telescope LSP references" })

require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	ensure_installed = {},
	sync_install = false,
	ignore_install = {},
	modules = {},
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "an",
			node_decremental = "in",
			init_selection = false,
			scope_incremental = false,
		},
	},
})

vim.cmd.colorscheme("retrobox")
require("omarchy-theme-loader.transparency").set_transparent_background()
