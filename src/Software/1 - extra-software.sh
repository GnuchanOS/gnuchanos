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
#                            terminal - file manager  -  music player  - Notification  - wallpaper
sudo pacman -S --noconfirm  cool-retro-term        ranger            cmus           dunst         nitrogen

#                        pdf UWU             -  image wiewer
sudo pacman -S --noconfirm zathura-pdf-poppler  zathura      ristretto

#                       Themes Changer  -                    Screen Shoot
sudo pacman -S --noconfirm picom     lxappearance lxappearance-obconf       scrot
################################################################################################

sudo pacman -S --noconfirm irqbalance
sudo systemctl enable --now irqbalance

sudo systemctl enable sshd
sudo systemctl start sshd


# this is not working
#sudo pacman -S --noconfirm cpupower
#sudo systemctl enable --now cpupower
#sudo cpupower frequency-set --governor performance


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

# make nemo default
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search


