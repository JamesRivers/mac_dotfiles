#!/bin/zsh
for f in *\ *; do mv "$f" "${f// /_}"; done

