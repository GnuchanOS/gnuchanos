#!/bin/bash


yay -Sy python-pip
python -m pip install psutil python-magic pyinstaller cairocffi cffi xcffib --break-system-packages
sudo pacman -Sy tk python-adblock python-iwlib
