# Mac OSX sources .profile instead of .bashrc, so just source .bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# MAC OS specific stuff
export PATH="/usr/local/sbin:$PATH"
