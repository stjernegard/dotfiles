call plug#begin()
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/nerdtree'
call plug#end()

syntax on
:set number
:set relativenumber

filetype plugin indent on

set t_Co=256

" Open NERDTree when vim opens without any files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim when NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree shortcut
map <silent> <C-b> <C-k> :NERDTreeFocus<CR>
map <silent> <C-b> <C-j> :NERDTreeFind<CR>

let g:NERDTreeQuitOnOpen = 1
