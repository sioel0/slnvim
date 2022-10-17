local opts = { noremap = true, silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- disable esc and arrow keys
keymap("i", "<Esc>", "<Nop>", opts)
keymap("i", "<Left>", "<Nop>", opts)
keymap("i", "<Right>", "<Nop>", opts)
keymap("i", "<Up>", "<Nop>", opts)
keymap("i", "<Down>", "<Nop>", opts)
