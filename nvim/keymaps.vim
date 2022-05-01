let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>Q :bufdo bdelete<cr>
map <esc> :noh <CR>

" Allow gf to open/create non exists file
map gf :edit <cfile><cr>

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Make Y behave like other capitals
nnoremap Y y$

" Quicky escape to normal mode
imap jj <esc>
imap <C-s> <esc> :w <cr>
nmap <C-s> :w <cr>

nmap <leader>mj ddp
nmap <leader>mk ddkP

" Search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
