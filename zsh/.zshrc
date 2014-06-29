#!/usr/bin/env zsh

prompt='%n@%m:%~%# '
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -U compinit
compinit

setopt appendhistory
setopt autocd
setopt correct
setopt extendedglob
setopt nonotify
setopt nocheckjobs
setopt nohup
setopt cshnullglob
setopt incappendhistory
setopt sharehistory
setopt histignorealldups
setopt histreduceblanks
setopt histnostore
setopt histnofunctions

unsetopt beep

unset MANPATH

#export XMODIFIERS=@im=ibus
#export GTK_IM_MODULE=ibus
#export GTK_IM_MODULE_FILE=/usr/lib/gtk-3.0/3.0.0/immodules.cache
export CVS_RSH=ssh
export EDITOR=vim
export LESSCHARSET=utf-8
#export TERM=screen-256color

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'                           
export LESS_TERMCAP_so=$'\E[01;44;33m'                                 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

alias ls='ls -v --color=auto'
path=(/usr/bin /usr/bin/core_perl /usr/local/bin ~/bin)

umask 022

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'r:|.=* r:|=*'

bindkey -e

bindkey '\e[1~' beginning-of-line
bindkey '\e[3~' delete-char
bindkey '\e[4~' end-of-line
bindkey '^w' kill-region
bindkey '^u' universal-argument

#if [[ $TERM == linux ]]; then
#    setterm -blength 0
#    setterm -blank
#fi
case $TERM in
    screen*)     precmd () { print -Pn "\e]2;%m\a" } ;;
    xterm|rxvt*) precmd () { print -Pn "\e];%m\a"  } ;;
esac

if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
    export SSH_AGENT_PID
    export GPG_TTY=$(tty)
fi
