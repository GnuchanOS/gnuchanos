import os

while True:
    print("Choose Harddisk")
    print("1 <-- SDA")
    print("2 <-- VDA")
    print("3 <-- Finish")
    print(" | 1 Linux Swap | 2 Bootable | 3 All Harddisk - Write |")
    bashInput = input(" | 1 | 2 | 3 | :-> ")
    if bashInput == "1":
        os.popen("parted /dev/sda mklabel msdos")
        os.popen("cfdisk /dev/sda")
        os.popen("mkswap /dev/sda1")
        os.popen("mkfs.ext4 /dev/sda2")
        os.popen("mkfs.ext4 /dev/sda3")
        os.popen("swapon /dev/sda1")        
        os.popen("mount /dev/sda3 /mnt")
        os.popen("mkdir /mnt/boot")
        os.popen("mount /dev/sda2 /mnt/boot")
        break
    elif bashInput == "2":
        os.popen("parted /dev/vda mklabel msdos")
        os.popen("cfdisk /dev/vda")
        os.popen("mkswap /dev/vda1")
        os.popen("mkfs.ext4 /dev/vda2")
        os.popen("mkfs.ext4 /dev/vda3")
        os.popen("swapon /dev/vda1")        
        os.popen("mount /dev/vda3 /mnt")
        os.popen("mkdir /mnt/boot")
        os.popen("mount /dev/vda2 /mnt/boot")
        break
    elif bashInput == "3":
        break

os.popen("pacstrap -i /mnt base base-devel linux linux-headers nano linux-firmware")
os.popen("pacstrap /mnt grub")
os.popen("genfstab -p /mnt >> /mnt/etc/fstab")

os.popen("mkdir /mnt/backup")
os.popen("cp  install2.sh    /mnt/backup")
os.popen("cp  install3.sh    /mnt/backup")
os.popen("arch-chroot /mnt")