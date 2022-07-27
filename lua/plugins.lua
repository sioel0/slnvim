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

-- use packer inside a popup window
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

  -- useful plugins used as depencies
  use('nvim-lua/plenary.nvim')

  -- colorscheme plugins
  use('folke/tokyonight.nvim')
  use('EdenEast/nightfox.nvim')
  use('ellisonleao/gruvbox.nvim')
  use('bluz71/vim-nightfly-guicolors')
  use('bluz71/vim-moonfly-colors')

  -- statrup screen
  use({
    'goolord/alpha-nvim',
    config = function()
      require('config.alpha').setup()
    end,
  })

  -- cmp plugin
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')

  -- luasnip for snippets
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  -- telescope
  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  })

  -- lualine
  use({
    'nvim-lualine/lualine.nvim',
    requires = { { 'kyazdani42/nvim-web-devicons', opt=true } }
  })

  -- coding utilities
  use('ap/vim-css-color')
  use({
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('indent_blankline').setup() end
  })
  use({
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  })

  -- treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
