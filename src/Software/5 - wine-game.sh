#!/bin/bash

# intel driver
# vulkan-intel lib32-vulkan-intel 
sudo pacman -S --needed lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader

# mgba colors
# 510087|1d0031|2a0061|1f0047
# 4b008a|260046|400094|30006f
# 8a00ff|5700a0|6300e4|4f00b5


# wine
sudo pacman -S --needed --noconfirm wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader wine-gecko 


#games
sudo pacman -S --noconfirm kdialog
yay -Sy  gamemode lib32-gamemode protonup-qt mangohud lib32-mangohud 


#1024x768 -> 1024x655
#winetricks ddr=gdi

WINEPREFIX=~/.wine WINEARCH=win32 wine winecfg
WINEPREFIX=~/.wine64 WINEARCH=win64 wine winecfg
echo alias wine64="WINEPREFIX=~/.wine64 wine" >> ~/.bashrc

WINEPREFIX=/home/archkubi/.wine/ wine # wine > 32bit
WINEPREFIX=/home/archkubi/.wine64/ wine64 # wine64 > 64bit

echo "WINEPREFIX=~/.wine64 winecfg"
echo "WINEPREFIX=~/.wine64 winetricks"
echo "WINEPREFIX=~/.wine64 wine64" # or wine for 32bit

#mangohud --dlsym # for opengl
gamemoderun mangohud --dlsym WINEPREFIX=/home/archkubi/.wine/ wine falloutwHR.exe
gamemoderun mangohud --dlsym WINEPREFIX=/home/archkubi/.wine64/ wine falloutwHR.exe
gamemoderun mangohud --dlsym %command%

#Start Minecraft
gamemoderun mangohud --dlsym java -jar TLauncher.jar


# lutris heroicGames steam
# steam > PROTON_USE_WINED3D=0 %command%
# steam > PROTON_USE_WINED3D=1 gamemoderun %command% -gl


