#!/bin/bash

update() {
  source "$CONFIG_DIR/colors.sh"
  COLOR=$WHITE
  BORDER_COLOR=$TRANSPARENT
  if [ "$SELECTED" = "true" ]; then
    COLOR=$TRANSPARENT
    BORDER_COLOR=$WHITE
  fi
  sketchybar --set $NAME icon.highlight=$SELECTED \
                         label.highlight=$SELECTED \
                         background.border_color=$BORDER_COLOR \
                         background.color=$COLOR # all
}

set_space_label() {
  sketchybar --set $NAME icon="$@"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
  else
    if [ "$MODIFIER" = "shift" ]; then
      SPACE_LABEL="$(osascript -e "return (text returned of (display dialog \"Give a name to space $NAME:\" default answer \"\" with icon note buttons {\"Cancel\", \"Continue\"} default button \"Continue\"))")"
      if [ $? -eq 0 ]; then
        if [ "$SPACE_LABEL" = "" ]; then
          set_space_label "${NAME:6}"
        else
          set_space_label "${NAME:6} [$SPACE_LABEL]"
        fi
      fi
    else
      yabai -m space --focus $SID 2>/dev/null
    fi
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
