mkdir -p ~/.vim
cp .vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp -p .ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/
cd ~/.vim/plugged/YouCompleteMe/
./install.py --clang-completer



