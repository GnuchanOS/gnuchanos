#!/bin/bash


yay -Sy python-pip
python -m pip install psutil python-magic pyinstaller cairocffi cffi xcffib
sudo pacman -Sy tk python-adblock python-iwlib
