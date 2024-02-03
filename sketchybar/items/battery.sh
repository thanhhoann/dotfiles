#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="JetBrainsMono Nerd Font Mono:Regular:29.0"
  padding_right=5
  padding_left=0
  label.drawing=on
  update_freq=120
  updates=on

  icon.padding_left=10
  icon.padding_right=11
  padding_left=2
  padding_right=2
  label.padding_right=8
  label.font="FantasqueSansMono Nerd Font Mono:Bold:15.0"
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

# sketchybar --add item battery right      \
#            --set battery "${battery[@]}" \
#            --subscribe battery power_source_change system_woke

sketchybar --add item battery right \
           --set battery "${battery[@]}" \
           update_freq=20 \
