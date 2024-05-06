sudo pacman -Sy tlp 
sudo systemctl enable tlp
sudo systemctl start tlp
sudo cp tlp.conf /etc/
sudo systemctl restart tlp
