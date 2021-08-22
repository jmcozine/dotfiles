#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias config='git --git-dir=$HOME/.cfg --work-tree=$HOME'
PS1='[\u@\h \W]\$ '

