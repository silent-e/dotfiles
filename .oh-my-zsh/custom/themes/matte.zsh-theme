PROMPT=$'%{$fg[green]%}%~%{$reset_color%} $(git_prompt_info)$(git_prompt_status)$(git_prompt_remote)
%{$fg_bold[black]%}➔%{$reset_color%} '

PROMPT2="%{$fg_blod[black]%}%_➔ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="]%{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="]"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[red]%}■%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED="↕"
ZSH_THEME_GIT_PROMPT_REMOTE_EXISTS="%{$fg[cyan]%}●%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_REMOTE_MISSING="%{$fg[cyan]%}○%{$reset_color%}"

CLICOLOR=1
LSCOLORS=gxfxhxhxcxegedabagacad
