import os

class InstallTools:
    def __init__(self) -> None:
        print("Gimp        -> gmp")
        print("Audacity    -> adc")
        print("Krita       -> kri")
        print("Inkscape    -> ink")
        print("LibreOffice -> libof")
        print("Exit        -> exit")
        
        while True:
            _UserInput = str(input(":| ")).lower()

            if _userInput == "gmp":
                os.system("sudo pacman -Sy --nocomfirm gimp")
            elif _UserInput == "adc":
                os.system("sudo pacman -Sy --nocomfirm audacity")
            elif _UserInput == "kri":
                os.system("sudo pacman -Sy --nocomfirm krita")
            elif _UserInput == "ink":
                os.system("sudo pacman -Sy --nocomfirm inkscape")
            elif _UserInput == "libof":
                os.system("sudo pacman -Sy --nocomfirm libreoffice-fresh")
            elif _UserInput == "all":
                 os.system("sudo pacman -Sy --noconfirm gimp audacity krita inkscape libreoffice-fresh")        
            elif _UserInput == "exit":
                os.system()
            else:
                print("??????")

if __name__ == "__main__":
    gc = InstallTools()
