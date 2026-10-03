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

source $ZSH/oh-my-zsh.sh
