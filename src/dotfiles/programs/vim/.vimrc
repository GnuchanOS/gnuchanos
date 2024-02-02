" Vim ayarları

set nocompatible
set mouse=a

set undofile
set undodir=~/.vim/undodir
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undodir
endif

" settings
set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=black ctermfg=white
hi CursorColumn cterm=NONE ctermbg=black ctermfg=white

set noswapfile
set nobackup
set nowritebackup
set showmode
set number
set showmatch
syntax enable

set list
set listchars=tab:→\ ,trail:·,extends:>,precedes:<,nbsp:_
set autoindent
set smartindent
set tabpagemax=10

autocmd VimEnter * NERDTree

" tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
map <C-Right> :tabnext<CR>
map <C-Left> :tabprev<CR>
map <C-Up> :tabfirst<CR>
map <C-Down> :tablast<CR>

command Tabnew tabnew | NERDTree
command Tabnext tabnext
command Tabprev tabprev
command Tabclose tabclos


" search
set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmenu
set wildmode=longest,list,full
set wildignore+=*.o,*.obj,*.swp
command! -nargs=1 OpenFile :edit <args>


nnoremap <leader>l :SyntaxCheck<CR>

inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>


let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_invoke_completion = '<C-Space>'


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer' }
call plug#end()




