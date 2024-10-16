import os


class PythonPipInstall:
    def __init__(self) -> None:
        self.HomePath = os.path.expanduser("~")
        self.LocalTMPFile = f"{self.HomePath}/tmp"

        try:
            if os.path.exists(f"{self.LocalTMPFile}/yay"):
                self.Install()
            else:
                _question = str(input("Are You Install Yay ?? <YES-NO>:| ")).lower()
                if _question == "yes":
                    self.Install()
                else:
                    print("You Need Yay 'Do you want to install it?'")
                    _question = str(input("<YES-NO>:| ")).lower()
                    os.chdir(os.path.dirname(os.path.abspath(__file__)))
                    os.system(f"python3 0_FirstInstallYay.py")


        except Exception as ERR:
            print(ERR)

    def Install(self):
        os.system("yay -Sy python-pip")
        os.chdir(os.path.dirname(os.path.abspath(__file__)))
        if not os.path.exists(f"{self.HomePath}/.config/pip"):
            os.mkdir(f"{self.HomePath}/.config/pip")
            os.system(f"cp pip.conf {self.HomePath}/.config/pip")
            if os.path.exists(f"{self.HomePath}/.config/pip/pip.conf"):
                os.system("python -m pip install psutil python-magic pyinstaller cairocffi cffi xcffib")
                os.system("sudo pacman -Sy tk python-adblock python-iwlib")

if __name__ == "__main__":
    gc = PythonPipInstall()