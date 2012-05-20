## Dotfiles - configuration files for vim, bash, etc.

This repository contains my configuration files for various command-line
utilities, mainly `vim`. Vim plugins are, where applicable, added as
submodules.

I've written and included a setup script, `setup.sh`, that will iterate over
the files contained herein and symlink them to the appropriate locations in
the user's `$HOME` directory.

Installation instructions:

1. Check out a copy of the repository

    git clone https://wyattanderson@github.com/wyattanderson/dotfiles.git

1. Enter the `dotfiles` directory and run `setup.sh`
