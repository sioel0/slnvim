local opts = { noremap = true, silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- add modes keybindings
require('mappings.visual')
require('mappings.insert')
require('mappings.normal')
