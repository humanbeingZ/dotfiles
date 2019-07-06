" disable arrow keys in normal mode and insert mode
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>

noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
noremap <down> <Nop>

inoremap jj <Esc>
vnoremap x "_x

set mouse=a

set hls
hi Search cterm=NONE ctermfg=black ctermbg=magenta

set number
highlight LineNr ctermfg=Gray

filetype on
syntax on

set autoindent
set ignorecase
set smartcase
set expandtab

au FileType python 
    \ set tabstop=4 shiftwidth=4 |
    \ set foldmethod=indent

au FileType c,cpp
    \ set tabstop=2 shiftwidth=2 | 
    \ set complete-=i | 
    \ set foldmethod=syntax
    " \ set foldmethod=marker foldmarker={,}

au FileType make 
    \ set noexpandtab 
    \ set tabstop=4 shiftwidth=4

au BufRead * normal zR

" cursor shape 
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
" autocmd VimEnter * silent !echo -ne "\e[2 q"

" seem to make vim color consistent inside and outside tmux
set background=dark
