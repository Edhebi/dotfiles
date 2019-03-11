
PATH="$PATH:$HOME/.bin"
PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
export PATH

export EDITOR='nvim'


CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}

export GNUPGHOME="$CONFIG_HOME/gnupg"
export SUBVERSION_HOME="$CONFIG_HOME/subversion"
export WGETRC="$CONFIG_HOME/wget/wgetrc"
#export XAUTHORITY="$XDG_CONFIG_HOME/X11/Xauthority"
export LESSHISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/less/history"
export ncmpcpp_directory="$CONFIG_HOME/ncmpcpp"
