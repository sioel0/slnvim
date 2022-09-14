vim.g.vimtex_view_method = 'zathura'

-- setup shortcuts
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent =true }

keymap("n", "<Leader>v", "<Cmd>VimtexCompile<CR>", opts)
