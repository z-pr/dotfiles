#!/bin/bash

date=(
  label.font="$FONT:Regular:13"
  icon="􀧞"
  label.padding_left=4
  label.padding_right=4
  update_freq=10
)


sketchybar --add item calendar right \
           --set calendar "${date[@]}" \
                          script="$PLUGIN_DIR/calendar.sh" \
