Plug 'https://github.com/neoclide/coc.nvim'

let g:coc_global_extensions = [
    \ 'coc-explorer',
\ ]

nnoremap <silent> <C-b> :CocCommand explorer --position right<CR>
