#!/bin/bash

sudo cp -r minimal/ /boot/grub/themes
sudo cp grub /etc/default/
sudo cp -r mint-logo/ /usr/share/plymouth/themes/

sudo update-grub
sudo update-initramfs -u
