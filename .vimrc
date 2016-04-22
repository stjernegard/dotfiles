call plug#begin()
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()


syntax on
:set number
:set relativenumber

filetype plugin indent on

set t_Co=256
