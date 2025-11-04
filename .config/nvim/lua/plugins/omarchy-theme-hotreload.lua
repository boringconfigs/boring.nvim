return {
	name = "theme-hotreload",
	dir = vim.fn.stdpath("config"),
	lazy = false,
	priority = 1000,
	config = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyReload",
			callback = function()
				vim.schedule(function()
					theme_spec = require("plugins.local.theme")
					local config = theme_spec["config"]
					if config then
						config()
					end

					local transparency_file = vim.fn.stdpath("config") .. "/lua/config/transparent-background.lua"
					vim.cmd.source(transparency_file)
				end)
			end,
		})
	end,
}
