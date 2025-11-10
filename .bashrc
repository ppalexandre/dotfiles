#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
shopt -s histappend # append to the history file instead of deleting it
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
HISTSIZE=500
HISTFILESIZE=20000

set -o vi

bind -m vi 'ç':'forward-char'
bind -m vi 'j':'backward-char'
bind -m vi 'l':'next-history'
bind -m vi 'k':'previous-history'
bind '"çç"':'vi-movement-mode'

shopt -s checkwinsize

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_system_specific ]; then
    . ~/.bash_system_specific
fi


PS1='\[\033[00;32m\]\u: \[\033[00m\]\[\033[01;34m\]\W\[\033[00;35m\]$ \[\033[00m\]'
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export PATH=~/bin:$PATH
export PATH=/usr/sbin:$PATH
export EDITOR=nvim
