XDG_CONFIG_HOME ?= ${HOME}/.config

git-prompt.sh := ${HOME}/.git-prompt.sh
git-completion.bash := ${HOME}/.git-completion.bash

dotfiles := $(addprefix $(HOME)/,$(filter-out .gitignore,$(shell git ls-files --exclude-standard ':(glob).*')) .vim)
configs := $(addprefix $(XDG_CONFIG_HOME)/,$(notdir $(wildcard .config/*)))

.PHONY: all
all: $(dotfiles) $(configs) $(git-prompt.sh) $(git-completion.bash)

$(XDG_CONFIG_HOME):
	mkdir -p $(XDG_CONFIG_HOME)

$(configs): | $(XDG_CONFIG_HOME)
	ln -sn $(CURDIR)/.config/$(notdir $@) $@

$(dotfiles):
	ln -sn $(CURDIR)/$(notdir $@) $@

$(git-prompt.sh):
	curl -fLo $@ \
		https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

$(git-completion.bash):
	curl -fLo $@ \
		https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
