local pckr_path=vim.fn.stdpath("data").."/pckr/pckr.nvim"
if not (vim.uv or vim.loop).fs_stat(pckr_path) then
  vim.fn.system({
    'git',
    'clone',
    "--filter=blob:none",
    'https://github.com/lewis6991/pckr.nvim',
    pckr_path
  })
end
vim.opt.rtp:prepend(pckr_path)

require('pckr').add{
  'wbthomason/packer.nvim',
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { 'nvim-lua/plenary.nvim' }
  },
  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config=function()
      vim.cmd('colorscheme rose-pine-dawn')
    end
  },

  'tpope/vim-fugitive',
  { 
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { "nvim-lua/plenary.nvim" }
  },
  'hrsh7th/cmp-nvim-lsp-signature-help',
  {'hrsh7th/nvim-cmp',
    requires={
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',

      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
  },
  "williamboman/mason.nvim",
  'mbbill/undotree',
  'oeshennix/ONNV',
  --Luau stuff
  --[=[
  {
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
  },
  --]=]
}
