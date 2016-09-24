# Ignore duplicate entries in the history
declare -x HISTCONTROL=ignoreboth

# Set `color_prompt`
case "$TERM" in
    "rxvt-unicode-256color" | "screen-256color" | "xterm-color" | "xterm-256color") color_prompt=yes;;
esac

os=`uname -s`

# If the display hasn't been set already, i.e. via SSH X-forwarding,
# set it to the remote host's primary display (this works for Xming)
if [ -z "$DISPLAY" ] && [ -n "$SSH_CLIENT" ]; then
    declare -x DISPLAY=`cut -d ' ' -f 1 <<< $SSH_CLIENT`:0.0
fi

# Set up EDITOR based on what's available
if [ -z "$EDITOR" ]; then
    declare -x EDITOR=vim
fi

if [[ -s "$HOME/local/bin/" ]]; then
    PATH=$HOME/local/bin:$PATH
fi

if [[ -s "/usr/local/go/bin" ]]; then
    PATH=$PATH:/usr/local/go/bin
fi

if [[ ${os} == "Linux" ]]; then
    declare -x LANG='en_US.utf8'
elif [[ ${os} == "Darwin" ]]; then
    declare -x LANG='en_US.UTF-8'
fi

# Check the window size after each command
shopt -s checkwinsize
shopt -s histappend

[ -z  "$PS1" ] && return

if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
fi

# Set up the prompt. First, we collapse the hostname to something recognizable
# but short and sensible
short_host=`
sed -e 's/justice/j/' \
    -e 's/unixdev/ud/' \
    -e 's/li237-186/li/' \
    -e 's/phoenix\.int\.wyattanderson\.com/ph/' \
    -e 's/Wyatts-MacBook-Air\.local/vmba/' \
    -e 's/d\.voxy\.com/d/' \
    -e 's/mba.int.wyattanderson.com/mba/' \
    <<< $HOSTNAME`
short_username=`
sed -e 's/wyatt/w/' \
    -e 's/wanderson/wa/' \
    <<< $USER`

if [ $short_username == $USER ]; then
    user_color='1;31' # red for non-wyatt user
else
    user_color='0;37' # light gray
fi

red_flag='0'
if [ -e /etc/fds/prod ] || [ $USER == "root" ]; then
    red_flag='37;41'
fi

source ~/.bash_completion.d/git-completion.bash
source ~/dotfiles/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1

# Calculate a short checksum of the real hostname to determine a unique color
if [ "$os" == "SunOS" ]; then
    hostname_cmd='hostname'
else
    hostname_cmd='hostname -f'
fi

checksum=$($hostname_cmd | cksum | cut -c1-3)
if [ $color_prompt ]; then
    host_color="38;5;$((16 + $((checksum % 107)) * 2))";
else
    host_color="1;$((checksum % 6))";
fi

declare -x PS1='\[\e[0;37m\]\!\[\e[0m\] \[\e[${user_color}m\]$short_username\[\e[0m\]@\[\e[${host_color}m\]$short_host\[\e[0m\]:\[\e[${red_flag}m\]\W\[\e[0m\]\$$(__git_ps1 " (%s)") '

alias ll='ls -lh'

# SSH to a remote machine and attach the first available tmux session
rtma ()
{
    ssh -A -t $1 tmux at
}

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

if [ -r ~/.bashrc-local ]; then
    source ~/.bashrc-local
fi

if [ -f virtualenvwrapper.sh ]; then
    source virtualenvwrapper.sh
fi
