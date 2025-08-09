
local succ,ONNV=pcall(require,"ONNV")
if(not succ)then
  return;
end
local config=ONNV.getConfig();

local lspconfig=require('lspconfig');
require("mason").setup();

if(config.startup)then
  for c,v in ipairs(config.startup)do
    local options;
    if not(config[v])then
      options={};
    else
      options=config[v].options;
    end
    lspconfig[v].setup(options);
  end;
end

local cmp = require'cmp'

cmp.setup({
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
  }, {
    { name = 'nvim_lsp_signature_help' }
  }, {
    { name = 'path' },
    { name = 'buffer' },
    { name = 'vsnip' }
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
--]]
