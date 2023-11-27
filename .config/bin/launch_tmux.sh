#!/bin/bash
tmux_sessions=$(tmux ls | sed 's/:.*//g')

if [[ -z $TMUX ]]; then
    if tmux has-session -t="default" 2> /dev/null; then
        tmux attach -t="default"
    else
        tmux new -s default
    fi
fi
