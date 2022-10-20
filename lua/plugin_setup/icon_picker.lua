local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>i", "<cmd>IconPickerNormal emoji nerd_font alt_font symbols<CR>", opts)
keymap("n", "<leader>y", "<cmd>IconPickerYank emoji nerd_font alt_font symbols<CR>", opts)
keymap("i", "<C-i>", "<cmd>IconPickerInsert emoji nerd_font alt_font symbols<CR>", opts)
