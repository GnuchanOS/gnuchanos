import os

class InstallYaY:
    def __init__(self) -> None:
        self.HomePath = os.path.expanduser("~")
        self.LocalTMPFile = f"{self.HomePath}/tmp"
        os.chdir(self.HomePath)

        try:
            if not os.path.exists(self.LocalTMPFile):
                os.mkdir(self.LocalTMPFile)
                os.chdir(self.LocalTMPFile)
            else:
                os.chdir(self.LocalTMPFile)

            if not os.path.exists(f"{self.LocalTMPFile}/yay"):
                os.system("sudo pacman -Syu --needed base-devel")
                os.system("git clone https://aur.archlinux.org/yay.git")
            
            if os.path.exists(f"{self.LocalTMPFile}/yay"):
                os.chdir(f"{self.LocalTMPFile}/yay")
                os.system("makepkg -si")
                os.system("yay -S rar irssi gpu-screen-recorder --rebuild")
        except Exception as ERR:
            print(ERR)

if __name__ == "__main__":
    gc = InstallYaY()



