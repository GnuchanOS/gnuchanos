autocmd FileType * setlocal complete+=k

" Klavye kısayolları için
set nocompatible
filetype plugin indent on

" Vim tema ve renk düzenlemeleri
syntax on
colorscheme desert

set tabstop=4
set expandtab
set shiftwidth=4
set smarttab

" for copy thins
set clipboard=unnamedplus

" close symbols
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

set scrolloff=5
set hlsearch
set incsearch

set number

set errorformat=%f\ line\ %l:\ %m

call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'tpope/vim-unimpaired'
call plug#end()

" Airline ayarları
let g:airline#extensions#ctrlp#enabled = 0
let g:airline#extensions#netrw#enabled = 0
let g:airline#extensions#po#enabled = 0
let g:airline#extensions#quickfix#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#term#enabled = 0
let g:airline#extensions#wordcount#enabled = 0

command! Q q!
nnoremap <leader>q :q!<CR>

set noswapfile
set nobackup
set nowritebackup
