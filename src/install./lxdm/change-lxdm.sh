sudo apt-get install -y lxdm



sudo cp -r GnuChanOS/ /usr/share/lxdm/themes/
sudo cp lxdm.conf /etc/lxdm/lxdm.conf 
sudo systemctl enable lxdm.service
sudo systemctl start lxdm.service
