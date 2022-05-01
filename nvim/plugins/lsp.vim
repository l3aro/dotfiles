Plug 'https://github.com/junnplus/nvim-lsp-setup'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/williamboman/nvim-lsp-installer'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/cmp-path'
Plug 'https://github.com/hrsh7th/cmp-cmdline'
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/hrsh7th/cmp-vsnip'
Plug 'https://github.com/hrsh7th/vim-vsnip'

function SetupLsp()
lua << EOF
require('nvim-lsp-setup').setup({
    mappings = {
        gf = 'lua vim.lsp.buf.formatting()',
        gd = 'lua require"telescope.builtin".lsp_definitions()',
        gi = 'lua require"telescope.builtin".lsp_implementations()',
        gr = 'lua require"telescope.builtin".lsp_references()',
    },
    on_attach = function(client, bufnr)
    end,
    servers = {
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        intelephense = {},
        html = {},
        cssls = {},
        tsserver = {},
        vuels = {},
    },
})
EOF
endfunction

function SetupCompletion()
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF
endfunction


augroup LspOverrides
	autocmd!
	autocmd User PlugLoaded call SetupLsp()
	autocmd User PlugLoaded call SetupCompletion()
augroup END
