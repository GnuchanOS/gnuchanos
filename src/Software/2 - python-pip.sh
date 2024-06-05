#!/bin/bash

yay -S python-pip
mkdir ~/.config/pip
touch ~/.config/pip/pip.conf
cp pip.conf ~/.config/pip/

python -m pip install psutil python-magic pyinstaller  cairocffi cffi xcffib 
pip install ueberzug-bak
# iwlib metadata problem

sudo pacman -S tk


#PyInstaller tutorial1.py --onefile
sudo pacman -Sy python-adblock
pip install iwlib
