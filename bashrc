# Check the window size after each command
shopt -s checkwinsize

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
    <<< $HOSTNAME`
short_username=`
sed -e 's/wyatt/w/' \
    -e 's/wanderson/wa/' \
    <<< $USER`

if [ $short_username == $USER ]; then
   user_color='1;31' # red for non-wyatt user
elif [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
   user_color='0;37' # "light gray" for OS X terminal
else
   user_color='1;30' # dark gray
fi

red_flag=
if [ -e /etc/fds/prod ] || [ $USER == "root" ]; then
   red_flag="\[\e[37;41m\]"
fi

if [ -f ~/.bash_completion.d/git-completion.bash ]; then
   source ~/.bash_completion.d/git-completion.bash
   declare -x GIT_PS1_SHOWDIRTYSTATE=1
fi

# Calculate a short checksum of the real hostname to determine a unique color
host_color="$((31 + $(hostname | cksum | cut -c1-3) % 6))"

declare -x PS1='\[\e[${user_color}m\]$short_username\[\e[0m\]@\[\e[1;${host_color}m\]$short_host\[\e[0m\]:$red_flag\w\[\e[0m\]\$$(__git_ps1) '

alias ll='ls -lh'

if [ -r ~/.bashrc-local ]; then
   source ~/.bashrc-local
fi
