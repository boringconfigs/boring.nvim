return {
	"neovim/nvim-lspconfig",
	config = function()
		local language_servers = require("config.languages").language_servers

		local on_attach = function(client, bufnr)
			vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
		end

		for _, server in ipairs(language_servers) do
			vim.lsp.config(server, { on_attach = on_attach })
		end

		vim.lsp.enable(language_servers)
	end,
}
