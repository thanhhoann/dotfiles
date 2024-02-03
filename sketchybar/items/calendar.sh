#!/bin/bash

calendar=(
  icon=cal
  icon.font="GoMono Nerd Font:Bold:15.0"
  label.font="GoMono Nerd Font:Bold Italic:15.0"
  icon.padding_right=0
  label.width=45
  label.align=right
  padding_left=15
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"

  icon.padding_left=10
  icon.padding_right=38
  padding_left=2
  padding_right=2
  label.padding_right=8
  label.y_offset=0
  # icon.color=0xff03071e
  # label.color=0xff03071e
  # background.color=0xffe9c46a
  icon.color=$WHITE
  label.color=$WHITE
  background.color=$TRANSPARENT
  background.border_color=$BACKGROUND_2
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
