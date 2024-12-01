#!/bin/bash

read -rsn1 -p "######### AUDIO DRIVER ###########################################" variable; echo

sudo pacman -S  --noconfirm pipewire pipewire-alsa pipewire-media-session pipewire-pulse
systemctl --user --now enable pipewire pipewire-pulse pipewire-media-session
yay -Sy pavucontrol-gtk

systemctl --user restart pipewire pipewire-pulse pipewire-media-session.service

echo "fck pulseaudio  | pipewire Completed!   " variable; echo
read -rsn1 -p "#################### FINISH : PRESS ENTER ########################" variable; echo