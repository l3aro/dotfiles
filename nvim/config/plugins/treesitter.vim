Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

function TreesitterSetup()
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
}
EOF
endfunction

augroup TreesitterOverrides
    autocmd!
    autocmd User PlugLoaded call TreesitterSetup()
augroup END
