#!/usr/bin/env bash
# Author : rxyhn

DIR="$HOME/.config/bspwm/assets"
BRIGHTNESS_STEPS=5

function get_brightness {
  brightnessctl i | grep -oP '\(\K[^%\)]+'
}

function send_notification {
  icon="$DIR/brightness.svg"
  brightness=$(get_brightness)
  bar=$(seq -s "─" 0 $((brightness / 5)) | sed 's/[0-9]//g')
  dunstify "Brightness $brightness%" -i $icon -r 5555 -u normal -h int:value:$(($brightness))
}

case $1 in
up)
  brightnessctl set "${BRIGHTNESS_STEPS:-5}%+" -q
  send_notification
  ;;
down)
  brightnessctl set "${BRIGHTNESS_STEPS:-5}%-" -q
  send_notification
  ;;
esac
