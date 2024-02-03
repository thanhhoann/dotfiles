#!/bin/bash

temperature=(
    script="$PLUGIN_DIR/temperature.sh"
    icon=󱤋
    icon.color=$WHITE
    icon.font="GoMono Nerd Font:Regular:19.0"
    update_freq=10
)
sketchybar --add item temperature center\
    --set temperature "${temperature[@]}" 
