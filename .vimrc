set nocompatible

call plug#begin()
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/syntastic'
Plug 'wincent/command-t'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/swift.vim'
call plug#end()

syntax on
set number
set relativenumber
set linebreak
set ruler
set backspace=indent,eol,start
set showcmd
set incsearch
packadd matchit

filetype plugin indent on

set t_Co=256

set wildmode=list:longest,full
set wildignore+=build,pods,.DS_Store

set clipboard=unnamed

map <leader>[ :tabprevious <CR>
map <leader>] :tabnext <CR>

map <leader>R :!ruby Scripts/BuildAndRunApp.rb <CR>
map <leader>B :!ruby Scripts/BuildApp.rb <CR>
map <leader>U :!ruby Scripts/RunTests.rb <CR>

set expandtab
set shiftwidth=4
set softtabstop=4
