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
