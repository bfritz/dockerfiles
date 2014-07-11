#!/bin/sh

DISPLAY="$1"
if [ -z "$1" ]; then
    DISPLAY=:100
fi

export DISPLAY=$DISPLAY

SESSION=dev

tmux start-server
tmux new-session -d -s $SESSION -n ide
tmux send-keys -t $SESSION:0 'android-studio'
urxvt -e tmux attach-session -t $SESSION
