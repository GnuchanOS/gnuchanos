#!/bin/bash

mkdir ~/tmp
cd ~/tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

# protontricks
yay -S rar irssi
yay -S python-librosa gst-plugin-opencv

#  if gpu-screen-recorder broke after update use this  --rebuild
yay -S gpu-screen-recorder --rebuild