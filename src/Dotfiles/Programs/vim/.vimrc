set nocompatible " be iMproved, required
filetype off " required

" Ekstra settings
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let NERDTreeShowHidden=0

filetype plugin indent on
" Basic Settings
set number
syntax on

" Tab
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set termguicolors
set cursorline
set ignorecase
set smartcase
set incsearch
set hlsearch
set showcmd

set ruler
set showmatch
set scrolloff=3
set encoding=utf-8
set laststatus=2
set noshowmode
set mouse=a
set clipboard=unnamedplus
set noswapfile
set nobackup
set nowb

" Wild Menu
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Disable 'u' Key in Visual Mode
vnoremap u <Nop>
nnoremap s <Nop>
nnoremap r <Nop>
nnoremap o <Nop>
nnoremap <.> <Nop>
nnoremap <,> <Nop> 
nnoremap " <Nop>
nnoremap ' <Nop>
nnoremap - <Nop>
nnoremap & <Nop>
nnoremap . <Nop>
nnoremap ç <Nop>

" yank copy and remove something problem
nnoremap d "_d
nnoremap D "_D
nnoremap c "_c
nnoremap C "_C

" Disable Ctrl+S
nnoremap <C-s> <Nop>

" YouCompleteMe
set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,noinsert,noselect
set shortmess+=c
inoremap <C-Spaced> <C-x><C-o>

" 
" inoremap <expr> ) pumvisible() ? "\<C-y>)\<C-x>\<C-o>" : "\<C-x><C-o>"

" 
inoremap <silent> <Esc> <Esc>:pclose<CR>

" Split Window
nnoremap <C-w> :split<CR> " Split Horizontal

" Open and Close NerdTree
nnoremap <C-n> :NERDTreeToggle<CR> " Open Nerd Tree

" Key Mappings
nnoremap <C-s> :w<CR>  " Save with Ctrl + s
nnoremap <C-q> :q!<CR>  " Quit with Ctrl + q
nnoremap <C-t> :tabnew<CR>  " Open new tab with Ctrl + t

" Switch Tab
nnoremap <C-A-Right> :tabnext<CR>  " Switch to next tab with Ctrl + Alt + Right Arrow
nnoremap <C-A-Left> :tabprevious<CR>  " Switch to previous tab with Ctrl + Alt + Left Arrow

" Window Navigation with Alt Key
nnoremap <A-Left> :wincmd h<CR>   " Move left with Alt + Left Arrow
nnoremap <A-Right> :wincmd l<CR>  " Move right with Alt + Right Arrow
nnoremap <A-Up> :wincmd k<CR>     " Move up with Alt + Up Arrow
nnoremap <A-Down> :wincmd j<CR>   " Move down with Alt + Down Arrow

" Window Resizing with Ctrl Key
nnoremap <C-Left> :vertical resize -2<CR>  " Resize window to the left with Ctrl + Left Arrow
nnoremap <C-Right> :vertical resize +2<CR> " Resize window to the right with Ctrl + Right Arrow
nnoremap <C-Down> :resize +2<CR>    " Resize window up with Ctrl + Up Arrow
nnoremap <C-Up> :resize -2<CR>  " Resize window down with Ctrl + Down Arrow

" Automatic Parentheses Completion
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

" Switch Insert Mode with backspace
nnoremap <BS> i

" Preview close
autocmd FileType preview nnoremap <buffer> q :q<CR>

" Plug Settings
call plug#begin('~/.vim/plugged')
    Plug 'Valloric/YouCompleteMe'
    Plug 'tpope/vim-sensible'
    Plug 'scrooloose/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'yassinebridi/vim-purpura'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    call plug#end()

" Theme
colorscheme purpura
let g:crystalline_theme = 'purpura'
set background=dark
highlight CursorLine guibg=#6F00FF ctermbg=white


" Terminal In ViPlugm
