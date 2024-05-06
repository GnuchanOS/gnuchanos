#!/bin/bash

sudo systemctl enable bumblebeed.service
sudo gpasswd -a $USER bumblebee
sudo systemctl start bumblebeed.service
reboot
