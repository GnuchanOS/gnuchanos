#!/bin/bash
echo "if you see this ## press enter"

sudo localectl --no-convert set-x11-keymap tr
##################################################################################################
echo "###### LOCAL TIME #################################################" variable; echo
read -rsn1 -p "Select Time Zone  Europe/Istanbul My zone //Press Enter" variable; echo

while true; do
    echo "timedatectl list-timezones"
    echo "1 -) Europe/Istanbul"
    echo "2 -) custom"
    echo "3 -) finish"
    read -p "| 1 | 2 | 3 | :-> " input
    if   [ "$input" == "1" ]; then
        timedatectl set-timezone Europe/Istanbul
    elif [ "$input" == "2" ]; then
        timedatectl list-timezones
        read -rsn1 -p "Dont Forget Time Zone :----> "
        read -p 'Enter Time Zone Name : ' timezone
    elif [ "$input" == "3" ]; then
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
        break
    fi
done
read -rsn1 -p "Timezone Completed! //Press Enter" variable; echo
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "######### AUDIO DRIVER ###########################################" variable; echo

sudo pacman -S --noconfirm  pipewire pipewire-alsa
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-media-session
systemctl --user --now enable pipewire pipewire-pulse pipewire-media-session

echo "fck pulseaudio  | pipewire Completed!   " variable; echo
read -rsn1 -p "#################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################
