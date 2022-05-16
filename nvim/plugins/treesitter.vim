Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

function TreesitterSetup()
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "json",
      "JSON with comment",
      "lua",
      "php",
      "prisma",
      "python",
      "regex",
      "scss",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
    }
}
EOF
endfunction

augroup TreesitterOverrides
    autocmd!
    autocmd User PlugLoaded call TreesitterSetup()
augroup END
