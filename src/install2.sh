#!/bin/bash
echo "if you see this ## press enter"

pacman -S --noconfirm git 

##################################################################################################
read -rsn1 -p "##### CREATE USER AND GIVE SUDO POWER #########################" variable; echo
read -ranl -p "don't use capital letter press enter PRESS ENTER"
read -p "User Name: " userName
useradd -m -G wheel -s /bin/bash $userName
echo "if this is not start use this passwd username <-- your user name"
passwd $userName


echo   "##"
echo   "## User privilege specification"
echo   "##"
echo   "root ALL=(ALL) ALL # this is root "
echo   "yourUserName ALL=(ALL) ALL <--- add this line"
echo   "##"
echo   "##"
sleep 2
read -rsn1 -p "do not forget it Press Enter" variable; echo
nano /etc/sudoers
read -rsn1 -p "SUDO User creation Done!     FINISH : PRESS ENTER" variable; echo


read -rsn1 -p "###### Root Password ##############################################" variable; echo
read -rsn1 -p "You type root password, when login you will enter root and password, of course you know that Press Enter" variable; echo
echo "passwd root"
passwd root
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo



read -rsn1 -p "###### COMPUTER NAME ##############################################" variable; echo
echo "this is your computer name press enter"

read -p 'Enter Computer Name : ' computer_name
echo "$computer_name" >> /etc/hostname

read -rsn1 -p "$computer_name nice name bro  Press Enter" variable; echo
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################



##################################################################################################
read -rsn1 -p "###### SYSTEM LANGUAGE ###########################################" variable; echo
#---------------------------------------------------------------#
read -rsn1 -p "if you speak another language dont forget edit this --> part2.sh : English Language = en_US.UTF-8 Press Enter" variable; echo

PS3='Please enter your System Language : '
options=("Turkish" "English")
select opt in "${options[@]}"
do
    case $opt in
        ("Turkish")
        echo "Your Chosen Turkish"
            echo "LC_ALL=tr_TR.UTF-8" >> /etc/environment
            echo "LC_ALL=tr_TR.UTF-8 >> /etc/environment"
            echo "tr_TR.UTF-8 UTF-8" >> /etc/locale.gen
            echo "tr_TR.UTF-8 UTF-8 >> /etc/locale.gen"
            echo "LANG=tr_TR.UTF-8" > /etc/locale.conf
            echo "LANG=tr_TR.UTF-8 > /etc/locale.conf"
            sleep 3
            break
            ;;

        ("English")
        echo "Your Chosen English/American"
            echo "LC_ALL=en_US.UTF-8" >> /etc/environment
            echo "LC_ALL=en_US.UTF-8 >> /etc/environment"
            echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
            echo "en_US.UTF-8 UTF-8 >> /etc/locale.gen"
            echo "LANG=en_US.UTF-8" > /etc/locale.conf
            echo "LANG=en_US.UTF-8 > /etc/locale.conf"
            sleep 3
            break
            ;;
    esac
done

#---------------------------------------------------------------#
PS3='Please enter your Keyboard Language : '


options=("Turkish" "English")
select opt in "${options[@]}"
do
    case $opt in
        "Turkish")
        echo "Your Chosen Turkish"
           echo KEYMAP=trq >> /etc/vconsole.conf
           echo "KEYMAP=trq >> /etc/vconsole.conf"
           sleep 3
            break
            ;;

        "English")
        echo "Your Chosen English/American"
          echo KEYMAP=us >> /etc/vconsole.conf
          echo "KEYMAP=us >> /etc/vconsole.conf"
          sleep 3
            break
            ;;
    esac
done

echo "locale-gen"
locale-gen

mkinitcpio -p linux-zen
read -rsn1 -p "mkinitcpio Completed! Press Enter" variable; echo
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

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

PS3='Please enter your selection : '


options=("AMD" "nvidia" "ATI" "intel" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        ("AMD")
        echo "Your Chosen AMD"
            echo "xorg xorg-server xorg-xinit xorg-apps mesa"
            sleep 3
            sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa
            break
            ;;

        ("nvidia")
        echo "Your Chosen nvidia"
            echo "sudo pacman -S xorg xorg-server xorg-xinit xorg-apps nvidia nvidia-utils"
            sleep 3
            sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps nvidia nvidia-utils
            break
            ;;

        ("ATI")
        echo "Your Chosen ATI"
            echo "sudo pacman -S xorg xorg-server xorg-xinit xorg-apps xf86-video-ati"
            sleep 3
            sudo pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps xf86-video-ati
            break
            ;;

        ("intel")
        echo "Your Chosen  intel"
            echo "pacman -S xorg xorg-server xorg-xinit xorg-apps xf86-video-intel"
            sleep 3
            pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-intel
            break
            ;;

        ("Quit")
            break
            ;;
    esac
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
echo "Next!"
PS3='Please enter your selection : '


options=("Xfce" "Openbox" "i3" "Qtile" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        ("Xfce")
        echo "Your Chosen Environment Xfce"
            echo "sudo pacman -S xfce4 xfce4-goodies"
            sleep 3
            sudo pacman -S --noconfirm xfce4 xfce4-goodies
            break
            ;;

        ("Openbox")
        echo "Your Chosen Environment OpenBox"
            echo "sudo pacman -S openbox obconf menumaker"
            sleep 3
            sudo pacman -S --noconfirm openbox obconf menumaker 
            break
            ;;

        ("i3")
        echo "Your Chosen Environment Xfce"
            echo "sudo pacman -S i3 i3-gaps i3status i3lock"
            sleep 3
            sudo pacman -S --noconfirm i3 i3-gaps i3status i3lock
            break
            ;;

        ("Qtile")
        echo "Your Chosen Environment  Qtile"
            echo "sudo pacman -S --noconfirm qtile"
            sleep 3
            sudo pacman -S --noconfirm qtile
            break
            ;;
            
        ("Quit")
            break
            ;;
    esac
done
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################




##################################################################################################
read -rsn1 -p "####### TERMİNAL ##############################################" variable; echo
pacman -S --noconfirm xterm fish

read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################



##################################################################################################
echo "first enter this command 1: exit 2: umount /mnt/boot and umount /mnt "
echo "Arch Linux installation Completed but you need next software bro next part3.sh "
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################
