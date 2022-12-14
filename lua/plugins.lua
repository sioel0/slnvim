local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim"
  vim.cmd [[packadd packer.nvim]]
end

-- source this file everytime it is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't get errors on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- show packer inside a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function()
  -- packer itself
  use('wbthomason/packer.nvim')

  -- useful plugins normally used as depencies
  use('nvim-lua/plenary.nvim')
  use('kyazdani42/nvim-web-devicons')

  -- startup screen
  use({
    'goolord/alpha-nvim',
    config = function()
      require('plugin_setup.alpha').setup()
    end,
  })

  -- telescope
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  -- lualine
  use({
    'nvim-lualine/lualine.nvim',
    requires = { {'kyazdani42/nvim-web-devicons', opt=true } }
  })

  -- barline
  use({
    'romgrk/barbar.nvim',
    requires = { {'kyazdani42/nvim-web-devicons', opt=true } }
  })

  -- beutify UI elements
  use('stevearc/dressing.nvim')

  -- better escape to exit normal mode using "jk"
  use({
    'max397574/better-escape.nvim',
    config = function() require('better_escape').setup() end
  })

  -- smart split to manage split windows
  use('mrjones2014/smart-splits.nvim')

  -- install some colorschemes
  use('folke/tokyonight.nvim')
  use('EdenEast/nightfox.nvim')
  use('ellisonleao/gruvbox.nvim')
  use('bluz71/vim-nightfly-guicolors')
  use('bluz71/vim-moonfly-colors')
  use('NLKNguyen/papercolor-theme')
  use('arcticicestudio/nord-vim')

  -- coding utilies
  use({
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  })
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('indent_blankline').setup() end
  })
  use({
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  })
  use({
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  })
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use({
    'nacro90/numb.nvim',
    config = function() require('numb').setup() end
  })
  use('windwp/nvim-autopairs')
  use({
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  })

  -- completion plugin
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('saadparwaiz1/cmp_luasnip')
  use('onsails/lspkind.nvim')

  -- snippet plugin
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update{ { with_sync = true } } end,
  })

  -- better marks support
  use('chentoast/marks.nvim')

  -- lsp
  use('neovim/nvim-lspconfig')
  use('ray-x/lsp_signature.nvim')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')

  -- nvim tree
  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function() require('nvim-tree').setup() end
  })

  -- project management
  use({
    'ahmedkhalf/project.nvim',
    config = function() require('project_nvim').setup() end
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
