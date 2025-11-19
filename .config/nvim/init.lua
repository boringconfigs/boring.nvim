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
vim.keymap.set("t", "<C-w>N", [[<C-\><C-n>]], { desc = "Enter normal mode in terminal" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })

vim.api.nvim_create_user_command("Today", function()
	vim.cmd.edit(vim.fs.joinpath("daily", os.date("%Y-%m-%d") .. ".md"))
end, {})

vim.api.nvim_create_user_command("Yesterday", function()
	local yesterday = os.date("*t")
	yesterday.day = yesterday.day - 1
	if type(yesterday) == "string" then
		return
	end
	vim.cmd.edit(vim.fs.joinpath("daily", os.date("%Y-%m-%d", os.time(yesterday)) .. ".md"))
end, {})

vim.api.nvim_create_user_command("Tomorrow", function()
	local tomorrow = os.date("*t")
	tomorrow.day = tomorrow.day + 1
	if type(tomorrow) == "string" then
		return
	end
	vim.cmd.edit(vim.fs.joinpath("daily", os.date("%Y-%m-%d", os.time(tomorrow)) .. ".md"))
end, {})
require("plugins")
