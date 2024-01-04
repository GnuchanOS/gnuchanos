#!/bin/bash

xrandr --newmode "1280x1024_60.00"  108.88  1280 1360 1496 1712  1024 1025 1028 1060  -HSync +Vsync
xrandr --addmode VGA-1 "1280x1024_60.00"
xrandr --output VGA-1 --mode "1280x1024_60.00"



xrandr --newmode "1368x768_60.00"  85.86  1368 1440 1584 1800  768 769 772 795  -HSync +Vsync
xrandr --addmode LVDS-1 "1368x768_60.00"
xrandr --output LVDS-1 --mode "1368x768_60.00"


xrandr --output LVDS-1 --left-of VGA-1
