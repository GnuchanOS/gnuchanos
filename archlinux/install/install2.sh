#!/bin/bash
echo "if you see this ## press enter"

pacman -S --noconfirm git 

##################################################################################################
echo "##### CREATE USER AND GIVE SUDO POWER #########################" variable; echo
read -ranl -p "don't use capital letter press enter PRESS ENTER"

while true; do
    read -p "1 -) create user | 2 -) user password | 3 -) make user sudo | 4 -) finish  :-> " input
    if   [ "$input" == "1" ]; then
        read -p "User Name: " userName
        useradd -m -G wheel -s /bin/bash $userName
    elif [ "$input" == "2" ]; then
        echo "if this is not start use this passwd $username <-- your user name"
        passwd $userName
    elif [ "$input" == "3" ]; then
        while true; do
            echo   "##"
            echo   "## User privilege specification"
            echo   "##"
            echo   "root ALL=(ALL) ALL # this is root "
            echo   "$username ALL=(ALL) ALL <--- add this line"
            echo   "##"
            echo   "##"
            read -rsn1 -p "do not forget it Press Enter" variable; echo
            read -p "1-) make user sudo | 2-) finish  :-> " input
            if   [ "$input" == "1" ]; then
                nano /etc/sudoers
            elif [ "$input" == "2" ]; then
                break
            fi
        done
    elif [ "$input" == "4" ]; then
        break
    else
        echo "what? -_-"
    fi
done
read -rsn1 -p "SUDO User creation Done!     FINISH : PRESS ENTER" variable; echo

read -rsn1 -p "###### Root Password ##############################################" variable; echo
read -rsn1 -p "You type root password Press Enter" variable; echo
while true; do
    read -p "1 -) root password | 2 -) finish  :-> " input
    if   [ "$input" == "1" ]; then
        echo "passwd root"
        passwd root
    elif [ "$input" == "2" ]; then
        break
    else
        echo "what? -_-"
    fi
done
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo

read -rsn1 -p "###### COMPUTER NAME ##############################################" variable; echo
while true; do
    read -p "1 -) computer name | 2 -) finish :-> " input
    if   [ "$input" == "1" ]; then
        read -p 'Enter Computer Name : ' computer_name
        echo "$computer_name" >> /etc/hostname
        cat /etc/hosts
    elif [ "$input" == "2" ]; then
        break
    else
        echo "what? -_-"
    fi
done
read -rsn1 -p "$computer_name nice name bro  Press Enter" variable; echo
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "###### SYSTEM LANGUAGE ###########################################" variable; echo
#---------------------------------------------------------------#
read -rsn1 -p "if you speak another language dont forget edit this --> part2.sh : English Language = en_US.UTF-8 Press Enter" variable; echo
while true; do
    read -p "1 -) Turkish | 2 -) English | 3 -) finish :-> " input
    echo "system language"
    if   [ "$input" == "1" ]; then
        echo "LC_ALL=tr_TR.UTF-8" >> /etc/environment
        echo "LC_ALL=tr_TR.UTF-8 >> /etc/environment"
        echo "tr_TR.UTF-8 UTF-8" >> /etc/locale.gen
        echo "tr_TR.UTF-8 UTF-8 >> /etc/locale.gen"
        echo "LANG=tr_TR.UTF-8" > /etc/locale.conf
        echo "LANG=tr_TR.UTF-8 > /etc/locale.conf"
    elif [ "$input" == "2" ]; then
        echo "LC_ALL=en_US.UTF-8" >> /etc/environment
        echo "LC_ALL=en_US.UTF-8 >> /etc/environment"
        echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
        echo "en_US.UTF-8 UTF-8 >> /etc/locale.gen"
        echo "LANG=en_US.UTF-8" > /etc/locale.conf
        echo "LANG=en_US.UTF-8 > /etc/locale.conf"
    elif [ "$input" == "3" ]; then
        break
    else
        echo "what? -_-"
    fi
done

while true; do
    read -p "1 -) Turkish | 2 -) English | 4 -) finish :-> " input
    echo "keyboard language"
    if   [ "$input" == "1" ]; then
        echo KEYMAP=trq >> /etc/vconsole.conf
        echo "KEYMAP=trq >> /etc/vconsole.conf"
    elif [ "$input" == "2" ]; then
        echo KEYMAP=us >> /etc/vconsole.conf
        echo "KEYMAP=us >> /etc/vconsole.conf"
    elif [ "$input" == "3" ]; then
        locale-gen
        # linux-zen
        mkinitcpio -p linux
        read -rsn1 -p "mkinitcpio Completed! Press Enter" variable; echo
        grub-install --recheck /dev/sda
        grub-mkconfig -o /boot/grub/grub.cfg
        break
    else
        echo "what? -_-"
    fi
done
read -rsn1 -p "grub-install and grub-mkconfig finish PRESS ENTER" variable; echo
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "###### NETWORK MANAGER #############################################" variable; echo

pacman -S --noconfirm networkmanager
systemctl enable NetworkManager.service

read -rsn1 -p "Enabled Network Manager PRESS ENTER" variable; echo
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "########## GRAPHIC DRIVE #########################################" variable; echo
echo "GPU Driver"

while true; do
    echo "1 -) AMD"
    echo "2 -) NVIDIA"
    echo "3 -) ATI"
    echo "4 -) INTEL"
    echo "5 -) Finish"
    read -p " | 1 | 2 | 3 | 4 | 5 | :-> " input
    if   [ "$input" == "1" ]; then
        echo "xorg xorg-server xorg-xinit xorg-apps mesa"
        sleep 1
        sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa
    elif [ "$input" == "2" ]; then
        echo "sudo pacman -S xorg xorg-server xorg-xinit xorg-apps nvidia nvidia-utils"
        sleep 1
        sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps nvidia nvidia-utils
    elif [ "$input" == "3" ]; then
        echo "sudo pacman -S xorg xorg-server xorg-xinit xorg-apps xf86-video-ati"
        sleep 1
        sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps xf86-video-ati
    elif [ "$input" == "4" ]; then
        echo "pacman -S xorg xorg-server xorg-xinit xorg-apps xf86-video-intel"
        sleep 1
        pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-intel
    elif [ "$input" == "5" ]; then
        break
    else
        echo "what? -_-"
    fi
done
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "####### Display Manager ##########################################" variable; echo

sudo pacman -Sy --noconfirm lxdm
sudo systemctl enable lxdm.service

read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "######## Gui selection ###########################################" variable; echo
while true; do
    echo "1 -) XFCE"
    echo "2 -) OPENBOX"
    echo "3 -) I3"
    echo "4 -) QTILE"
    echo "5 -) Finish"
    read -p " | 1 | 2 | 3 | 4 | 5 | :-> " input
    if   [ "$input" == "1" ]; then
        echo "sudo pacman -S xfce4 xfce4-goodies"
        sleep 1
        sudo pacman -S --noconfirm xfce4 xfce4-goodies
    elif [ "$input" == "2" ]; then
        echo "sudo pacman -S openbox obconf menumaker"
        sleep 1
        sudo pacman -S --noconfirm openbox obconf menumaker 
    elif [ "$input" == "3" ]; then
        echo "sudo pacman -S i3 i3-gaps i3status i3lock"
        sleep 1
        sudo pacman -S --noconfirm i3 i3-gaps i3status i3lock
    elif [ "$input" == "4" ]; then
        echo "sudo pacman -S --noconfirm qtile"
        sleep 1
        sudo pacman -S --noconfirm qtile
    elif [ "$input" == "5" ]; then
        break
    else
        echo "what? -_-"
    fi
done
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "####### TERMİNAL ##############################################" variable; echo
pacman -S --noconfirm xterm fish guake

read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
echo "first enter this command 1: exit 2: umount /mnt/boot and umount /mnt "
echo "Arch Linux installation Completed but you need next software bro next part3.sh "
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################
