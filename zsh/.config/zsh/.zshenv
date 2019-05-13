export EDITOR='nvim'
export BROWSER='vivaldi-stable'

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export ncmpcpp_directory="$XDG_CONFIG_HOME/ncmpcpp"
export NPM_CONFIG_USERCONFIG="$XDG_CONDIF_HOME/npm/npmrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export SUBVERSION_HOME="$XDG_CONFIG_HOME/subversion"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$CARGO_HOME/bin"

export PATH

