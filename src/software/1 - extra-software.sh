#!/bin/bash


#bchunk cd1.bin cd1.cue cd1.iso

sudo sed -i 's/^#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf

mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "vim > PlugInstall enter"
read p

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
sudo pacman -S --noconfirm zip unzip p7zip  expac jshon gvfs-mtp mtpfs exfat-utils a52dec faac fuse-exfat faad2 jasper lame libdca libdv gst-libav libmad libtheora libmpeg2 wavpack x264 xvidcore libdvdcss  libdvdread  libdvdnav dvd+rw-tools dvdauthor dvgrab lib32-alsa-lib  lib32-alsa-plugins  lib32-libpulse  lib32-alsa-oss  net-tools flac
sudo pacman -S --noconfirm rsync ntfs-3g flac curl wget
sudo pacman -S --noconfirm gparted vlc conky leafpad arandr btop jdk-openjdk bchunk
sudo pacman -S --noconfirm qbittorrent dmenu rofi

# bluetooth
sudo pacman -Sy bluez blueman bluez-utils
sudo modprobe btusb
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts #japan font
################################################################################################


################################################################################################
#                   terminal        - file manager  -  music player  - Notification  - wallpaper
sudo pacman -S --noconfirm  cool-retro-term        ranger            cmus           dunst         nitrogen

#                        pdf UWU             -  image wiewer
sudo pacman -S --noconfirm zathura-pdf-poppler  zathura      ristretto

#                       Themes Changer  -                    Screen Shoot
sudo pacman -S --noconfirm picom     lxappearance lxappearance-obconf       scrot
################################################################################################

sudo pacman -S --noconfirm irqbalance #don't forger this
sudo systemctl enable --now irqbalance


echo "intel>amd - ucode"; read input
if [ $input == "intel" ]; then
    sudo pacman -Sy --noconfirm intel-ucode
elif [ $input == "amd" ]; then
    sudo pacman -Sy --noconfirm amd-ucode
fi

sudo pacman -S --noconfirm qutebrowser python-adblock


