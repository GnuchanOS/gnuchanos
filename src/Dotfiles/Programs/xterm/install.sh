#!/bin/bash

cp .Xresources ~/
xrdb -merge ~/.Xresources
ln --symbolic /usr/share/icons/GnuchanCursors/ ~/.local/share/icons/default
