# Ignore duplicate entries in the history
declare -x HISTCONTROL=ignoreboth

# Set `color_prompt`
case "$TERM" in
   "xterm-color" | "xterm-256color") color_prompt=yes;;
esac

# If the display hasn't been set already, i.e. via SSH X-forwarding,
# set it to the remote host's primary display (this works for Xming)
if [ -n $DISPLAY ]; then
   declare -x DISPLAY=`cut -d ' ' -f 1 <<< $SSH_CLIENT`:0.0
fi

# User preferences
declare -x EDITOR=vim

if [ -r ~/.profile ]; then
   source ~/.profile
fi

if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi
