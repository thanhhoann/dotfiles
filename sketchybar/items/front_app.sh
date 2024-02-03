#!/bin/bash

front_app=(
  label.font="$FONT:Black:12.0"
  icon.background.drawing=on
  display=active
  script="$PLUGIN_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"

  icon.padding_left=28
  icon.padding_right=10
  padding_left=2
  padding_right=2
  label.padding_right=8
  label.font="Iosevka Nerd Font Mono:Bold Italic:18.0"
  label.y_offset=0
  # background.color=$BACKGROUND_1
  # background.border_color=$BACKGROUND_2
)

sketchybar --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
