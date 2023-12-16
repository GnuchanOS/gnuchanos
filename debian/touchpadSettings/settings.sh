#!/bin/bash

sudo apt-get install -y xserver-xorg-input-libinput

sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/
