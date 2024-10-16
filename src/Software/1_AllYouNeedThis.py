import os


class MainPrograms:
    def __init__(self):
        # Pacman Logo
        os.system("sudo sed -i 's/^#Color/Color/g' /etc/pacman.conf")
        os.system("sudo sed -i 's/VerbosePkgLists/VerbosePkgLists\nILoveCandy/g' /etc/pacman.conf")

        # 
        print("#[multilib]")
        print("#Include = /etc/pacman.d/mirrorlist")
        _GG = input("Don't forget remove this -> # <Press Enter>")
        os.system("sudo nano")
        os.system("sudo pacman -Syu --noconfirm archlinux-keyring xorg.-xinput")


        # all packages
        os.system("sudo pacman -S --noconfirm zip unzip p7zip  expac jshon gvfs-mtp mtpfs exfat-utils a52dec faac fuse-exfat faad2 jasper lame libdca libdv")
        os.system("sudo pacman -S --noconfirm gst-libav libmad libtheora libmpeg2 wavpack x264 xvidcore libdvdcss libdvdread libdvdnav dvd+rw-tools")
        os.system("sudo pacman -S --noconfirm dvdauthor dvgrab lib32-alsa-lib  lib32-alsa-plugins  lib32-libpulse  lib32-alsa-oss net-tools xsel")
        os.system("sudo pacman -S --noconfirm pcre pcre2 lib32-pcre lib32-pcre2 util-linux util-linux-libs lib32-util-linux xz lib32-xz")
        os.system("sudo pacman -S --noconfirm gparted vlc conky leafpad arandr btop jdk-openjdk bchunk")
        os.system("sudo pacman -S --noconfirm qbittorrent dmenu rofi fastfetch make cmake openssh timidity fail2ban")

        # Personal Programs
        os.system("sudo pacman -S --nocomfirm ranger cmus dunst nitrogen")
        os.system("sudo pacman -S --nocomfirm zathura zathura-pdf-poppler ristretto")
        os.system("sudo pacman -S --nocomfirm lxappearance lxapperance-obconf scrot")

        # System Optimisation
        os.system("sudo -Sy --noconfirm irqbalance tlp tlpui cpupower")

        os.system("sudo systemctl enable --now irqbalance")
        os.system("sudo systemctl enable --now tlp")
        os.system("sudo systemctl enable --now cpupower")
        os.system("sudo cpupower frequency-set -g ondemand")

        # connect ssh
        os.system("sudo systemctl enable --now sshd")
        os.system("sudo systemctl start sshd")

        os.system("sudo systemctl enable --now fail2ban")
        os.system("sudo systemctl start fail2ban")

        # Cpu Ucde Is Important
        while True:
            _userInput = str(input("Cpu UCODE -> <intel | amd >:| ")).lower()
            if _userInput == "amd":
                os.system("sudo pacman -Sy --nocomfirm amd-ucode")
                break
            elif _userInput == "intel":
                os.system("sudo pacman -Sy --nocomfirm intel-ucode")
                break
            else:
                print("just write enter input like this -> intel or amd")

        # This is browser
        while True:
            print("Browser List: -> if you don't want to install browser  -> 'exit'")
            print("QuteBrowser -> qt")
            print("Firefox     -> fx")
            print("Chromium    -> ch")
            print("Brave       -> br")
            print("Vivaldi     -> vr")

            _userInput = str(input("Enter Browser Name:| ")).lower()
            if _userInput   == "qt" or "qutebrowser":
                os.system("sudo pacman -Sy --nocomfirm qutebrowser python-adblock")
                break
            elif _userInput == "fx" or "firefox":
                os.system("sudo pacman -Sy --nocomfirm firefox firefox-adblock-plus")
                break
            elif _userInput == "ch" or "chromium":
                os.system("sudo pacman -Sy --nocomfirm chromium")
                break
            elif _userInput === "br" or "brave":
                os.system("sudo pacman -Sy --nocomfirm brave-browser")
                break
            elif _userInput == "vr" or "vivaldi":
                os.system("sudo pacman -Sy --nocomfirm vivaldi vivaldi-ffmpeg-codecs")
                break
            elif _userInput == "exit":
                break
            else:
                print("What??? bro??")



