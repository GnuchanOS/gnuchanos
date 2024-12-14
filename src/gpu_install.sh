#!/bin/bash
echo "GPU Driver"

while true; do
    echo " | input words -> | amd | intel | nvidia | ati | exit |  :> "; read input
    if [ $input == "amd" ]; then
        sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-amdgpu 
		sudo pacman -S --nocomfirm xf86-input-libinput vulkan-radeon lib32-vulkan-radeon
        break
    elif [ $input == "intel" ]; then
        sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-intel xf86-input-libinput vulkan-intel
        break
    elif [ $input == "nvidia" ]; then
        sudo pacman -S --noconfirm xorg xorg-server xorg-xinit mesa nvidia nvidia-utils nvidia-settings 
		sudo pacman -S --nocomfirm nvidia-dkms libglvnd vulkan-icd-loader
		sudo pacman -S --noconfirm xf86-input-libinput xf86-input-evdev xf86-video-vesa
		echo "use this later -> nvidia-xconfig"
        break
    elif [ $input == "ati" ]; then
        sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-ati 
		sudo pacman -S --nocomfirm xf86-input-libinput vulkan-radeon lib32-vulkan-radeon
        break
    elif [ $input == "exit" ]; then
        break
    else
        echo "What??"
    fi
done