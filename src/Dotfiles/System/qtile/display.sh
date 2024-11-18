#!/bin/bash

# VGA Monutor
#xrandr --newmode "1280x1024_60.00"  108.88  1280 1360 1496 1712  1024 1025 1028 1060  -HSync +Vsync
#xrandr --addmode VGA1 "1280x1024_60.00"
#xrandr --output VGA1 --mode "1024x768_60.00"

# Laptop Monutor
xrandr --newmode "1368x768_60.00"  85.86  1368 1440 1584 1800  768 769 772 795  -HSync +Vsync
xrandr --addmode LVDS1 "1368x768_60.00"
xrandr --output LVDS1 --mode "1368x768_60.00"
xrandr --output VGA1 --primary --left-of LVDS1

nitrogen --head=0 --set-scaled ~/.config/qtile/bg.png
nitrogen --head=1 --set-scaled ~/.config/qtile/bg.png
nitrogen  --restore &



# THIS IS IMPORTANT MESSAGE --> UwU
#xrandr --output LVDS1 --off
#xrandr --output VGA1 --auto







