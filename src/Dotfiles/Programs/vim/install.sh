cp .vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo pacman -Sy vim vim-plugins
yay -Sy vim-plug
vim +PlugInstall +qall








