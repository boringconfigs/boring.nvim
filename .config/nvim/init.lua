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
vim.opt.clipboard:append("unnamedplus")
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open file explorer" })
vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], { desc = "Enter normal mode in terminal" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

require("plugins")
