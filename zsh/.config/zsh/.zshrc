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
alias r="ranger"
alias ls="ls -hNA --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias vdiff="nvim -d"

mkcd() { mkdir "$1" && cd "$1" }

serve() {
	local ip=$(ip a s wlo1 | awk '/inet /{print $2}' | cut -d/ -f1)
	php -S "$ip:${1:-8000}"
}

################################################################################
#                                   PLUGINS                                    #
################################################################################

export ZPLUG_HOME=$HOME/.local/share/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'rupa/z'

if ! zplug check --verbose; then
	printf "Install ? [y/N]: "
	read -q && echo && zplug install
fi

zplug load

export _Z_DATA=$HOME/.local/share/z/data
source "$ZPLUG_REPOS/rupa/z/z.sh"

#[ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)

export PROMPT_DEFAULT_USER="$USER"
source "$ZDOTDIR/prompt.zsh"

################################################################################
#                                  COMPLETION                                  #
################################################################################

autoload -Uz compinit && \
	compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
