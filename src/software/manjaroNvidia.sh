#!/bin/bash
linuxstring=linux$(uname -r | cut -d '.' -f-2 | tr -d .)

if [ "$1" = "--install" ] || [ "$1" = "-i" ]; then
	sudo pacman -R xf86-video-intel
	sudo pacman -S primus bumblebee $linuxstring-bbswitch primus_vk lib32-primus lib32-primus_vk
	sudo pacman -S mesa xf86-video-intel nvidia lib32-nvidia-utils bbswitch nvidia-utils

	sudo gpasswd -a $USER bumblebee
	sudo systemctl enable bumblebeed
	echo "Bumblebee will be enabled after a restart"
elif [ "$1" = "--uninstall" ] || [ "$1" = "-u" ]; then
	sudo systemctl disable bumblebeed
	sudo pacman -R primus bumblebee $linuxstring-bbswitch primus_vk lib32-primus lib32-primus_vk

	echo "Bumblebee has been disabled and uninstalled, please restart for changes to take full effect."
else
	echo "Please type -i or --install to install bumblebee, or -u or --uninstall to uninstall bumblebee."
fi