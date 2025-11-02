.PHONY=all install configure

all: install configure

install:
	brew bundle
configure:
	stow . --target="${HOME}"
omarchy:
	ln -nsf "${HOME}/.config/omarchy/current/theme/neovim.lua" "${HOME}/.config/nvim/lua/plugins/theme.lua"
