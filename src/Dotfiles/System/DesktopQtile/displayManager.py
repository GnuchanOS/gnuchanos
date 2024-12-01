"""
this lgpl3+ 4.61.0.206 Unreleased version
fun it's a serious goal of the project. if we're not having fun while making stuff, when something's not right!
"""

# Don't do like this from lib import * for gnchangui
from GnuChanGUI import GnuChanGUI, os, Thread
from GnuChanGUI import GnuChanOSColor, GColors, Themecolors
from GnuChanGUI import GKeyboard
from pam import pam

# Extra Lib
# #Thread(target=DownloadVideo, args=[]).start()


class DefaultExample:
    def __init__(self) -> None:
        self.GC = GnuChanGUI(Title=" UwU ", Size=(1024, 655), resizable=True, finalize=True)
        Themecolors().GnuChanOS        # you can change theme color
        self.C = GColors()             # all color in here
        self.CGC = GnuChanOSColor()    # gnuchanos colors


        # main window layout you can use column and frame in here
        self.Layout = [
            [self.GC.GText(SetText="Simple Display Manager", xStretch=True, TPosition="center")],
            [self.GC.GText(SetText="User Name: "), self.GC.GInput(SetValue="name", xStretch=True)],
            [self.GC.GText(SetText="User Password: "), self.GC.GInput(SetValue="password", xStretch=True, HidePassword="*")],
            [
                self.GC.GPush(),
                    self.GC.GButton(Text="Login"),
                    self.GC.GButton(Text="Shutdown"),
                    self.GC.GButton(Text="Reboot"),
                self.GC.GPush(),
            ]
        ]

        self.GC.GWindow(SetMainWindowLayout_List=self.Layout)
        self.KYB = GKeyboard(window=self.GC)
        # Call Function Here

        self.username = ""
        self.userpassword = ""
        self.checkUser = pam()


        # Call Function Here
        self.GC.SetUpdate(Update=self.Update, exitBEFORE=self.BeforeExit)

    def Update(self):
        #self.GC.GetEvent == "event" -> window event
        #self.GC.GetWindow["text"].update("this text") -> update window objects

        if self.GC.GetEvent == "Login" or self.GC.GetEvent == self.KYB.Return:
            self.username = self.GC.GetValues["name"]
            self.userpassword = self.GC.GetValues["password"]
            if len(self.username) > 0 and len(self.userpassword) > 0:
                if self.checkUser.authenticate(self.username, self.userpassword):
                    os.system(f"su - {self.username} -c 'startx'")




    def BeforeExit(self):
        print("Exit")

if __name__ == "__main__":
    DefaultExample()
