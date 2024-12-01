#!/bin/bash

sudo cp sdm /usr/bin/
sudo cp sdm.service /etc/systemd/system/
sudo systemctl enable sdm.service