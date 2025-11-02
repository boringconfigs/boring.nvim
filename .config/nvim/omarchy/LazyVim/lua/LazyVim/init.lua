local M = {}

M.opts = {}

-- Workaround for Omarchy depending on LazyVim
function M.setup(opts)
	M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})
	if M.opts.colorscheme then
		vim.schedule(function()
			local ok, err = pcall(vim.cmd.colorscheme, M.opts.colorscheme)
			if not ok then
				print("Failed to set colorscheme:", M.opts.colorscheme, "Error:", err)
			end
		end)
	end
end

return M
