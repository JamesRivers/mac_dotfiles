#!/bin/zsh
session="rivers-term"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'HOME'

window=1
tmux new-window -t $session:$window -n 'LYNX'
tmux send-keys -t $session:$window '? https://duckduckgo.com/' C-m 

window=2
tmux new-window -t $session:$window -n 'THAMES'
tmux send-keys -t $session:$window 'onvpn' C-m

Vwindow=3
tmux new-window -t $session:$window -n 'CONTENT_DEV'
tmux send-keys -t $session:$window 'cd ~/GitFiles/academy' C-m

window=4
tmux new-window -t $session:$window -n 'BTOP'
tmux send-keys -t $session:$window 'btop' C-m

tmux attach-session -t $session
