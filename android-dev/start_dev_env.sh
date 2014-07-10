#!/bin/sh

SESSION=dev

tmux start-server
tmux new-session -d -s $SESSION
tmux send-keys -t $SESSION:0 'android-studio'
urxvt -e tmux attach-session -t $SESSION
