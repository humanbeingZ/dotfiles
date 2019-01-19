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

set tabstop=4
set expandtab
set nohls
set autoindent

set number
highlight LineNr ctermfg=Gray

filetype on
syntax on

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
autocmd VimEnter * silent !echo -ne "\e[2 q"
