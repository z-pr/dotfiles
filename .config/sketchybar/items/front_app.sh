#!/bin/bash

sketchybar --add item front_app left \
           --set front_app background.color=$BAR_COLOR \
           background.height=24 blur_radius=32 \
           background.corner_radius=10 \
           icon.color=$LABEL_COLOR icon.font="sketchybar-app-font:Regular:16.0" \
           label.color=$LABEL_COLOR script="$PLUGIN_DIR/front_app.sh" \
           label.padding_right=10 icon.padding_left=10 \
           --subscribe front_app front_app_switched
