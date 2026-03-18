local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {

    {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      'rose-pine/neovim',
      as = 'rose-pine',
      config=function()
        vim.cmd('colorscheme rose-pine-dawn')
      end
    },
    'neovim/nvim-lspconfig',
    {
      'nvim-treesitter/nvim-treesitter',
      lazy=false,
      build=':TSUpdate'
    },
    'tpope/vim-fugitive',
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    'hrsh7th/cmp-nvim-lsp-signature-help',
    {'hrsh7th/nvim-cmp',
      dependencies={
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
      url='/home/oeshennix/Documents/git/nvim-ONNV-config.nvim',
      dependencies={
        'oeshennix/ONNV',
      },
      config=function()
        vim.print(require('lazy.core.config').options.root);
        require('nvimonnvconfig').setup({
          installation_path=require('lazy.core.config').options.root.."/nvim-ONNV-config.nvim",
        });
      end
    },
    {
      url='/home/oeshennix/Documents/git/oeshennix-ONNV-config.nvim',
      dependencies={
        'oeshennix/ONNV',
        'oeshennix/nvim-ONNV-config.nvim'
      },
      config=function()
        require('nvimonnvconfig').setup({
          installation_path=require('lazy.core.config').options.root.."/oeshennix-ONNV-config.nvim",
        });
      end
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true }
})
