#!/bin/bash

cp .Xresources ~/
xrdb -merge ~/.Xresources
cp .bashrc ~/
