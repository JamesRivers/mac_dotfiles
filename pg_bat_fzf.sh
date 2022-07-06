#!/bin/zsh
PG_PREFIX="pdfgrep -iHnr"
INITIAL_QUERY=""
FZF_DEFAULT_COMMAND="$PG_PREFIX '$INITIAL_QUERY'" 
  CHOICE=$(fzf --bind "change:reload:$PG_PREFIX {q} || true" \
      --sort \
      --multi \
      --preview '[[ ! -z {} ]] && rg --pretty --context 5 {q} {}' \
      --ansi --phony --query "$INITIAL_QUERY") 

[ -n "$CHOICE" ] && vim "$CHOICE"
