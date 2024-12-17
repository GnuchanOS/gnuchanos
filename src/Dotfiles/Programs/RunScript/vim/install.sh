#!/bin/bash

cp .vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
echo "cd ~/.vim/plugged/YouCompleteMe"
echo "python3 install.py --clangd-completer --tern-completer --rust-completer"


# for xterm
echo "stty erase ^H" >> ~/.bashrc
echo "fish" >> ~/.bashrc

