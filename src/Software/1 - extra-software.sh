#!/bin/bash

faillock --reset
#bchunk cd1.bin cd1.cue cd1.iso

sudo sed -i 's/^#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

################################################################################
echo  "#[multilib]"
echo  "#Include = /etc/pacman.d/mirrorlist"
read -rsn1 -p "dont forget open nano edit and delete this //Press Enter  "

sudo nano /etc/pacman.conf
echo  "install starting..."
sudo pacman -Syyu --noconfirm
################################################################################
sudo pacman -S --noconfirm archlinux-keyring

# XInput
sudo pacman -Syu xorg-xinput

# xinput list
# xinput list-props <device_id>
# Disable
#xinput set-prop 11 "libinput Accel Speed" 0
# Enable
#xinput set-prop 11 "libinput Accel Profile Enabled" 0, 1


################################################################################
sudo pacman -S --noconfirm zip unzip p7zip  expac jshon gvfs-mtp mtpfs exfat-utils a52dec faac fuse-exfat faad2 jasper lame libdca libdv 
sudo pacman -S --noconfirm gst-libav libmad libtheora libmpeg2 wavpack x264 xvidcore libdvdcss  libdvdread  libdvdnav dvd+rw-tools dvdauthor dvgrab 
sudo pacman -S --noconfirm lib32-alsa-lib  lib32-alsa-plugins  lib32-libpulse  lib32-alsa-oss net-tools
sudo pacman -S --noconfirm xsel

sudo pacman -S --noconfirm pcre pcre2 lib32-pcre lib32-pcre2 util-linux util-linux-libs lib32-util-linux xz lib32-xz
sudo pacman -S --noconfirm gparted vlc conky leafpad arandr btop jdk-openjdk bchunk
sudo pacman -S --noconfirm qbittorrent dmenu rofi fastfetch make cmake openssh timidity
#sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts #japonca font

echo "sudo pacman -Sy lib32-libva-intel-driver libva-intel-driver libva-mesa-driver libva-nvidia-driver"
echo "this is for record video in gpu-screen-recorder-gtk"
################################################################################

################################################################################
sudo pacman -S --noconfirm ranger  cmus  dunst  nitrogen
sudo pacman -S --noconfirm zathura zathura-pdf-poppler ristretto
sudo pacman -S --noconfirm lxappearance lxappearance-obconf scrot
################################################################################

################################################################################
sudo pacman -S --noconfirm irqbalance
sudo systemctl enable --now irqbalance

sudo pacman -S --noconfirm tlp
sudo systemctl enable tlp --now

sudo pacman -S --noconfirm cpupower
sudo systemctl enable cpupower --now
sudo cpupower frequency-set -g ondemand
################################################################################

################################################################################
sudo systemctl enable sshd
sudo systemctl start sshd

sudo pacman -S fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
################################################################################

################################################################################
while true; do
    echo "amd > intel |: "; read input
    if [ $input == "amd" ]; then
        sudo pacman -Sy --noconfirm amd-ucode
        break
    elif [ $input == "intel" ]; then
        sudo pacman -Sy --noconfirm intel-ucode
        break
    else
        echo "What ?"
    fi
done
################################################################################

################################################################################
while true; do
    echo "qutebrowser >: "; read input
    if [ $input == "qutebrowser" ]; then
        sudo pacman -Sy --nocomfirm qutebrowser python-adblock
        break
    else
        break
    fi
done
################################################################################
