#!/bin/zsh
#
RG_PREFIX="rga -is --files-with-matches"
local file
file="$(
       FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
       fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
       --phony -q "$1" \
       --bind "change:reload:$RG_PREFIX {q}" \
       --preview-window="70%:wrap"
       )" &&
      echo "opening $file" &&
      vim "$file"
