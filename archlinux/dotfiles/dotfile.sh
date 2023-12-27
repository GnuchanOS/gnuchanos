#! /bin/bash








while true; do
    echo "1 -) lxdm"
    echo "2 -) plymotuth theme"
    echo "3 -) touchpad settings"
    echo "4 -) copy qtile dotfile"
    echo "5 -) finish"

    read -p ":-> " input
    if [ "$input" == "1" ]; then
        sudo cp -r GnuChanOS/ /usr/share/lxdm/themes/
        sudo cp lxdm.conf /etc/lxdm

    elif [ "$input" == "2" ]; then
        yay -S update-grub plymouth

        sudo cp -r minimal/ /boot/grub/themes
        sudo update-grub

        sudo cp -r gnuchanBoot  /usr/share/plymouth/themes/
        sudo cp mkinitcpio.conf /etc/
        sudo cp grub /etc/default/
        
        #linux-zen
        sudo mkinitcpio -P linux; sudo grub-mkconfig -o /boot/grub/grub.cfg
        sudo cp plymouthd.conf /etc/plymouth/
        sudo plymouth-set-default-theme -R gnuchanBoot

    elif [ "$input" == "3" ]; then
        sudo pacman -Sy --noconfirm xf86-input-libinput
        sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/

    elif [ "$input" == "4" ]; then
        cp -r qtile ~/.config

    elif [ "$input" == "5" ]; then
        break

done