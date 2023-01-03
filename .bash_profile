#!/bin/bash

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{profile,bash_prompt,aliases,functions,path,dockerfunc,extra,exports,git-prompt.sh,git-completion.bash}; do
    if [[ -r "$file" ]] && [[ -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "$file"
    fi
done
unset file

shopt -s nocaseglob

shopt -s histappend

shopt -s cdspell

shopt -s checkwinsize

ulimit -n 10240

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
