#!/bin/bash

sudo cp -r minimal/ /boot/grub/themes
sudo cp grub /etc/default/

sudo apt-get -y install plymouth plymouth-themes

sudo cp -r spinner/ /usr/share/plymouth/themes
sudo cp debian-logo.png /usr/share/plymouth
sudo /usr/sbin/plymouth-set-default-theme -R spinner

sudo update-grub
sudo update-initramfs -u
