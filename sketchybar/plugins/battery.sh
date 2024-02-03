#!/usr/bin/env sh

# Battery is here bcause the ICON_COLOR doesn't play well with all background colors

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
    exit 0
fi

case ${PERCENTAGE} in
[8-9][0-9] | 100)
    ICON=""
    ICON_COLOR=0xffa6da95
    ;;
7[0-9])
    ICON=""
    ICON_COLOR=0xffeed49f
    ;;
[4-6][0-9])
    ICON=""
    ICON_COLOR=0xfff5a97f
    ;;
[1-3][0-9])
    ICON=""
    ICON_COLOR=0xffee99a0
    ;;
[0-9])
    ICON=""
    ICON_COLOR=0xffed8796
    ;;
esac

if [[ $CHARGING != "" ]]; then
    ICON=""
    ICON_COLOR=0xffeed49f
fi

sketchybar --set $NAME \
    icon=$ICON \
    label="${PERCENTAGE}%" \

# #!/bin/bash
#
# source "$CONFIG_DIR/icons.sh"
# source "$CONFIG_DIR/colors.sh"
#
# BATTERY_INFO="$(pmset -g batt)"
# PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "\d+%" | cut -d% -f1)
# CHARGING=$(echo "$BATTERY_INFO" | grep 'AC Power')
#
# if [ $PERCENTAGE = "" ]; then
#   exit 0
# fi
#
# DRAWING=on
# COLOR=$WHITE
# case ${PERCENTAGE} in
#   9[0-9]|100) ICON=$BATTERY_100; DRAWING=off
#   ;;
#   [6-8][0-9]) ICON=$BATTERY_75; DRAWING=off
#   ;;
#   [3-5][0-9]) ICON=$BATTERY_50
#   ;;
#   [1-2][0-9]) ICON=$BATTERY_25; COLOR=$ORANGE
#   ;;
#   *) ICON=$BATTERY_0; COLOR=$RED
# esac
#
# if [[ $CHARGING != "" ]]; then
#   ICON=$BATTERY_CHARGING
#   DRAWING=off
# fi
#
# sketchybar --set $NAME drawing=$DRAWING icon="$ICON" icon.color=$COLOR
    icon.color=${ICON_COLOR}
