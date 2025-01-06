#!/bin/bash




mkdir ~/tmp
cd tmp

sudo pacman -Syu --needed base-devel
git clone https://aur.archlinux.org/yay.git

cd yay
makepkg -si
yay -S rar irssi gpu-screen-recorder --rebuild

yay -Sy zenpower3-dkms-git roxterm
