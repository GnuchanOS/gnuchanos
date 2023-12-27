#!/bin/bash

echo "don't forget this i use yay but you can install diffrent things"
while true; do
    echo "enter number"
    echo "1 -) install yay"
    echo "2 -) install pip and more"
    echo "3 -) install programs"
    echo "4 -) install programs for games"


    # yay
    read -p "whad do you now? :->" input
    if   [ "$input" "1" ]; then
        mkdir tmp
        cd tmp
        git clone https://aur.archlinux.org/yay-bin.git
        cd yay-bin
        makepkg -si
        echo "don't forget remove tmp file"
        
        echo "You want rar ?"
        read -p "yes or no? :-> " input
        if [ "$input" "yes"]; then
            yay -Sy rar
        elif [ "$input" "no" ]; then
            echo " :( ok "


    # pip
    elif [ "$input" == "2" ]; then
        echo "warning default aur is yay"
        while true; do
            echo "1 -) with yay"
            echo "2 -) finish"

            read -p " | 1 | 2 | :-> " input
            if [ "$input" == "1" ]; then
                yay -S python-pip
                mkdir ~/.config/pip
                touch ~/.config/pip/pip.conf
                cp pip.conf ~/.config/pip/

                echo "psutil python-magic pyinstaller  cairocffi cffi xcffib iwlib"
                read -p "you wanna install this? yes or no"
                if   [ "$input" == "yes"]; then
                    python -m pip install psutil python-magic pyinstaller  cairocffi cffi xcffib iwlib
                elif [ "$input" == "no"]; then
                    echo " oh noooooooooooo"
                fi

                read -p "you wanna install this? pysimplegui"
                if   [ "$input" == "yes"]; then
                    pip install pysimplegui && python -m PySimpleGUI.PySimpleGUI upgrade
                elif [ "$input" == "no"]; then
                    echo " oh noooooooooooo"
                fi

            elif [ "$input" == "2" ]; then
                break
            fi
        done


    # programs
    elif [ "$input" == "3" ]; then
        while true; do
            echo "0 -) #[multilib] you want remo this? -> #"
            echo "1 -) base library if you want"
            echo "2 -) programs"
            echo "3 -) ucode for cpu"

            read -p " | 0 | 1 | 2 | 3 | :-> " input
            if [ "$input" == "0" ]; then
                echo "Before"
                echo "#[multilib]"
                echo "#Include = /etc/pacman.d/mirrorlist" 
                echo "-----------------------------------"
                echo "After"
                echo "[multilib]"
                echo "Include = /etc/pacman.d/mirrorlist" 
                
                while true; do
                    read -p "you wanna do this? yes or no" input
                    if   [ "$input" == "yes"]; then
                        sudo nano /etc/pacman.conf
                        echo  "install starting..."
                        sudo pacman -Syyu --

                    elif [ "$input" == "no"]; then
                        echo "if don't do this you gonna be sorry bro"
                        break
                    fi
                done


            elif [ "$input" == "1" ]; then
                sudo pacman -S --noconfirm zip unzip p7zip  expac jshon gvfs-mtp mtpfs exfat-utils a52dec faac fuse-exfat faad2 jasper lame libdca libdv gst-libav libmad libtheora libmpeg2 wavpack x264 xvidcore libdvdcss  libdvdread  libdvdnav dvd+rw-tools dvdauthor dvgrab lib32-alsa-oss  net-tools tk
                sudo pacman -S --needed --noconfirm giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error
                sudo pacman -S --needed --noconfirm lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama
                sudo pacman -S --needed --noconfirm ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader kdialog
                sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader

            elif [ "$input" == "2" ]; then
                while true; do
                    echo "1 -) arandr gparted conky picom lxappearance lxappearance-obconf ranger cmus dunst nitrogen zathura-pdf-poppler zathura ristretto scrot qbittorrent"
                    echo "2 -) browsers"
                    echo "3 -) ucode for cpu"
                    echo "4 -) irqbalance for cpu"
                    echo "5 -) zram-generator"

                    read -p " | 1 | 2 | :-> " input
                    if   [ "$input" == "1" ]; then
                        sudo pacman -S --noconfirm archlinux-keyring
                        sudo pacman -S --noconfirm arandr gparted conky picom lxappearance lxappearance-obconf ranger cmus dunst nitrogen zathura-pdf-poppler zathura ristretto scrot qbittorrent

                    elif [ "$input" == "2" ]; then
                        while true; do
                            echo "1 -) qutebrowser"

                            read -p " | 1 | :-> " input
                            if [ "$input" == "1" ]; then
                                sudo pacman -S --noconfirm qutebrowser python-adblock lib32-gnutls
                            fi
                        done

                    elif [ "$input" == "3" ]; then
                        while true; do

                            read -p "intel or amd? :->" input
                            if [ "$input" == "intel" ]; then
                                sudo pacman -S --noconfirm amd-ucode
                                break

                            elif [ "$input" == "amd" ]; then
                                sudo pacman -S --noconfirm intel-ucode
                                break
                            fi
                        done

                    elif [ "$input" == "4"]; then
                        sudo pacman -S --noconfirm irqbalance
                        sudo systemctl enable --now irqbalance

                    elif [ "$input" == "5" ]; then
                        sudo pacman -Sy --noconfirm zram-generator
                            sudo cp files/zram-generator.conf /etc/systemd/
                            systemctl daemon-reload
                            systemctl start /dev/zram0
                            zramctl
                    fi
                done
 
    
    # games
    elif [ "$input" == "4" ]; then
        echo "this all programs install with aur yay"
        while true; do
            echo "1 -) wine and gamemode and winetrick"
            echo "2 -) steam and protontrick and protonup this is gui"
            echo "3 -) lutris"
            echo "4 -) heroic games lancher"
            echo "5 -) finish"
            
            read -p " | 1 | 2 | 3 | 4 | :-> " input
            if   [ "$input" == "1" ]; then
                yay -Sy winetricks-git gamemode lib32-gamemode

            elif [ "$input" == "2" ]; then
                yay -Sy protontricks-git protonup-qt steam

            elif [ "$input" == "3" ]; then
                yay -Sy lutris-git

            elif [ "$input" == "4" ]; then
                yay -Sy heroic-games-launcher-bin

            elif [ "$input" == "5" ]; then
                break
            fi
        done
    fi
done