typeset -U PATH path
path=(~/.local/bin ${path[@]})
export PATH

export EDITOR=vim
export TERM=screen-256color

powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

autoload -U compinit
compinit -d $XDG_CACHE_HONE/zsh/zcompdump-$ZSH_VERSION


export HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000

export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

setopt AUTO_CD
setopt HIST_NO_STORE
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls -v --color=auto'
