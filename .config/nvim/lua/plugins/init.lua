require("plugins.mini-deps")

local deps = require("mini.deps")
local add = deps.add
add("stevearc/conform.nvim")
add("tpope/vim-surround")
add("neovim/nvim-lspconfig")
add("EskelinenAntti/omarchy-theme-loader.nvim")
add("ibhagwan/fzf-lua")

deps.snap_load()

--[[ List of enabled language servers. In order to add new languages, you need to do the following:
--     1. Find and install the language server for the language.
--     2. Find the configuration for the language server in nvim-lspconfig in https://github.com/neovim/nvim-lspconfig/tree/master/lsp
--     3. Add the name of it (the name of the file without .lua extension) to below list.
--]]
local language_servers = {
	"ts_ls",
	"tailwindcss",
	"kotlin_lsp",
	"gopls",
	"lua_ls",
	"json_ls",
	"yamlls",
	"pyright",
}

for _, server in ipairs(language_servers) do
	vim.lsp.config(server, {
		on_attach = function(client, bufnr)
			vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
		end,
	})
end

vim.lsp.config("lua_ls", {
	on_init = function(client)
		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

vim.lsp.enable(language_servers)

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

local fzfLua = require("fzf-lua")
fzfLua.setup({
	files = {
		find_opts = "-type f -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/build/*'",
	},
	grep = {
		rg_opts = "--hidden --line-number --column --no-heading --smart-case --color=never --glob=!node_modules/* --glob=!.git/* --glob=!build/* --glob=!package-lock.json",
	},
})

vim.keymap.set("n", "<leader>f", fzfLua.files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader><leader>", fzfLua.files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", fzfLua.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>b", fzfLua.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>d", fzfLua.diagnostics_workspace, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>r", fzfLua.lsp_references, { desc = "Telescope LSP references" })

vim.cmd.colorscheme("retrobox")
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

require("omarchy-theme-loader.transparency").set_transparent_background()
