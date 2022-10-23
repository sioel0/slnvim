local opts = { noremap = true, silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

keymap("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("i", "<Tab>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

-- setup LuaSnip with vscode-like snippets from friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()
