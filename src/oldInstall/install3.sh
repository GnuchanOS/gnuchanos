#!/bin/bash
echo "if you see this ## press enter"

echo "sudo localectl --no-convert set-x11-keymap tr"
echo "sudo localectl --no-convert set-x11-keymap us"


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

sudo pacman -S  --noconfirm pipewire pipewire-alsa pipewire-media-session pipewire-pulse
systemctl --user --now enable pipewire pipewire-pulse pipewire-media-session
yay -Sy pavucontrol-gtk

systemctl --user restart pipewire pipewire-pulse pipewire-media-session.service

echo "fck pulseaudio  | pipewire Completed!   " variable; echo
read -rsn1 -p "#################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################




