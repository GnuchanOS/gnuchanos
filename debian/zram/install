#!/bin/bash
sudo apt-get install systemd-zram-generator


# dont forget edit this
# sudo leafpad /etc/systemd/zram-generator.conf
sudo cp files/zram-generator.conf /etc/systemd/


# [zram0]
# zram-size = ram
# compression-algorithm=lz4

sudo systemctl daemon-reload
sudo systemctl start /dev/zram0

sudo zramctl
