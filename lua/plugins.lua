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

  -- better escape to exit normal mode using "jk"
  use({
    'max397574/better-escape.nvim',
    config = function() require('better_escape').setup() end
  })

  -- install some colorschemes
  use('folke/tokyonight.nvim')
  use('EdenEast/nightfox.nvim')
  use('ellisonleao/gruvbox.nvim')
  use('bluz71/vim-nightfly-guicolors')
  use('bluz71/vim-moonfly-colors')
  use('NLKNguyen/papercolor-theme')
  use('arcticicestudio/nord-vim')

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
