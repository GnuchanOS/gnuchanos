
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

set showtabline=2
set guioptions-=e

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


let g:ycm_key_list_select_completion=['<TAB>']
let g:rust_clip_command = 'pbcopy'

" PLUGIN ------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

  " Asynchronous Lint Engine (ALE)
  Plug 'dense-analysis/ale'

  " YouCompleteMe (YCM) - Code completion engine
  Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

  " for rust
  Plug 'rust-lang/rust.vim'

call plug#end()

" }}}
