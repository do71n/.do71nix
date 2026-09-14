# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    autoupdate
    zsh-history-substring-search
    zsh-vi-mode
    fast-syntax-highlighting
)

WORDCHARS="${WORDCHARS//\//}"
_autosuggest_accept_dir() {
  emulate -L zsh
  [[ -z $POSTDISPLAY ]] && return
  local rest=$POSTDISPLAY take
  if [[ $rest == */* ]]; then take="${rest%%/*}/"; else take=$rest; fi
  BUFFER+=$take
  POSTDISPLAY=${rest#$take}
  CURSOR=$#BUFFER
}
zle -N _autosuggest_accept_dir

source $ZSH/oh-my-zsh.sh
