" https://github.com/rafi/awesome-vim-colorschemes
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'

augroup ThemeOverrides
	autocmd!
	autocmd User PlugLoaded ++nested colorscheme codedark
augroup end
let g:airline_theme = 'codedark'
