HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt noautomenu
setopt nomenucomplete
setopt SHARE_HISTORY
autoload -Uz compinit
compinit
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST

bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

PROMPT='%F{magenta}%n %F{cyan}%m %* %f%~ %F{magenta}${vcs_info_msg_0_}
> %f'

. $HOME/.profile
