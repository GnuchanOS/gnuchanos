#!/bin/bash


# disable sleep mode
xset -dpms
xset s off
# disable sleep mode

picom --config ~/.config/qtile/picom.conf &

sh ~/.config/qtile/display.sh  &

nitrogen --restore &


start the conky to learn the shortcuts
killall conky
(conky -c ~/.config/qtile/system-overview) &



xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop
xinput disable 9
