#!/bin/bash

sudo pacman -S npm  # Eğer npm yüklü değilse
sudo npm install -g vscode-html-languageserver-bin
sudo npm install -g vscode-css-languageserver-bin
sudo npm install -g typescript typescript-language-server
sudo npm install -g pyright

yay -Sy jdtls
yay -Sy rust-analyzer
sudo pacman -Sy gopls
go install golang.org/x/tools/gopls@latest


cp .vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
cp .ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clangd-completer --all --verbose


# for xterm
echo "stty erase ^H" >> ~/.bashrc
echo "fish" >> ~/.bashrc

#yay -Sy sdkmanager android-sdk
