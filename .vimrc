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
set expandtab
set tabstop=2  
set shiftwidth=2
set autoindent
set complete-=i 

" set nohls
set hls
hi Search cterm=NONE ctermfg=black ctermbg=magenta

set number
highlight LineNr ctermfg=Gray

filetype on
syntax on

" set foldmethod=marker 
" set foldmarker={,}
set foldmethod=syntax

au BufRead *.py
    \ set tabstop=4 | 
    \ set foldmethod=indent |
    \ set shiftwidth=4

au BufRead * normal zR

" cursor shape 
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
autocmd VimEnter * silent !echo -ne "\e[2 q"

" seem to make vim color consistent inside and outside tmux
set background=dark
