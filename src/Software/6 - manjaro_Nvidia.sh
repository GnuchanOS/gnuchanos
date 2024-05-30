#!/bin/bash

sudo systemctl enable bumblebeed
sudo usermod -a -G bumblebee $USER
sudo systemctl restart bumblebeed
