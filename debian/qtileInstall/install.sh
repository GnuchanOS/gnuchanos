#!/bin/bash

sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED

sudo apt-get install -y python3-pip python3-tk
pip3 install PySimpleGUI
python3 -m PySimpleGUI.PySimpleGUI upgrade

sudo apt update
sudo apt install python3-full python3-pip libpangocairo-1.0-0 python3-cffi python3-xcffib git -y

pip install --no-cache-dir cairocffi

git clone https://github.com/qtile/qtile.git

cd qtile
pip install .

cat > ./temp << "EOF"
[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Type=Application
Keywords=wm;tiling
EOF

sudo cp ./temp /usr/share/xsessions/qtile.desktop
sudo echo "Exec=/home/$USER/.local/bin/qtile start" | sudo tee -a /usr/share/xsessions/qtile.desktop

rm ./temp

cp -r qtile ~/.config/


mkdir -p ~/tmp
cd ~/tmp
git clone https://github.com/gnuchanos/gnuchangui
cd gnuchangui
pip install .
python -m pip install psutil python-magic pyinstaller  cairocffi cffi xcffib 
