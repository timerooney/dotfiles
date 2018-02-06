# Simple theme based on my old zsh settings.

function get_host {
	echo $USER'.'$HOST
}

PROMPT='%F{153}$(get_host) %F{196}:%F{202}:%F{214}:%f '
RPROMPT='%F{214}[%F{153}%~$(git_prompt_info)%F{214}]'

# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}x"
ZSH_THEME_GIT_PROMPT_PREFIX="%F{202}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{202})"
