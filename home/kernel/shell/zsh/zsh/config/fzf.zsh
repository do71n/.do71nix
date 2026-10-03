# fzf: source and command
export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fzf: UI
export FZF_DEFAULT_OPTS="
  --height=60%
  --layout=reverse
  --prompt='🔍 '
  --pointer='➜'
  --border=rounded
  --preview 'bat --style=numbers --color=always {}'
  --preview-window=right:65%:wrap:border-left
"

# fzf: preview (Ctrl+T)
export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# fzf: reverse-i-search (Ctrl+R)
export FZF_CTRL_R_OPTS="
  --header='[ 📜 Cmd ]'
  --preview-window='hidden'
"

# Custom Widget: Files Excluding Hidden (Ctrl+F)
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"
  zle reset-prompt
}
zle -N _fzf_file_no_hidden
