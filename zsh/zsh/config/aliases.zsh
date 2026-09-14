# ---- system and guards ----
alias xzsh="exec zsh"
alias rm='rm -I'
alias df="df -h" # disk usage display

# ---- path & file-listing -----
alias ls='eza -lh --icons --no-time --no-user --no-permissions --sort=extension'
alias ll="eza -lh --color --git --icons --sort=extension"
alias la="eza -lah --color --git --icons --sort=extension"
alias tree="eza --tree --icons"
alias path="echo $PATH | tr ':' '\n'"
compdef eza=ls

# ---- find & search -----
alias find="fd"
alias cat="bat"
alias grep="rg --color=auto"
alias diff="diff --color"

# ---- navigation -----
eval "$(zoxide init zsh)"
alias cd="z"

# ---- nvim & neovide ---
alias vim='nvim'
alias svim='sudo -E nvim'
alias nvid="(neovide > /dev/null 2>&1 &)"

# ---- yazi (file manager) ----
function fe() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ---- git ----
alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# ---- custom scripts ----
alias vpn="$HOME/tools/vpn.sh"
