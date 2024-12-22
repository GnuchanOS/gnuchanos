#!/bin/bash

# Kullanıcı ev dizinine gidiyoruz
HOME_PATH="$HOME"
LOCAL_TMP_FILE="$HOME_PATH/tmp"

if [ ! -d "$LOCAL_TMP_FILE" ]; then
    mkdir "$LOCAL_TMP_FILE"
    cd "$LOCAL_TMP_FILE"
else
    cd "$LOCAL_TMP_FILE"
fi

if [ ! -d "$LOCAL_TMP_FILE/yay" ]; then
    sudo pacman -Syu --needed base-devel
    git clone https://aur.archlinux.org/yay.git
fi

if [ -d "$LOCAL_TMP_FILE/yay" ]; then
    cd "$LOCAL_TMP_FILE/yay"
    makepkg -si
    yay -S rar irssi gpu-screen-recorder --rebuild
else
    echo "Yay dizini bulunamadı. Yay kurulumu başarısız oldu."
    exit 1
fi

yay -Sy zenpower3-dkms-git
