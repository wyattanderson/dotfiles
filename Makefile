VIM_DIR ?= ${HOME}/.vim

plug.vim := $(VIM_DIR)/autoload/plug.vim
git-prompt.sh := ${HOME}/.git-prompt.sh
git-completion.bash := ${HOME}/.git-completion.bash

.PHONY: all
all: dotfiles $(plug.vim) $(git-prompt.sh) $(git-completion.bash)

.PHONY: dotfiles
dotfiles:
	for file in $(shell git ls-files --exclude-standard $(CURDIR) | \
				  xargs -I {} find {} -name '.*' -not -name '.gitignore'); do \
		f=$$(basename $$file); \
		ln -sfn $(CURDIR)/$$file $(HOME)/$$f; \
	done; \
	[ -f $(CURDIR)/.extra ] && ln -sfn $(CURDIR)/.extra $(HOME)/.extra; \
	ln -sfn $(CURDIR)/.vim $(HOME)/.vim; \
	mkdir -p $(HOME)/.config; \
	ln -sfn $(CURDIR)/.config/nvim $(HOME)/.config/nvim;

$(plug.vim):
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(git-prompt.sh):
	curl -fLo $@ \
		https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

$(git-completion.bash):
	curl -fLo $@ \
		https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
