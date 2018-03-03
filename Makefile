.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles:
	for file in $(shell git ls-files --exclude-standard $(CURDIR) | \
				  xargs -I {} find {} -name '.*' -not -name '.gitignore'); do \
		f=$$(basename $$file); \
		ln -sfn $(CURDIR)/$$file $(HOME)/$$f; \
	done;
