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

read -rsn1 -p "do not forget it Press Enter" variable; echo
nano /etc/sudoers
read -rsn1 -p "SUDO User creation Done!     FINISH : PRESS ENTER" variable; echo

read -rsn1 -p "###### Root Password ##############################################" variable; echo
read -rsn1 -p "You type root password, when login you will enter root and password  Press Enter" variable; echo
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

echo "Your chosen language is English/American."
echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "KEYMAP=trq" >> /etc/vconsole.conf
echo "locale-gen"
locale-gen

mkinitcpio -p linux
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

while true; do
    echo " | input words -> | amd | intel | nvidia | ati | exit |  :> "; read input
    if [ $input == "amd" ]; then
        pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-amdgpu xf86-input-libinput vulkan-radeon lib32-vulkan-radeon
        break
    elif [ $input == "intel" ]; then
        pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-intel xf86-input-libinput vulkan-intel
        break
    elif [ $input == "nvidia" ]; then
        pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps nvidia nvidia-utils nvidia-settings nvidia-dkms libglvnd vulkan-icd-loader
        pacman -S --nocomfirm xf86-input-libinput xf86-input-evdev xf86-video-vesa
        mkinitcpio -P
        echo "use this later -> nvidia-xconfig"
        break
    elif [ $input == "ati" ]; then
        pacman -S --noconfirm xorg xorg-server xorg-xinit xorg-apps mesa xf86-video-ati xf86-input-libinput vulkan-radeon lib32-vulkan-radeon
        break
    elif [ $input == "exit" ]; then
        break
    else
        echo "What??"
    fi
done

read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "####### Display Manager ##########################################" variable; echo
while true; do
    echo " | Display Manager -> | ly | lxdm | :> "; read input
    if [ $input == "ly" ]; then
        sudo pacman -Sy ly 
        sudo systemctl enable ly.service
        break
    elif [ $input == "lxdm" ]; then
        sudo pacman -Sy --noconfirm lxdm
        sudo systemctl enable lxdm.service
        break
    else echo "What?"
    fi
done
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "######## Gui selection ###########################################" variable; echo
pacman -S --noconfirm qtile
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "####### Extra Programs ##############################################" variable; echo
pacman -S --noconfirm xterm fish vim qutebrowser
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

mkinitcpio -P

##################################################################################################
echo "first enter this command 1: exit 2: umount /mnt/boot and umount /mnt "
echo "Arch Linux installation Completed but you need next software bro next part3.sh "
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################
