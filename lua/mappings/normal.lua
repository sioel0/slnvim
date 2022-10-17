local opts = { noremap = true, silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

-- open a file explorer on the left
keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- insert newlines
keymap("n", "oo", "o<Esc>k", opts)
keymap("n", "OO", "O<Esc>j", opts)

-- resize windows
keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-k>", ":resize +2<CR>", opts)
keymap("n", "<C-h>", ":vertical -2<CR>", opts)
keymap("n", "<C-l>", ":vertical +2<CR>", opts)

-- disable arrow keys
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)

-- paste but kee in yank buffer
keymap("x", "<leader>p", "\"_dP", opts)
