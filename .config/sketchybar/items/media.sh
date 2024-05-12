#!/bin/bash

sketchybar --add item media center \
           --set media label.color=$LABEL_COLOR \
           label.max_chars=40 icon.padding_left=4 label.padding_right=4 \
           scroll_texts=on icon=󰽰 icon.color=$ICON_COLOR \
           background.drawing=off script="$PLUGIN_DIR/media.sh" \
           updates=on background.color=$BAR_COLOR \
           background.corner_radius=$PADDINGS background.height=24 \
           blur_radius=32 \
           --subscribe media media_change
