call plug#begin()
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mileszs/ack.vim'
Plug 'wincent/command-t'
Plug 'vim-syntastic/syntastic'

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'mitsuse/autocomplete-swift'

Plug 'keith/swift.vim'
call plug#end()


set mouse=a
set syntax=on
set number
set relativenumber
set expandtab
set shiftwidth=4
set softtabstop=4


highlight! link Visual ErrorMsg


inoremap jj <Esc>

nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

nnoremap <C-q> :bd <CR>

nnoremap <leader>[ :tabprevious <CR>
nnoremap <leader>] :tabnext <CR>

nnoremap <leader>R :T vapor run <CR>
nnoremap <leader>B :T vapor build && exit <CR>
nnoremap <leader>T :T vapor test && exit <CR>


autocmd BufNewFile,BufRead *.swift set filetype=swift
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)

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
set wildignore+=.build,pods,.DS_Store,Packages

let g:neoterm_size = 30
let g:syntastic_swift_checkers = ['swiftlint']
let g:deoplete#enable_at_startup = 1
