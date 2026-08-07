bindkey '\e[B' history-search-forward
bindkey '\e[A' history-search-backward
bindkey '^R' history-incremental-pattern-search-backward

typeset -g -A key
key[Delete]="${terminfo[kdch1]}"

[[ -n "${key[Delete]}" ]] && bindkey -- "${key[Delete]}" delete-char
