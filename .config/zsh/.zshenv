typeset -U path PATH
path=(~/.local/bin $path)
export PATH
export EDITOR=vim
export TERM=screen-256color
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export ANDROID_HOME="$XDG_DATA_HOME"/android

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='ls -v --color=auto'
alias auracle='auracle -C /var/cache/aur/sources'
