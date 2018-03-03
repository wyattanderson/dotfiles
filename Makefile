plug.vim := ${HOME}/.vim/autoload/plug.vim
git-prompt.sh := ${HOME}/.git-prompt.sh

.PHONY: all
all: dotfiles $(plug.vim) $(git-prompt.sh)

.PHONY: dotfiles
dotfiles:
	for file in $(shell git ls-files --exclude-standard $(CURDIR) | \
				  xargs -I {} find {} -name '.*' -not -name '.gitignore'); do \
		f=$$(basename $$file); \
		ln -sfn $(CURDIR)/$$file $(HOME)/$$f; \
	done;

$(plug.vim):
	curl -fLo $@ --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(git-prompt.sh):
	curl -fLo $@ \
		https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
