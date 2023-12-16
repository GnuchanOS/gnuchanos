sudo rm /usr/lib/python3.11/EXTERNALLY-MANAGED

sudo apt-get install -y python3-pip python3-tk
python3 -m PySimpleGUI.PySimpleGUI upgrade

pip install --no-cache --upgrade --no-build-isolation cairocffi xcffib
pip install qtile[all]

sudo mkdir -p /usr/share/xsessions
sudo cp qtile.desktop /usr/share/xsessions
cp -r qtile ~/.config/

mkdir -p ~/tmp
cd ~/tmp
git clone https://github.com/gnuchanos/gnuchangui
cd gnuchangui
pip install .
