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
HISTFILE="~/.local/share/zsh/history"

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
alias vd="nvim -d"

mkcd() { mkdir "$1" && cd "$1" }

serve() {
	local ip=$(ip a s wlo1 | awk '/inet /{print $2}' | cut -d/ -f1)
	php -S "$ip:${1:-8000}"
}

################################################################################
#                                   PLUGINS                                    #
################################################################################

ZPLUG_HOME=$HOME/.local/share/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'agnoster/agnoster-zsh-theme'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'rupa/z'

if ! zplug check --verbose; then
	printf "Install ? [y/N]: "
	read -q && echo "" && zplug install
fi

zplug load

_Z_DATA=$HOME/.local/share/z/data
source "$ZPLUG_REPOS/rupa/z/z.sh"

################################################################################
#                                  COMPLETION                                  #
################################################################################

autoload -Uz compinit && compinit

################################################################################
#                                    PYWAL                                     #
################################################################################

[ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)

################################################################################
#                                    PROMPT                                    #
################################################################################

autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
setopt promptsubst
DEFAULT_USER=leo
DEFAULT_MACHINE=tangerine
SEP=$'\ue0b0'

SEG_PWD="%{$fg[black]%}%{$bg[cyan]%} %~ "
SEG_END="%{$reset_color%}%{$fg[cyan]%}$SEP%{$reset_color%} "

PROMPT="$SEG_PWD$SEG_END"

