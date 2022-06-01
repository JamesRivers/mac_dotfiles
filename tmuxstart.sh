#!/bin/zsh
tmux new-session \; \
send-keys 'cd ~/GitFiles/' C-m \; \
split-window -h -p 30 \; \
send-keys 'zsh ~/GitFiles/cli_clocks/timedateworldedit.sh' C-m \; \
select-pane -t 1 \; \
split-window -v \; \
send-keys 'btop' C-m \;
