local fzfLua = require("fzf-lua")
fzfLua.setup({
	files = {
		formatter = "path.filename_first",
	},
	grep = {
		rg_opts = "--hidden --line-number --column --no-heading --smart-case --color=never --glob=!node_modules/* --glob=!.git/* --glob=!build/* --glob=!package-lock.json",
		formatter = "path.filename_first",
	},
})

vim.keymap.set("n", "<leader>f", fzfLua.files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>b", fzfLua.buffers, { desc = "Telescope buffers" })
