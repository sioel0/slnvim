-- add mappings settings
require("mappings")
require("settings.options")

local fn = vim.fn

-- automatically install lazy plugin manager
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- adding colorscheme at the end to make lazy.nvim load it
require("settings.colorscheme")

