Plug 'https://github.com/karb94/neoscroll.nvim'

function SetupNeoscroll()
lua << EOF
require('neoscroll').setup({
	mappings = {'<C-u>', '<C-d>'}
})
EOF
endfunction

augroup ScrollOverrides
	autocmd!
	autocmd User PlugLoaded call SetupNeoscroll()
augroup END
