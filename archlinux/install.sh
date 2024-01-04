echo " SWAP - BOOTABLE - HARDDISK "
read -p "PRESS ENTER" fart

# create swap - bootable - disk
parted /dev/sda mklabel msdos
cfdisk /dev/sda

mkswap /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
swapon /dev/sda1
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot

# base install
pacstrap -i /mnt base base-devel linux linux-headers nano linux-firmware
pacstrap /mnt grub
genfstab -p /mnt >> /mnt/etc/fstab

echo "arch-chroot /mnt"
arch-chroot /mnt
echo "hellooooooooooooo"