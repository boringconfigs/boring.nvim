.PHONY=all install configure

all: install configure

install:
	brew bundle
configure:
	stow . --target="${HOME}"
