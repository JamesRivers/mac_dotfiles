#!/bin/zsh

vim $(fzf -i --preview='bat --color=always --style=plain {}')
