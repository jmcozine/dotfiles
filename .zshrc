#!/usr/bin/env zsh

prompt='%n@%m:%~%# '
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -U compinit
compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

setopt autocd
setopt correct
setopt extendedglob
setopt nonotify
setopt nocheckjobs
setopt nohup
setopt cshnullglob
setopt appendhistory
setopt incappendhistory
setopt sharehistory
setopt histignorealldups
setopt histreduceblanks
setopt histnostore
setopt histnofunctions

unsetopt beep

export CVS_RSH=ssh
export EDITOR=vim
export LESSCHARSET=utf-8
export TERM=screen-256color
export GOPATH=~
export GPG_TTY=$(tty)

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

path=(/usr/bin /usr/bin/core_perl /usr/local/bin ~/bin)
alias ls='ls -v --color=auto'
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

umask 022

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'r:|.=* r:|=*'

bindkey -e

bindkey '\e[1~' beginning-of-line
bindkey '\e[3~' delete-char
bindkey '\e[4~' end-of-line
bindkey '^w' kill-region
bindkey '^u' universal-argument

[[ -z $TMUX ]] && tmux -u new -A -s foo
