#!/bin/bash

cp .vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
cd ~/.vim/plugged/YouCompleteM
python3 install.py --clangd-completer --tern-completer --rust-completer

# for xterm
echo "stty erase ^H" >> ~/.bashrc
echo "fish" >> ~/.bashrc

