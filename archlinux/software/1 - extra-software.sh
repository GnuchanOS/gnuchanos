#!/bin/bash


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
sudo pacman -S --noconfirm gparted vlc conky leafpad arandr btop jdk-openjdk bchunk
sudo pacman -S --noconfirm qbittorrent dmenu rofi


#sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts #japonca font
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


PS3='Please enter your choice: '
options=("amd" "intel" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "AMD")
        echo "you chose AMD"
            sudo pacman -S --noconfirm amd-ucode
            break
            ;;

        "intel")
        echo "you chose intel"
            sudo pacman -S --noconfirm intel-ucode
            break
            ;;

        "Quit")
            break
            ;;
    esac
done





read -rsn1 -p "install your browser QuteBrowser is default //Press Enter" variable; echo

PS3='Please enter your choice: '
options=("QuteBrowser" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "QuteBrowser")
        echo "you choose QuteBrowser"
        sudo pacman -S --noconfirm qutebrowser
	    sudo pacman -S --noconfirm python-adblock
            break
            ;;

        "Quit")
            break
            ;;
    esac
done


sudo pacman -Syyu lib32-gnutls
