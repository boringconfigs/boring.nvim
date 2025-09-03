-- Collect all keymaps in single place

-- File explorer
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>")

-- Autocomplete
vim.keymap.set("i", "<C-K>", function()
	vim.lsp.completion.get()
end)

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })

-- Lazygit
vim.keymap.set("n", "<leader>g", function()
	vim.cmd("terminal lazygit")
	vim.cmd("startinsert")
end, { desc = "Open lazygit" })
