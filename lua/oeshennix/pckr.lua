local pckr_path=vim.fn.stdpath("data").."/pckr/pckr.nvim"
if not (vim.uv or vim.loop).fs_stat(pckr_path) then
  vim.fn.system({
    'git', 'clone',
    "--filter=blob:none",
    'https://github.com/lewis6991/pckr.nvim', pckr_path
  })
end
vim.opt.rtp:prepend(pckr_path)
require('pckr').add{
  'lewis6991/pckr.nvim',
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
  'neovim/nvim-lspconfig',
  'nvim-treesitter/nvim-treesitter',

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
  {
    '/home/oeshennix/Documents/git/oeshennix-ONNV-config.nvim',
    requires={
      'oeshennix/ONNV',
      '/home/oeshennix/Documents/git/nvim-ONNV-config.nvim'
    },
    config=function()
      require('nvimonnvconfig').setup({
        --installation_path=require('pckr.config').pack_dir.."/pack/pckr/opt/oeshennix-ONNV-configure.nvim"
        installation_path='/home/oeshennix/Documents/git/nvim-ONNV-config.nvim',
        installation_type='build-with-nix',
      });
      require('oeshennixonnvconfig').setup({
        installation_path='/home/oeshennix/Documents/git/oeshennix-ONNV-config.nvim',
      });
    end
  },
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
