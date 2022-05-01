Plug 'https://github.com/nvim-lua/popup.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-telescope/telescope-project.nvim'
Plug 'https://github.com/nvim-telescope/telescope-media-files.nvim'
Plug 'https://github.com/jvgrootveld/telescope-zoxide'
Plug 'https://github.com/nvim-telescope/telescope-fzy-native.nvim'
Plug 'https://github.com/sharkdp/fd'

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
    defaults = {
        file_ignore_patterns = {
            "^.git/",
            "^node_modules/",
            "^vendor/",
        },
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
})
require'telescope'.load_extension('zoxide')
require'telescope'.load_extension('project')
require'telescope'.load_extension('fzy_native')
EOF
endfunction

augroup TelescopeOverrides
    autocmd!
    autocmd User PlugLoaded call SetupTelescope()
augroup END

