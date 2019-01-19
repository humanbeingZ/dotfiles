inoremap jj <Esc>

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
