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

---Parse date from current buffer name, or return current date.
---@return osdate
local function get_buffer_date()
	local filename = vim.fn.expand("%:t")
	local y, m, d = filename:match("(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local date = { year = tonumber(y), month = tonumber(m), day = tonumber(d) }
	if not (date.year and date.month and date.day) then
		return os.date("*t") --[[@as osdate]]
	end

	return os.date("*t", os.time(date)) --[[@as osdate]]
end

---Open daily note.
---@param offset integer Offset from the current day. 1 meaning tomorrow, -1 yesterday, for example.
local function open_daily(offset)
	local base = get_buffer_date()
	base.day = base.day + offset
	local path = vim.fs.joinpath("daily", os.date("%Y-%m-%d", os.time(base)) .. ".md")
	vim.cmd.edit(path)
end

vim.api.nvim_create_user_command("Today", function()
	open_daily(0)
end, {})

vim.api.nvim_create_user_command("Yesterday", function()
	open_daily(-1)
end, {})

vim.api.nvim_create_user_command("Tomorrow", function()
	open_daily(1)
end, {})

require("plugins")
