return {
	"stevearc/conform.nvim",
	opts = function()
		return {
			format_on_save = {},
			formatters_by_ft = require("config.languages").formatters_by_ft,
		}
	end,
}
