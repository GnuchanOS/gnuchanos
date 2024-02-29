#!/bin/bash


# disable sleep mode
xset -dpms
xset s off
# disable sleep mode

sh ~/.config/qtile/display.sh  &

nitrogen --restore &

start the conky to learn the shortcuts
killall conky
(conky -c ~/.config/qtile/system-overview) &

