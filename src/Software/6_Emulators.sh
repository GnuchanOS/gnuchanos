#!/bin/bash

# Kullanıcıya emülatörler hakkında bilgi veriyoruz
echo "Game Boy Advance  -> gba"
echo "PSP               -> psp"
echo "PS1               -> ps1"
echo "PS2               -> ps2"
echo "NES               -> nes"
echo "SNES              -> snes"
echo "NDS               -> melon"
echo "Genesis/Megadrive -> gm"
echo "EXİT              -> exit"

# Yay (yay) gerekliliği hakkında kullanıcıyı bilgilendiriyoruz
echo "You Need Yay to Install Emulators"
read -p "<YES-NO>:| " _Input

# Yay kurulu ise emülatörleri kuruyoruz
if [ "$_Input" == "yes" ]; then
    yay -Sy mgba-qt ppsspp ppsspp-assets duckstation-qt-bin
    yay -Sy pcsx2-latest-bin melonds-bin blastem-bin snes9x nestopia
fi

# Kullanıcıya emülatör seçme işlemi yaptırıyoruz
while true; do
    read -p "You Need YaY <YES-NO>:| " _UserInput
    _UserInput=$(echo "$_UserInput" | tr '[:upper:]' '[:lower:]') # küçük harfe dönüştürüyoruz

    if [ "$_UserInput" == "yes" ]; then
        read -p ":| " _UserInput
        case "$_UserInput" in
            "gba")
                yay -Sy mgba-qt
                ;;
            "psp")
                yay -Sy ppsspp ppsspp-assets
                ;;
            "ps1")
                yay -Sy duckstation-qt-bin
                ;;
            "ps2")
                yay -Sy pcsx2
                ;;
            "nes")
                yay -Sy nestopia
                ;;
            "snes")
                yay -Sy snes9x
                ;;
            "melon")
                yay -Sy melonds-bin
                ;;
            "gm")
                yay -Sy blastem-bin
                ;;
            "exit")
                break
                ;;
            *)
                echo "????"
                ;;
        esac
    else
        echo "YaY gereklidir. Lütfen önce YaY kurun."
        break
    fi
done