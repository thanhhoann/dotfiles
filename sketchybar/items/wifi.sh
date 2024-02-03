#!/bin/bash

source "$CONFIG_DIR/icons.sh"

wifi=(
  padding_right=7
  label.width=0
  icon="$WIFI_DISCONNECTED"
  script="$PLUGIN_DIR/wifi.sh"

  icon.padding_left=10
  icon.padding_right=10
  padding_left=2
  padding_right=2
  label.padding_right=8
  label.font="FantasqueSansMono Nerd Font Mono:Bold:18.0"
  label.y_offset=-1
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
                      update_freq=5 \
           --subscribe wifi wifi_change mouse.clicked \
