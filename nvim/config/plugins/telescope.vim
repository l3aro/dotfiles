Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'jvgrootveld/telescope-zoxide'

" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp <cmd>Telescope project<cr>

function SetupTelescope()
lua << EOF
require'telescope'.setup({
	pickers = {
		find_files = {
			hidden = true
		}
	}
})
require'telescope'.load_extension('media_files')
require'telescope'.load_extension('zoxide')
require'telescope'.load_extension('project')
EOF
endfunction

augroup TelescopeOverrides
	autocmd!
	autocmd User PlugLoaded call SetupTelescope()
augroup END

