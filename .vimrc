set nocompatible
set number
set relativenumber

set path+=**
set wildmenu

set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4

set list
set listchars=tab:▸\ ,trail:·
set nobackup
set nowritebackup

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

syntax enable
filetype plugin on
