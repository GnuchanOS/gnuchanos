#!/bin/bash

# intel driver
# vulkan-intel lib32-vulkan-intel 
# sudo pacman -S --needed lib32-mesa vulkan-icd-loader lib32-vulkan-icd-loader

# wine
sudo pacman -S  wine-cachyos wine-gecko  wine-mono gstreamer gst-plugins-base gst-plugins-good

sudo pacman -S --needed --asdeps giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse \
lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite \
lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs \
lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2

sudo pacman -Sy cachyos-gaming-applications proton-cachyos

yay -Sy gst-plugins-{base,good,bad,ugly}

#games
sudo pacman -S --noconfirm kdialog
yay -Sy  gamemode lib32-gamemode winetricks
sudo pacman -Sy steam heroic-games-launcher gamescope
winecfg

winetricks -q corefonts 
winetricks -q dxvk 
winetricks -q vkd3d  
winetricks -q d3dcompiler_43 
winetricks -q cnc_ddraw 
winetricks -q vcrun2019 
winetricks -q vcrun2015 
winetricks -q d3dx9 
winetricks -q vcrun2019 
winetricks -q directx9 
winetricks -q mfc42 
winetricks -q corefonts 
winetricks -q vcrun6 
winetricks -q quicktime72 
winetricks -q quicktime76 
winetricks -q cjkfonts 
winetricks -q faudio 
winetricks -q dotnet20 
winetricks -q vcrun2008 
winetricks -q icodecs 
winetricks -q vcrun6 
winetricks -q vcrun2010 
winetricks -q msxml3 
winetricks -q vcrun2010 
winetricks -q dotnet40 
winetricks -q physx 
winetricks -q wmp9 
winetricks -q wmp10 
winetricks -q wsh57 
winetricks -q dxdiagn 
winetricks -q dxdiag 
winetricks -q quartz 
winetricks -q devenum 
winetricks -q wmp10 
winetricks -q vcrun6sp6
winetricks -q dotnet45


#mangohud --dlsym for opengl # MANGOHUD=1 for vulkan
#WINEPREFIX=/home/archkubi/.wine/ primusrun gamemoderun mangohud --dlsym wine falloutwHR.exe

#WINEPREFIX=/home/archkubi/.wine64/ optirun wine Godot_v3.0-stable_win64.exe
# for tf2 -> in console -> tf_time_loading_item_panels 0.0005

#Start Minecraft
#gamemoderun mangohud --dlsym %command% 



# lutris heroicGames steam
# steam > PROTON_USE_WINED3D=1 gamemoderun mangohud --dlsym %command% -gl
# PROTON_USE_WINED3D=1 vblank_mode=0  gamemoderun mangohud --dlsym %command% -gl