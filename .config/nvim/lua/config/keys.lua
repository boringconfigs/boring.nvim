-- Collect all keymaps in single place

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>")

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })

vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>r", builtin.lsp_references, { desc = "Telescope LSP references" })
