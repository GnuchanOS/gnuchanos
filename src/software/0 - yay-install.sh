#!/bin/bash

mkdir ~/tmp
cd ~/tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

# protontricks
yay -S rar


yay -Sy auto-cpufreq 
sudo auto-cpufreq --install
auto-cpufreq --stats
