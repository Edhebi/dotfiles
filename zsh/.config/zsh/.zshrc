# ENVIRONMENT -----------------------------------

export RC="$ZDOTDIR/.zshrc"
export PATH="$PATH:$HOME/.bin"

# ZSH OPTIONS  ----------------------------------
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

# ALIASES ---------------------------------------
alias v="nvim"
alias :q="exit"
alias r="R" # I don't often use R, but when I do, I mistype it

# PLUGINS ---------------------------------------
ZPLUG_HOME=$HOME/.local/share/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'agnoster/agnoster-zsh-theme'
zplug 'zsh-users/zsh-autosuggestions'

if ! zplug check --verbose; then
	printf "Install ? [y/N]: "
	read -q && zplug install
fi

zplug load

# COMPLETION ------------------------------------
autoload -Uz compinit && compinit

# WAL -------------------------------------------
[ -f ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)

# PROMPT ----------------------------------------
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
setopt promptsubst
DEFAULT_USER=leo
DEFAULT_MACHINE=tangerine
SEP=$'\ue0b0'

SEG_PWD="%{$fg[black]%}%{$bg[cyan]%} %~ "
SEG_END="%{$fg[cyan]%}%{$bg[black]%}$SEP%{$reset_color%} "

PROMPT="$SEG_PWD$SEG_END"
