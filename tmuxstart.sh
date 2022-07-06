#!/bin/zsh
session="rivers-term"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'ZET'
tmux send-keys -t $session:$window 'cd ~/GitFiles/zet/' C-m 
window=1
tmux new-window -t $session:$window -n 'SSH'
tmux send-keys -t $session:$window 'fast-ssh' C-m 
window=2
tmux new-window -t $session:$window -n 'VPN'
tmux send-keys -t $session:$window 'echo onvpn for imagine vpn or onwg for home' C-m
window=3
tmux new-window -t $session:$window -n 'CONTENT_DEV'
tmux send-keys -t $session:$window 'cd ~/GitFiles/academy' C-m
window=4
tmux new-window -t $session:$window -n 'BTOP'
tmux send-keys -t $session:$window 'btop' C-m

tmux attach-session -t $session
