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
    -- Default mappings
    -- gD = 'lua vim.lsp.buf.declaration()',
    -- gd = 'lua vim.lsp.buf.definition()',
    -- gt = 'lua vim.lsp.buf.type_definition()',
    -- gi = 'lua vim.lsp.buf.implementation()',
    -- gr = 'lua vim.lsp.buf.references()',
    -- K = 'lua vim.lsp.buf.hover()',
    -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
    -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
    -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
    -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
    -- ['<space>e'] = 'lua vim.lsp.diagnostic.show_line_diagnostics()',
    -- ['[d'] = 'lua vim.lsp.diagnostic.goto_prev()',
    -- [']d'] = 'lua vim.lsp.diagnostic.goto_next()',
    default_mappings = true,
    -- Custom mappings
    -- Example mappings for telescope pickers:
    -- gd = 'lua require"telescope.builtin".lsp_definitions()',
    -- gi = 'lua require"telescope.builtin".lsp_implementations()',
    -- gr = 'lua require"telescope.builtin".lsp_references()',
    mappings = {},
    -- Global on_attach
    -- on_attach = function(client, bufnr) {
    --     utils.format_on_save(client)
    -- },
    -- Global capabilities
    -- capabilities = vim.lsp.protocol.make_client_capabilities(),
    -- LSP servers
    servers = {
        -- Install LSP servers automatically
        -- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        intelephense = {},
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
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
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

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['intelephense'].setup {
    capabilities = capabilities
  }
EOF
endfunction


augroup LspOverrides
	autocmd!
	autocmd User PlugLoaded call SetupLsp()
	autocmd User PlugLoaded call SetupCompletion()
augroup END
