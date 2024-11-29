#!/bin/bash

# wine-staging paketini yüklüyoruz
sudo pacman -S --noconfirm wine-staging

# Gerekli bağımlılıkları yüklüyoruz
sudo pacman -Sy --needed --asdeps --noconfirm giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse
sudo pacman -Sy --needed --asdeps --noconfirm lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite
sudo pacman -Sy --needed --asdeps --noconfirm lib32-sqlite libxcomposite lib32-libxcomposite ocl-icd lib32-ocl-icd libva
sudo pacman -Sy --needed --asdeps --noconfirm lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs
sudo pacman -Sy --needed --asdeps --noconfirm vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2

# Kdialog paketini yüklüyoruz
sudo pacman -Sy --noconfirm kdialog

# Yay aracılığıyla ek paketler kuruluyor
yay -Sy --noconfirm gamemode lib32-gamemode mangohud lib32-mangohud winetricks

# Wine yapılandırma ekranını başlatıyoruz
winetricks corefonts dxvk vkd3d d3dx9 d3dx9_43 d3dcompiler_43 cnc_ddraw
winecfg
