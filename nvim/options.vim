set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set mouse=a
set foldmethod=indent
set signcolumn=yes
set list
set listchars=tab:▸\ ,trail:·
set nobackup
set nowritebackup
set cursorline
set clipboard+=unnamedplus

set encoding=UTF-8
syntax on
filetype plugin on

if has('wsl')
    let g:clipboard = {
          \   'name': 'wslclipboard',
          \   'copy': {
          \      '+': '/mnt/c/Programs/win32yank.exe -i --crlf',
          \      '*': '/mnt/c/Programs/win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': '/mnt/c/Programs/win32yank.exe -o --lf',
          \      '*': '/mnt/c/Programs/win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 1,
          \ }
endif
