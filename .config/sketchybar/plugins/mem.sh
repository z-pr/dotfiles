#!/bin/bash

TMUX_MEM="$(tmux-mem -perc)"

sketchybar --set $NAME label="$TMUX_MEM"
