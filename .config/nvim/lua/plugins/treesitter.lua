return {
	"nvim-treesitter/nvim-treesitter",
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				-- Use the default keymap upcoming versions of Neovim
				-- will use for incremental selection.
				node_incremental = "an",
				node_decremental = "in",
				init_selection = false,
				scope_incremental = false,
			},
		},
	},
}
