#!/usr/bin/sh

notify-send "Notification Title"
sleep 1
notify-send "Notification" "Message Will Be Here"
sleep 1
notify-send "Notification Long Body" "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget malesuada erat."
sleep 1
notify-send -i "$HOME/.config/wired/test.png" "Notification Image" "Message Will Be Here"
