call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'wincent/command-t', {
  \ 'do': 'cd ruby/command-t/ext/command-t && /opt/homebrew/opt/ruby/bin/ruby extconf.rb && make',
  \ 'branch': '5-x-release'
  \}

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sleuth'

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'airblade/vim-gitgutter'

Plug 'sheerun/vim-polyglot'
call plug#end()

let mapleader = "\<SPACE>"

set mouse=a
set syntax=on
set number
set relativenumber
set backspace=indent,eol,start

colorscheme default
highlight! link Visual ErrorMsg

set clipboard=unnamed

inoremap jj <Esc>

nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set splitbelow
set splitright

nnoremap <C-l> gT
nnoremap <C-h> gt
nnoremap <C-t> :tabnew<CR>

set ignorecase
set smartcase

nnoremap <C-q> :bd <CR>

autocmd VimResized * :wincmd =

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

set wildmode=list:longest,full
set wildignore+=.build,pods,.DS_Store,Packages,cache,testBuild
