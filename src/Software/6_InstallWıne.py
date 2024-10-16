import os


class InstallWine:
    def __init__(self) -> None:
        os.system(f"sudo pacman -S wine-staging")

        os.system("sudo pacman -Sy --needed --asdeps --nocomfirm giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse")
        os.system("sudo pacman -Sy --deeded --asdeps --nocomfirm lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite")
        os.system("sudo pacman -Sy --needed --asdeps --nocomfirm lib32-sqlite libxcomposite lib32-libxcomposite ocl-icd lib32-ocl-icd libva")
        os.system("sudo pacman -Sy --needed --asdeps --nocomfirm lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs")
        os.system("sudo pacman -Sy --needed --asdeps --nocomfirm vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2")

        os.system("sudo pacman -Sy --nocomfirm kdialog")
        os.system("yay -Sy gamemode lib32-gamemode mangohud lib32-mangohud")i
        os.system("winecfg")

if __name__ == "__main__":
    gc = InstallWine()
