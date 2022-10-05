#!/usr/bin/sh

notify-send "Progress Bar" --hint int:value:50
sleep 1
notify-send -i "$HOME/.config/wired/test.png" "Progress Bar" --hint int:value:50
