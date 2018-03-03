shopt -s nocaseglob

shopt -s histappend

shopt -s cdspell

shopt -s checkwinsize

if [ -z "$EDITOR" ]; then
    export EDITOR=vim
fi

export HISTSIZE=50000000;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

# Make some commands not show up in history
export HISTIGNORE=" *:ls:cd:cd -:pwd";

export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";
