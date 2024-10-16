import os


class InstallZram:
    def __init__(self) -> None:
        os.chdir(os.path.dirname(os.path.abspath(__file__)))

        os.system("sudo pacman -Sy --noconfirm zram-generator")
        os.system("sudo cp files/zram-generator.conf /etc/systemd/")
        os.system("systemctl daemon-reload")
        os.system("systemctl start /dev/zram0")
        os.system("zramctl")

if __name__ == "__main__":
    gc = InstallZram()