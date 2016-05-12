call plug#begin()
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/syntastic'
Plug 'wincent/command-t'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/swift.vim'
call plug#end()

syntax on
:set number
:set relativenumber

filetype plugin indent on

set t_Co=256

set wildmode=list:longest,full
set ignorecase

set clipboard=unnamed

set nowrap

map <C-k> :vs.<CR>
map <C-p> :CommandT<CR>

set expandtab
set shiftwidth=4
set softtabstop=4
