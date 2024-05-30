local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- insert newlines
keymap("n", "oo", "o<Esc>k", opts)



