#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
shopt -s histappend # append to the history file instead of deleting it
HISTSIZE=500
HISTFILESIZE=20000

shopt -s checkwinsize

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PS1='\[\033[00;32m\]\u: \[\033[00m\]\[\033[01;34m\]\W\[\033[00;35m\]$ \[\033[00m\]'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export PATH=~/bin:$PATH
export PATH=/usr/sbin:$PATH
export EDITOR=nvim
