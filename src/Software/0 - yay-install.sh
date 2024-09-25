#!/bin/bash

mkdir ~/tmp
cd ~/tmp
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# protontricks
yay -S rar irssi
yay -S python-librosa gst-plugin-opencv

#  if gpu-screen-recorder broke after update use this  --rebuild
yay -S gpu-screen-recorder --rebuild
