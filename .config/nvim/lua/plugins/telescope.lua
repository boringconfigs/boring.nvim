return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			file_ignore_patterns = {
				"^.git/",
				"^node_modules/",
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			live_grep = {
				additional_args = function(_)
					return { "--hidden" }
				end,
			},
			buffers = {
				mappings = {
					n = {
						["dd"] = "delete_buffer",
					},
				},
			},
		},
	},
}
