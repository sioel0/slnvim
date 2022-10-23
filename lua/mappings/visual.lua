local opts = { noremap = true, silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- don't exit visual while reindenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
