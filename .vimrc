call plug#begin()
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/syntastic'
call plug#end()

syntax on
:set number
:set relativenumber

filetype plugin indent on

set t_Co=256

set wildmode=list:longest,full
set ignorecase
