################################################################################
#                                  ZSH OPTIONS                                 #
################################################################################

# directories
setopt auto_cd
setopt pushd_ignore_dups
setopt extended_glob

#autocorrect
setopt correct
unsetopt correct_all

# history
setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history
setopt hist_ignore_all_dups

HISTSIZE=10000
SAVEHIST=9000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# bindings
bindkey -v

# no. fucking. beeps
unsetopt beep

################################################################################
#                                   ALIASES                                    #
################################################################################

alias v="nvim"
alias :q="exit"
alias ls!="/bin/ls -hNA --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias rmrf="rm -rf"
alias vdiff="nvim -d"
alias za="zathura"
alias py="python"

mkcd() { mkdir "$1" && cd "$1" }

serve() {
	local ip=$(ip a s wlo1 | awk '/inet /{print $2}' | cut -d/ -f1)
	php -S "$ip:${1:-8000}"
}

ls() {
	lsd "$@" --group-dirs first
}

entrls() {
	while true; ls! | entr -d -c lsd --tree --depth ${1:-2}
}

################################################################################
#                                   PLUGINS                                    #
################################################################################

export ZPLUG_HOME=$HOME/.local/share/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'rupa/z'
zplug 'MichaelAquilina/zsh-autoswitch-virtualenv'

if ! zplug check --verbose; then
	printf "Install ? [y/N]: "
	read -q && echo && zplug install
fi

export AUTOSWITCH_VIRTUAL_ENV_DIR="$HOME/.local/share/venv"
export _Z_DATA=$HOME/.local/share/z/data
source "$ZPLUG_REPOS/rupa/z/z.sh"

zplug load

#[ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)

export PROMPT_DEFAULT_USER="$USER"
source "$ZDOTDIR/prompt.zsh"

################################################################################
#                                  COMPLETION                                  #
################################################################################

if autoload -Uz compinit; then
	compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
	kitty + complete setup zsh | source /dev/stdin
fi

zstyle ':completion:*'             verbose yes
zstyle ':completion:*:description' format '%B%d%b'
zstyle ':completion:*:messages'    format '%d'
zstyle ':completion:*:warnings'    format 'No matches for: %d'
zstyle ':completion:*'             group-name ''

fpath=("$HOME/.local/share/completions" $fpath)
autoload -U "$HOME/.local/share/completions/*(:t)"

################################################################################
#                                   SSH AGENT                                  #
################################################################################

if ! pgrep -u "$USER" ssh-agent >/dev/null; then
	ssh-agent > "$HOME/.cache/ssh/ssh-agent-vars"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then 
	eval "$(<"$HOME/.cache/ssh/ssh-agent-vars")" >/dev/null
fi

