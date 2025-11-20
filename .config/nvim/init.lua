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

---@param time integer?
---@return osdate
local function osdate(time)
	return os.date("*t", time) --[[@as osdate]]
end

---Parse date from current buffer name, or return current date.
---@return osdate
local function get_buffer_date()
	local filename = vim.fn.expand("%:t")
	local y, m, d = filename:match("(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local date = { year = tonumber(y), month = tonumber(m), day = tonumber(d) }
	if not (date.year and date.month and date.day) then
		return osdate()
	end

	return osdate(os.time(date))
end

---Open daily note for given date
---@param date osdate
local function open_daily_note(date)
	vim.cmd.edit(vim.fs.joinpath("daily", os.date("%Y-%m-%d", os.time(date)) .. ".md"))
end

---Open next/previous daily note with given offset of days to currently open note or current day
---@param offset integer Offset from the current day or note that is currently open. 1 meaning tomorrow, -1 yesterday, for example.
local function open_daily_at_offset(offset)
	local base = get_buffer_date()
	base.day = base.day + offset
	open_daily_note(base)
end

vim.api.nvim_create_user_command("Today", function()
	open_daily_note(osdate())
end, {})

vim.api.nvim_create_user_command("Yesterday", function()
	open_daily_at_offset(-1)
end, {})

vim.api.nvim_create_user_command("Tomorrow", function()
	open_daily_at_offset(1)
end, {})

require("plugins")
