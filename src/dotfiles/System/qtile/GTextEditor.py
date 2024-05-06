from GnuChanGUI import *
import webbrowser


gc = GnuChanGUI(Title="GnuChan Simple Text Editor", Size=(1024, 600), resizable=True)
gc.Theme()

gMenu = [
    ["File", ["Open File", "Save As", "Save", "Exit"]],
    ["Info", ["GnuChanOS", "Youtube Channel", "Github Page"]],
    ["View", ["Left Panel", ["Hide Panel", "Show Panel"]]],
    ["Settings", [  "Border", ["Border +", "Border -"],
                    "Text Colors", ["Text: white","Text: black","Text: red","Text: blue","Text: pink","Text: purple"],
                    "Background Colors", ["Background: white","Background: black","Background: red","Background: blue","Background: pink","Background: purple"],
                    ]
                ],
    ["Tab Settings", ["Open New Tab", "Close Last Tab", "Close Random Tab"]],
    ]

filePath = "Open File or save File"
borderSize = 0
textSize = int(gc.font.split(",")[1].strip(" "))
set_options(font=gc.font, background_color="#0b0021")


maintextEdit = [
    [gc.GText(title="this is main code", bcolor="#0b0021", xStretch=True, EmptySpace=(0,0)), gc.GButton("Make This Default")],
    [GTextEditor('', key="multiLineText", justification='left', focus=True, expand_x=True, expand_y=True, enable_events=True, horizontal_scroll=False, sbar_width=10, sbar_arrow_width=10)],
    [gc.GText(title="File Path |:", font=gc.font, bcolor=GnuChanOSColor().colors1), gc.GText(title=filePath, font=gc.font, value="textPath", xStretch=True, bcolor=GnuChanOSColor().colors1)]
            ]

fileList = [
    [gc.GText(title="This Is File List", xStretch=True,position="center", bcolor=GnuChanOSColor().colors5, EmptySpace=(0,0))],
    [gc.GListBox(value="fileList",  xStretch=True, yStretch=True, noScroolBar=True, bcolor=GnuChanOSColor().colors0, EmptySpace=(0,0))]
            ]

runner = [
    [gc.GText(title="Code Runner", xStretch=True, position="center")],
    [gc.GButton(title="Run Script", xStretch=True)],
    
]
#[gc.GLog(value="debug", xStretch=True, yStretch=True)]

tabgroupEkstra = [
    [gc.GText(title="This is Active Tab", position="center", xStretch=True)],
    [gc.GText(title="Main", value="tabstr", position="center", xStretch=True)],
    [gc.hsep],
    [gc.GTabGroup(TabGroupLayout=[
        [gc.GTab(TabLayout=fileList, title="File")],
        [gc.GTab(TabLayout=runner, title="Runners")],
        ], 
        value="group2", size=(10, None),
        bcolor="#010003", sbcolor="#0c0017", stcolor="#9966ff", 
        tcolor="#8700ff", tbcolor="#0e0226", fcolor="#9966ff")]
]

tabgroup = [
    [gc.GTabGroup(TabGroupLayout=[
        [gc.GTab(TabLayout=maintextEdit, title="MainTab")],
        ], 
        value="group",
        bcolor="#010003", sbcolor="#0c0017", stcolor="#9966ff", 
        tcolor="#8700ff", tbcolor="#0e0226", fcolor="#9966ff")]
]

layout = [
    [gc.GMenuForTheme(winMenu=gMenu, font=gc.font)],
    [   
        gc.GColumn(winColumn=tabgroupEkstra, value="ekstra", xStretch=True, yStretch=True, bcolor="#0b021f"),
        gc.GColumn(winColumn=tabgroup, value="panel", yStretch=True, xStretch=True, bcolor="#0b021f"),
    
    ],
    ]

gc.GWindow(mainWindow=layout)
activeTab = "multiLineText"

# create line number
textEditLine = gc.window[activeTab]
textEditLine.initial(gc.window, width=3, bg="#0f0229", fg="#808080",  font=gc.font)

# ekstra settings
gc.GMultilineTabSpace(gMultilineValue=activeTab, gMultilineFont=gc.font)
gc.GListBoxBorderSize(value="fileList", border=0)
cc = GVisible(window=gc.window, firstObject="ekstra", secondObject="panel")

textOpen = FileSave(value="multiLineText", window=gc.window)
index = 1
def update():
    global borderSize, index, activeTab, textOpen, textSize, textEditLine, textEditLineTab, filePath, pathTab


    if gc.event == "Open New Tab":
        if index <= 10:
            newtext = [
                [gc.GText(title=f"TAB:{index}", bcolor="#0b0021", xStretch=True, EmptySpace=(0,0)), gc.GButton(title=f"Tab {index} Active")],
                [GTextEditor('', key=f"multiLineText{index}", justification='left', focus=True, expand_x=True, expand_y=True, enable_events=True, horizontal_scroll=False, sbar_width=10, sbar_arrow_width=10)],
                [gc.GText(title="File Path |:", font=gc.font, bcolor=GnuChanOSColor().colors1), gc.GText(title=filePath, font=gc.font, value=f"textPath{index}", xStretch=True, bcolor=GnuChanOSColor().colors1)]
                ]
            gc.window["group"].add_tab(gc.GTab(TabLayout=newtext, title=f"TAB:{index}", value=f'Tab {index}'))
            gc.window[f"Tab {index}"].select()
            textEditLineTab = gc.window[f"multiLineText{index}"]
            textEditLineTab.initial(gc.window, width=3, bg="#0f0229", fg="#808080", font=gc.font)
            gc.window[f"textPath{index}"].update("Open File or save File")
            index += 1

    # line number update
    if gc.event in [f"multiLineText{1}", f"multiLineText{2}", f"multiLineText{3}", f"multiLineText{4}", f"multiLineText{5}", 
                        f"multiLineText{6}", f"multiLineText{7}", f"multiLineText{8}", f"multiLineText{9}", f"multiLineText{10}"]:
        textEditLineTab.reset()
    elif gc.event == "multiLineText":
        textEditLine.reset()

    # nope
    if gc.event == "Close Last Tab":
        gc.GMessage(wmTitle="Warning", message="This is Not Finish Yet!")
    if gc.event == "Close Random Tab":
        gc.GMessage(wmTitle="Warning", message="This is Not Finish Yet!")

    if gc.event in ["Tab 1 Active", "Tab 2 Active", "Tab 3 Active", "Tab 4 Active", "Tab 5 Active", 
                    "Tab 6 Active", "Tab 7 Active", "Tab 8 Active", "Tab 9 Active", "Tab 10 Active"]:
        activeTab = f"multiLineText{gc.event[4:6]}".strip(" ")
        gc.window["tabstr"].update(f"TAB{gc.event[4:6]}")
        textOpen = FileSave(value=activeTab, window=gc.window)

    if gc.event == "Make This Default":
        activeTab = "multiLineText"
        gc.window["tabstr"].update("Main")
        textOpen = FileSave(value=activeTab, window=gc.window)

    if gc.event == "GnuChanOS":
        webbrowser.open("https://gnuchanos.itch.io/")
    if gc.event == "Youtube Channel":
        webbrowser.open("https://www.youtube.com/@GnuChanOS")
    if gc.event == "Github Page":
        webbrowser.open("https://github.com/gnuchanos")

    # File Open And Save
    if gc.event == "Open File":
        textOpen.Open
        try:
            # file list
            filePath = str(textOpen.filename)
            directory = os.path.dirname(filePath)
            fileList = []
            for filename in os.listdir(directory):
                if filename.endswith((".py", ".gc", ".c")):
                    fileList.append(filename)
            gc.window["fileList"].update(fileList[2:])

            # path file
            pathTab = f"textPath{activeTab[13:]}".strip(" ")
            if pathTab != "textPath":
                gc.window[pathTab].update(textOpen.filename)
            else:
                gc.window["textPath"].update(textOpen.filename)

        except FileNotFoundError:
            gc.GMessage(wmTitle="Warning", message="You Must Open File Bro")


    elif gc.event == "Save As":
        textOpen.SaveAs
    elif gc.event == "Save":
        textOpen.Save

    if gc.event == "Run Script":
        try:
            if activeTab != "multiLineText":
                print("this is works")
                runPath = gc.window[f"textPath{activeTab[13:]}".strip(" ")].get()
                print(runPath)
                if ".py" in runPath:
                    os.system(f"python {runPath}")
                else:
                    gc.GMessage(wmTitle="Warning", message="Open Script File first")
            if activeTab == "multiLineText":
                runPath = gc.window["textPath"].get()
                if ".py" in runPath:
                    os.system(f"python {runPath}")
                else:
                    gc.GMessage(wmTitle="Warning", message="Open Script File first")
        except TypeError:
            gc.GMessage(wmTitle="Warning", message="First Open Python File")

    # Text Colors
    if gc.event in ["Text: white", "Text: black", "Text: red", "Text: blue", "Text: pink", "Text: purple"]:
        gc.ChangeTextColor(textValue=activeTab, color=gc.event[6:])

    # Background colors
    if gc.event in ["Background: white", "Background: black", "Background: red", "Background: blue", "Background: pink", "Background: purple"]:
        gc.ChangeBackgroundColor(Value=activeTab, color=gc.event[12:])

    # borde size but looks ugly 
    if gc.event == "Border +":
        borderSize += 2
        gc.GSelectionBorderSize(value=activeTab, border=borderSize, borderColor="black", highlightcolor="red")
    if gc.event == "Border -":
        if borderSize >= 0:
            borderSize -= 2
            gc.GSelectionBorderSize(value=activeTab, border=borderSize, borderColor="black", highlightcolor="red")

    if gc.event == "Show Panel":
        cc.unhide
    elif gc.event == "Hide Panel":
        cc.hide
        

gc.update(GUpdate=update)