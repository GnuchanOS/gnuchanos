sudo apt-get install -y fish  qutebrowser lxappearance btop nemo nitrogen arandr
sudo apt-get install -y conky picom zathura zathura-pdf-poppler openssh-server irqbalance 
sudo apt-get install -y zip unzip 7zip vlc qbittorrent
sudo apt-get install -y blender audacity godot3 gimp
sudo apt-get install -y openssh-server
sudo apt-get install -y dunst cmake make
sudo apt-get install -y plymouth plymouth-themes
sudo apt-get install -y xorg libx11-dev


sudo apt-get remove -y firefox-esr




sudo systemctl enable --now irqbalance

sudo systemctl enable ssh
sudo systemctl start ssh


mkdir -p ~/tmp
cd ~/tmp
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-python3interp
make
sudo make install