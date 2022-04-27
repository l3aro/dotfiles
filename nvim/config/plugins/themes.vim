" https://github.com/rafi/awesome-vim-colorschemes
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/tomasiser/vim-code-dark'

augroup ThemeOverrides
	autocmd!
	autocmd User PlugLoaded ++nested colorscheme codedark
augroup end
let g:airline_theme = 'codedark'
