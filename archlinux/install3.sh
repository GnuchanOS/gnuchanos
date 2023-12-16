#!/bin/bash
echo "if you see this ## press enter"

sudo localectl --no-convert set-x11-keymap tr

##################################################################################################
read -rsn1 -p "###### LOCAL TIME #################################################" variable; echo
read -rsn1 -p "Select Time Zone  Europe/Istanbul My zone //Press Enter" variable; echo

echo "timedatectl list-timezones"
timedatectl list-timezones
read -rsn1 -p "Dont Forget Time Zone :----> "
read -p 'Enter Time Zone Name : ' timezone
echo "timedatectl set-timezone $timezone"
timedatectl set-timezone $timezone
echo "timedatectl set-local-rtc 1"
timedatectl set-local-rtc 0
echo "timedatectl set-ntp true"
timedatectl set-ntp true 
echo "timedatectl status"
timedatectl status
echo "locale-gen"
sudo locale-gen

read -rsn1 -p "Timezone Completed! //Press Enter" variable; echo
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################



##################################################################################################
read -rsn1 -p "######### AUDIO DRIVER ###########################################" variable; echo

sudo pacman -S  --noconfirm pipewire pipewire-alsa pipewire-media-session pipewire-pulse

sudo systemctl --user --now disable pulseaudio.service pulseaudio.socket
sudo systemctl --user mask pulseaudio

sudo systemctl --user --now enable pipewire pipewire-pulse pipewire-media-session

echo "fck pulseaudio  | pipewire Completed!   " variable; echo
read -rsn1 -p "#################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################
