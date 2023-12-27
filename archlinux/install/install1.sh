#!/bin/bash

###################################################################################################
timedatectl set-ntp true
hwclock -w
echo "timedatectl set-ntp true"
##################################################################################################

##################################################################################################
echo "##### CREATING HARD DISK  #############################################" variable; echo
read -rsn1 -p "don't forget 1:type-swap 2:boot 3:harddisk not dual boot(system) PRESS ENTER " variable; echo

while true; do
    read -p "1 -) Harddisk | 2 -) create Harddisk | 3 -) finish :-> " input
    if [ "$input" == "1" ]; then
        while true; do
            echo "choose harddisk name"
            echo "1 -) sda - note normaly harddisk is sda usn is sdb but i don't know ssd"
            echo "2 -) vda - virtual box | vm"
            echo "3 -) disk list"
            echo "4 -) input diffrent harddisk name"
            echo "5 -) finish"
            read -p " | 1 | 2 | 3 | 4 | :-> " input
            if   [ "$input" == "1" ]; then
                parted /dev/sda mklabel msdos
                cfdisk /dev/sda
            elif [ "$input" == "2" ]; then
                parted /dev/vda mklabel msdos
                cfdisk /dev/vda
            elif [ "$input" == "3"]; then
                fdisk -l
            elif [ "$input" == "4" ]; then
                while true; do
                    echo "example --> /dev/sda"
                    echo "1 -) input disk name"
                    echo "2 -) finish"
                    read -p " | 1 | 2 | :-> " input
                    if   [ "$input" == "1" ]; then
                        parted $input mklabel msdos
                        cfdisk $input
                    elif [ "$input" == "2"]; then
                        break
                    fi
                done
            elif [ "$input" == "5" ]; then
                break
            fi
        done
    elif [ "$input" == "2" ]; then
        mkswap /dev/sda1
        mkfs.ext4 /dev/sda2
        mkfs.ext4 /dev/sda3
        swapon /dev/sda1
        mount /dev/sda3 /mnt
        mkdir /mnt/boot
        mount /dev/sda2 /mnt/boot    
    elif [ "$input" == "3" ]; then
        echo "this part is finish!"
        break
    else
        echo "what? -_-"
    fi
done

echo "harddisk Finish "
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "##### EXTRA SETTINGS  #############################################" variable; echo
# linux-zen linux-zen-headers
pacstrap -i /mnt base base-devel linux linux-headers nano linux-firmware
pacstrap /mnt grub
genfstab -p /mnt >> /mnt/etc/fstab

read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "###### PART2 COPY FILE ############################################" variable; echo
echo "First part1.sh Finish enter terminale sh /backup/TestPart2.sh //Press Enter" variable; echo

mkdir /mnt/backup
cp  install2.sh    /mnt/backup
cp  install3.sh    /mnt/backup

echo "arch-chroot /mnt"
arch-chroot /mnt

read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################
