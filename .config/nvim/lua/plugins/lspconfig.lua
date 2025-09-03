return {
	"neovim/nvim-lspconfig",
	config = function()
		local language_servers = require("config.languages").language_servers
		vim.lsp.enable(language_servers)
	end,
}
