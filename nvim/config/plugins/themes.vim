Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/tomasiser/vim-code-dark'
Plug 'https://github.com/navarasu/onedark.nvim'

augroup ThemeOverrides
	autocmd!
	autocmd User PlugLoaded ++nested colorscheme onedark
augroup end
let g:airline_theme = 'onedark'
