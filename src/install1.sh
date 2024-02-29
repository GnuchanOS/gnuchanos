#!/bin/bash

echo "if you see this ## press enter"


###################################################################################################
timedatectl set-ntp true
hwclock -w
echo "timedatectl set-ntp true"
sleep 1
##################################################################################################

##################################################################################################
read -rsn1 -p "##### CREATING HARD DISK  #############################################" variable; echo
read -rsn1 -p "don't forget 1:type-swap 2:boot 3:harddisk not dual boot(system) PRESS ENTER " variable; echo

parted /dev/sda mklabel msdos
cfdisk /dev/sda

mkswap /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

swapon /dev/sda1

mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot

echo "harddisk Finish "
read -rsn1 -p "##################### FINISH : PRESS ENTER ########################" variable; echo
##################################################################################################

##################################################################################################
read -rsn1 -p "##### EXTRA SETTINGS  #############################################" variable; echo

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
