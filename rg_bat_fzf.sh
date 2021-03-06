#!/bin/zsh
RG_PREFIX="rg -i --files-with-matches"
INITIAL_QUERY=""
FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" 
  CHOICE=$(fzf --bind "change:reload:$RG_PREFIX {q} || true" \
      --sort \
      --multi \
      --preview '[[ ! -z {} ]] && rg -i --pretty --context 5 {q} {}' \
      --ansi --phony --query "$INITIAL_QUERY") 

[ -n "$CHOICE" ] && vim "$CHOICE"
