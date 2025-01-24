-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config=function()
      vim.cmd('colorscheme rose-pine')
    end
  })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'});
  use('nvim-treesitter/playground');
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  use 'neovim/nvim-lspconfig';
  use{'hrsh7th/cmp-nvim-lsp',
    requires={
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',

      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
  };
  use 'mbbill/undotree'

  --Luau stuff
  --[=
  use {
    "lopi-py/luau-lsp.nvim",
    config = function()
      require("luau-lsp").setup {
        plugin = {
          enabled = true,
          port = 3667,
        }
      }
    end,
    requires = {
      "nvim-lua/plenary.nvim"
    },
  }
  --]=]

end);
