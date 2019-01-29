
export PATH="$PATH:$HOME/.bin"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export SUBVERSION_HOME="$XDG_CONFIG_HOME/subversion"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
#export XAUTHORITY="$XDG_CONFIG_HOME/X11/Xauthority"
export LESSHISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/less/history"
export ncmpcpp_directory="$XDG_CONFIG_HOME/ncmpcpp"
