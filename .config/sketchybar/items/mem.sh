#!/bin/bash

sketchybar --add item mem right \
           --set mem update_freq=2 \
           label="$(tmux-mem -perc)" \
           icon=
