#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))

  space=(
    space=$sid
    # icon="${SPACE_ICONS[i]}"
    # icon.padding_left=10
    # icon.padding_right=10
    # padding_left=2
    # padding_right=2
    label.padding_right=30
    icon.highlight_color=$MAGENTA
    label.color=$WHITE
    label.highlight_color=$MAGENTA
    # label.font="sketchybar-app-font:Regular:16.0"
    label.y_offset=-1
    background.color=$WHITE
    background.border_color=$MAGENTA
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid center    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done

space_creator=(
  icon=
  icon.font="$FONT:Heavy:16.0"
  # padding_left=4
  # padding_right=8
  label.drawing=on
  display=active
  # click_script='yabai -m space --create'
  script="$PLUGIN_DIR/space_windows.sh"
  icon.color=$RED
)

sketchybar --add item space_creator center               \
           --set space_creator "${space_creator[@]}"   \
           --subscribe space_creator space_windows_change
