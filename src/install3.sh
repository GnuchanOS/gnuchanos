#!/bin/bash
echo "if you see this ## press enter"

sudo localectl --no-convert set-x11-keymap tr
##################################################################################################
read -rsn1 -p "###### LOCAL TIME #################################################" variable; echo
read -rsn1 -p "Select Time Zone  Europe/Istanbul My zone //Press Enter" variable; echo

sudo timedatectl set-timezone Europe/Istanbul
sudo timedatectl set-local-rtc 0
sudo timedatectl set-ntp true 
sudo timedatectl status
sudo locale-gen

read -rsn1 -p "Timezone Completed! //Press Enter" variable; echo
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "######### AUDIO DRIVER ###########################################" variable; echo

sudo pacman -S  --noconfirm pipewire pipewire-alsa pipewire-media-session pipewire-pulse pavucontrol
systemctl --user --now enable pipewire pipewire-pulse pipewire-media-session

echo "fck pulseaudio  | pipewire Completed!   " variable; echo
read -rsn1 -p "#################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
sudo pacman -S --noconfirm openssh
sudo systemctl start sshd
sudo systemctl enable sshd
##################################################################################################

##################################################################################################
sudo echo "blacklist nouveau" >> /etc/modprobe.d/blacklist-nouveau.conf
sudo echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nouveau.conf
mkinitcpio -p linux
##################################################################################################


