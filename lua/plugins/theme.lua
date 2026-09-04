if require("omarchy-theme.environment").is_omarchy() then
	vim.cmd.colorscheme("omarchy")
else
	vim.cmd.colorscheme("kanso-zen")
end
