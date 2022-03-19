Plug 'karb94/neoscroll.nvim'

function SetupNeoscroll()
lua require('neoscroll').setup()
endfunction

augroup ScrollOverrides
	autocmd!
	autocmd User PlugLoaded call SetupNeoscroll()
augroup END
