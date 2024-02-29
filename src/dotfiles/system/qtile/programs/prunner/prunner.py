from GnuChanGUI import *
import os, shutil





class pRunner:
    def __init__(self) -> None:
        self.gc = GnuChanGUI(Title="GnuChan Program Timer", Size=(340, 600), resizable=False)
        self.gc.Theme()

        self.programList = []
        self.ekstraPrograms = []
        self.openFile()
    
        self.layout = [
            [self.gc.GText("Program Name", font="Sabs, 20", xStretch=True, position="center")],
            [self.gc.GInput(value="input", xStretch=True)],
            [self.gc.GListBox(list=self.programList, value="prList", xStretch=True, yStretch=True, position="center", noScroolBar=True)] ]

        self.gc.GWindow(mainWindow=self.layout)
        self.gc.GListBoxBorderSize(value="prList", border=0)

        self.gc.update(GUpdate=self.update)

    def openFile(self):
        # read program list file
        with open("/home/archkubi/.config/qtile/programs/prunner/programslist.txt", "r") as file:
            fileToList = file.read().split("\n")
        fileToListSize = len(fileToList)

        # only read program name if not start with #
        for line in range(fileToListSize):
            if not fileToList[line].strip().startswith("#"):
                self.ekstraPrograms.append(fileToList[line])
        
        # if program in system add in listbox
        for i in self.ekstraPrograms:
            full_path = shutil.which(i)
            if full_path and os.path.dirname(full_path) == "/usr/bin":
                self.programList.append(i)
    
    def update(self):
        if self.gc.event == "Return:36":
            if len(self.gc.GetValues["input"]) >= 3:
                os.popen(self.gc.GetValues["input"])
                self.gc.closeWindow = True
            else:
                try:
                    os.popen(self.gc.GetValues["prList"][0])
                    self.gc.closeWindow = True
                except IndexError:
                    self.gc.GMessage(message="""
up, down arrow key - move 
space for choosing press enter or return key for run program 
""")


if __name__ == "__main__":
    new = pRunner()
