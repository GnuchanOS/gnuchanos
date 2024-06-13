#!/bin/bash






sudo pacman -S tlp tlp-rdw acpi_call
sudo systemctl enable tlp.service
sudo systemctl start tlp.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl mask systemd-rfkill.service
sudo tlp start
