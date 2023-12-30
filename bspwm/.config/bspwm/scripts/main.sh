#!/bin/sh

wid=$1
class=$2
instance=$3
title=$(xdotool getwindowname $wid)

## Debug
# echo "$wid:$class:$instance:$title" >> /tmp/bspwm_script_debug # to watch run `tail -f /tmp/bspwm_script_debug`

## VLC control
if [ "$class:$instance:$title" == "vlc:vlc:vlc" ]; then
  echo "layer=above border=off"
fi

# NetBeans
if [ "$class:$instance:$title" == "NetBeans IDE 8.2:sun-awt-X11-XFramePeer:NetBeans IDE 8.2" ]; then
  echo "state=floating rectangle=1202x1004+560+40"
fi

# Java ME emulator
if [ "$class" == "com-sun-kvem-environment-JVM" ]; then
  echo "state=floating"
  xdotool windowmove $wid 224 248
fi

# Android emulator
if [ "$title" == "Emulator" ]; then
  echo "state=floating border=off"
fi
