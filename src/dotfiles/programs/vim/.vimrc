
set nocompatible

filetype on
filetype plugin on
filetype indent on
syntax on

set number
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set incsearch
set ignorecase
set showcmd
set showmatch
set hlsearch
set backspace=2
set backspace=indent,eol,start


let g:ycm_key_list_select_completion=['<TAB>']


autocmd Vimenter * NERDTree
let NERDTreeWinSize=25



" PLUGIN ------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  " Asynchronous Lint Engine (ALE)
  Plug 'dense-analysis/ale'

  " NERDTree - File explorer for Vim
  Plug 'preservim/nerdtree'

  " YouCompleteMe (YCM) - Code completion engine
  Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

call plug#end()

" }}}
