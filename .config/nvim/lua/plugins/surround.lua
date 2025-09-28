return {
	"kylechui/nvim-surround",
	version = "^3.0.0",
	config = function(_, opts)
		require("nvim-surround").setup(opts)
	end,
}
