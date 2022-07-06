#!/bin/zsh

vim $(fzf --preview='bat --color=always --style=plain {}')
