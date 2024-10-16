#!/bin/bash
sudo pacman -Sy --noconfirm zram-generator

# dont forget edit this
# sudo leafpad /etc/systemd/zram-generator.conf
sudo cp files/zram-generator.conf /etc/systemd/


systemctl daemon-reload
systemctl start /dev/zram0

zramctl
