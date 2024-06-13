#!/bin/bash

faillock --reset
#bchunk cd1.bin cd1.cue cd1.iso

sudo sed -i 's/^#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

################################################################################################
echo  "#[multilib]"
echo  "#Include = /etc/pacman.d/mirrorlist"
read -rsn1 -p "dont forget open nano edit and delete this //Press Enter  "

sudo nano /etc/pacman.conf
echo  "install starting..."
sudo pacman -Syyu --noconfirm
################################################################################################
sudo pacman -S --noconfirm archlinux-keyring

################################################################################################
sudo pacman -S --noconfirm zip unzip p7zip  expac jshon gvfs-mtp mtpfs exfat-utils a52dec faac fuse-exfat faad2 jasper lame libdca libdv gst-libav libmad libtheora libmpeg2 wavpack x264 xvidcore libdvdcss  libdvdread  libdvdnav dvd+rw-tools dvdauthor dvgrab lib32-alsa-lib  lib32-alsa-plugins  lib32-libpulse  lib32-alsa-oss  net-tools  
sudo pacman -Syu pcre pcre2 lib32-pcre lib32-pcre2 util-linux util-linux-libs lib32-util-linux xz lib32-xz
sudo pacman -S --noconfirm gparted vlc conky leafpad arandr btop jdk-openjdk bchunk
sudo pacman -S --noconfirm qbittorrent dmenu rofi nemo fastfetch make cmake openssh
#sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts #japonca font
################################################################################################

################################################################################################
sudo pacman -S --noconfirm cool-retro-term ranger  cmus  dunst  nitrogen
sudo pacman -S --noconfirm zathura zathura-pdf-poppler ristretto
sudo pacman -S --noconfirm picom lxappearance lxappearance-obconf scrot
################################################################################################

################################################################################################
sudo pacman -S --noconfirm irqbalance
sudo systemctl enable --now irqbalance
################################################################################################

################################################################################################
sudo systemctl enable sshd
sudo systemctl start sshd
################################################################################################

################################################################################################
sudo pacman -S --noconfirm cpupower
sudo systemctl enable --now cpupower
sudo systemctl start cpupower.service
sudo cpupower frequency-set --governor performance
for i in $(seq 0 $(($(nproc) -1))) ; do echo performance > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor ; done
################################################################################################

################################################################################################
while true; do
    echo "amd > intel >: "; read input
    if [ $input == "amd" ]; then
        sudo pacman -Sy --nocomfirm amd-ucode
        break
    elif [ $input == "intel" ]; then
        sudo pacman -Sy --nocomfirm intel-ucode
        break
    else
        echo "What ?"
    fi
done
################################################################################################

################################################################################################
while true; do
    echo "qutebrowser >: "; read input
    if [ $input == "qutebrowser" ]; then
        sudo pacman -Sy --nocomfirm qutebrowser python-adblock
        break
    else
        break
    fi
done
################################################################################################

# make nemo default
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search


