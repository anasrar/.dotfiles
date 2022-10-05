#!/usr/bin/sh

notify-send "Action" -A "true" -A "false" -A "nil" &> /dev/null &
sleep 1
notify-send "Action" "Choose Action" -A "true" -A "false" -A "nil" &> /dev/null &
sleep 1
notify-send -i "$HOME/.config/wired/test.png" "Action" "Choose Action" -A "fizz" -A "buzz" &> /dev/null &
