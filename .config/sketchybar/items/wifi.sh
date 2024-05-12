#!/bin/bash

source "$PLUGIN_DIR/wifi.sh"

sketchybar --add item           wifi.control right                      \
                                                                        \
           --set wifi.control   icon=􀙇                                \
                                label.drawing=on                       \
                                click_script="$POPUP_CLICK_SCRIPT"      \
                                popup.background.color=$BAR_COLOR       \
                                popup.blur_radius=50                    \
                                popup.background.corner_radius=5        \
                                label="$SSID"                           \
                                                                        \
           --add item           wifi.ssid popup.wifi.control            \
           --set wifi.ssid      icon=􀤆                                \
                                label="${SSID}"                         \
                                                                        \
           --add item           wifi.speed     popup.wifi.control       \
           --set wifi.speed     icon=󰓅                       \
                                script="$PLUGIN_DIR/wifi_click.sh"        \
                                update_freq=10                          \
