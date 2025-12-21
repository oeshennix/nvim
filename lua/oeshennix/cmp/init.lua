local cmp = require'cmp'

vim.diagnostic.config({virtual_text=true});
cmp.setup({
--[[
  formatting={
    format=function(entry, vim_item)
      vim_item.kind = "\u{e654}";
      return vim_item
    end
  },
]]
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-S-k>'] = cmp.mapping.select_next_item(),
    ['<C-S-j>'] = cmp.mapping.select_prev_item(),

    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),

    ['<C-p>'] = cmp.mapping.complete(),

    --['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.abort(),
    ['<S-Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }
  },{
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'vsnip' }
  },{
    { name = 'buffer' }
  })
})
-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]-- 

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
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
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})
