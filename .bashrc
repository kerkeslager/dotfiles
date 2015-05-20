# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set the prompt
PS1='\w\$ '

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias emacs='emacs -nw'
alias serve='python -m SimpleHTTPServer 8080'

export SVN_EDITOR=vim

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Add the ~/bin directory to the path.  This allows you to install simple
# binaries by simply moving them into ~/bin.
if [ -d $HOME/bin ]; then
	PATH="$HOME/bin:$PATH"
	export PATH
fi

# Put $HOME/.cabal/bin on the path. Installing cabal doesn't
# automatically put installed packages on the path.
if [ -d $HOME/.cabal/bin ]; then
    PATH="$HOME/.cabal/bin:$PATH"
    export PATH
fi

# Put /usr/local/bin (where homebrew installs stuff) before /usr/bin on the
# path. This means that if a program exists at both locations, calls to that
# program will use the homebrew version rather than the system version.
PATH="/usr/local/bin:$PATH"
export PATH

# Run a machine-specific bashrc (if it exists).
if [ -f $HOME/.bashrc_local ]; then
	source $HOME/.bashrc_local
fi

# Install RVM if it's not installed.
if [ ! -f $HOME/.rvm/scripts/rvm ]; then
    bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
fi

# Load RVM into shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Automatically open screen.
# The if statement prevents it from recursing (since screen opens bash).
if [ $TERM != screen ]; then
	screen
fi

# Gets a directory named .env if it exists in the currend directory or any of its parents
get_env() {
    if [ -d "$1/.env" ] ; then
        echo "$1/.env"
    else
        if [ -d "$1/.." ] ; then
            get_env "$1/.."
        fi
    fi
}

on_prompt() {
    # Load a virtualenv environment if it exists in a file named .env
    env_folder=$(get_env $(pwd))

    if [ -d "$env_folder" ] ; then
        if [[ $VIRTUAL_ENV != $env_folder ]] ; then
            echo "Activating env '$env_folder'"
            source "$env_folder/bin/activate"
        fi
    else
        if [ -d "$VIRTUAL_ENV" ] ; then
            deactivate
        fi
    fi
}

# Set vi keybindings
set -o vi

# Call on_prompt() every time the command prompt executes
PROMPT_COMMAND=on_prompt

