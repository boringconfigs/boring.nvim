-- Leader key.
-- Note, this needs to be specified before loading Lazy.nvim, hence define it here.
vim.g.mapleader = " "

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Use block cursor
vim.opt.guicursor = ""

-- Hide file browser banner
vim.g.netrw_banner = 0

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Always show the sign column (prevents text from shifting when signs appear)
vim.opt.signcolumn = "yes"

-- Autocomplete
vim.opt.completeopt = { "menuone", "noselect", "popup" }

-- No wrapping because my code is not a burrito
vim.opt.wrap = false

-- Disable swap file
vim.opt.swapfile = false

-- Use a retry dir
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignore:append(".git/**")
