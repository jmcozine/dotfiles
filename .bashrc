#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'

[[ -z $TMUX ]] && tmux -u new -A -s foo

