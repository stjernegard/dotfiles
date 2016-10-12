set nocompatible

call plug#begin()
Plug 'easysid/mod8.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'scrooloose/syntastic'
Plug 'wincent/command-t'
Plug 'vim-ruby/vim-ruby'
Plug 'keith/swift.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'mileszs/ack.vim'
call plug#end()

set shell=zsh\ -l

syntax on
colorscheme mod8
set background=light
set t_Co=256

set number
set relativenumber
set linebreak
set backspace=indent,eol,start
set showcmd
set incsearch

set laststatus=2
set statusline=\ [%n]\ %f\ %m%r%h\ %y\ [%{&ff}]    " buffer filename flags type format
set statusline+=%=%l/%L\ %P\                       " right hand side - line/total lines , column

autocmd BufWritePre * :call TrimWhiteSpace()

function! TrimWhiteSpace()
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
    update
endfunction

filetype plugin indent on

set wildmode=list:longest,full
set wildignore+=build,pods,.DS_Store,Packages

inoremap jj <Esc>

nnoremap Y y$

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

map <leader>[ :tabprevious <CR>
map <leader>] :tabnext <CR>

let g:syntastic_swift_checkers = ['swiftlint']

let g:VtrOrientation = 'h'
let g:VtrUseVtrMaps = 1

nnoremap <C-q> :bd <CR>
nnoremap <leader>R :VtrSendCommandToRunner! ruby Scripts/Run.rb <CR>
nnoremap <leader>B :VtrSendCommandToRunner! ruby Scripts/Build.rb <CR>
nnoremap <leader>T :VtrSendCommandToRunner! ruby Scripts/Test.rb <CR>
nnoremap <leader>U :VtrSendCommandToRunner! ruby Scripts/UITest.rb <CR>
nnoremap <leader>L :VtrSendCommandToRunner! ruby Scripts/LogTail.rb <CR>

set expandtab
set shiftwidth=4
set softtabstop=4
