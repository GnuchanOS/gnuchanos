import os


class InstallEmulators:
    def __init__(self) -> None:
        print("Game Boy Advance  -> gba")
        print("PSP               -> psp")
        print("PS1               -> ps1")
        print("PS2               -> ps2")
        print("NES               -> nes")
        print("SNES              -> snes")
        print("NDS               -> melon")
        print("Genesis/Megadrive -> gm")
        print("EXİT              -> exit")

        print("You Need Yay to Install Emulators")
        self._Input = str(input("<YES-NO>:| "))

        if self._Input == "yes":
            os.system("yay -Sy mgba-qt ppsspp ppsspp-assets duckstation-qt-bin")
            os.system("yay -Sy pcsx2-latest-bin melonds-bin blastem-bin snes9x nestopia")


        while True:
            _UserInput = str(input("You Need YaY <YES-NO>:| ")).lower()
            if _UserInput == "yes"
                _UserInput = str(input(":| ")).lower()
                if _UserInput == "gba":
                    os.system("yay -Sy mgba-qt")
                elif _UserInput == "psp":
                    os.system("yay -Sy ppsspp ppsspp-assets")
                elif _UserInput == "ps1":
                    os.system("yay -Sy ductstation-qt-bin")
                elif _UserInput == "ps2":
                    os.system("yay -Sy pcsx2")
                elif _UserInput == "nes":
                    os.system("yay -Sy nestopia")
                elif _userInput == "snes":
                    os.system("yay -Sy snes9x")
                elif _userInput == "melon":
                    os.system("yay -Sy melonds-bin")
                elif _UserInput == "gm":
                    os.system("yay -Sy blastem-bin")
                elif _userInput == "exit":
                    break
                else:
                    print("????")

if __name__ == "__main__":
    gc = InstallEmulators()
