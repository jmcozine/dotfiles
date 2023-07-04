setopt AUTO_CD
setopt HIST_NO_STORE
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS

HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000

bindkey -e

autoload -U compinit
compinit -d $XDG_CACHE_HONE/zsh/zcompdump-$ZSH_VERSION

powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

