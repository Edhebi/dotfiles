#!/bin/zsh

autoload -Uz promptinit && promptinit
autoload -Uz colors && colors

setopt promptsubst

typeset -aHg PROMPT_SEGMENTS=(
	prompt_status
	prompt_context
	prompt_pwd
	prompt_git
)

prompt_status() {
	if [[ $RETVAL -eq 0 ]]
		then print -n " %{$fg[green]%}➜"
		else print -n " %{$fg[red]%}✘"
	fi
}

prompt_context() {
	local user=$(whoami)

	if [[ "$user" != "$PROMPT_DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
		print -n " %{$fg[magenta]%}$user@%m"
	fi
}

prompt_pwd() {
	print -n " %{$fg[cyan]%}%~"
}

prompt_git() {
	local ref
	is_dirty() {
	}
	
	ref="$vcs_info_msg_0_"
	[[ ! -n "$ref" ]] && return
		
	if test -n "$(git status --porcelain --ignore-submodules)"
		then print -n " %{$fg[yellow]%}"
		else print -n " %{$fg[green]%}"
	fi
	if [[ "${ref/.../}" == "$ref" ]];
		then print -n " $ref"
		else print -n "➦ $ref"
	fi
}

## Main prompt

prompt_main() {
	RETVAL=$?
	for segment in "${PROMPT_SEGMENTS[@]}"; do
		[[ -n $segment ]] && $segment
	done
}

prompt_precmd() {
	vcs_info
	PROMPT='$(prompt_main) %{$reset_color%}'
}

prompt_setup() {
	autoload -Uz add-zsh-hook
	autoload -Uz vcs_info

	prompt_opts=(cr subs percent)

	add-zsh-hook precmd prompt_precmd

	zstyle ':vcs_info:*' enable git
	zstyle ':vcs_info:*' check-for-changes false
	zstyle ':vcs_info:git*' formats '%b'
	zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_setup "$@"
