local opts = { noremap = true, silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

keymap("v", "jk", "<ESC>", opts)

-- don't exit visual while reindenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
