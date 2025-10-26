-- Collect all keymaps in single place

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>")

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.setqflist, { desc = "List diagnostics" })
