vim.g.mapleader = " "
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open file explorer" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

require("plugins")

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
local on_attach = function(client, bufnr)
	vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
end
for _, server in ipairs(language_servers) do
	vim.lsp.config(server, { on_attach = on_attach })
end
vim.lsp.enable(language_servers)
