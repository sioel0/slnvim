local splits = require('smart-splits')

splits.setup({
  ignored_filetypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  ignored_buftypes = {},
  default_amount = 1,
  move_cursor_same_row = false,
  resize_mode = {
    quit_key = '<Esc>',
    resize_key = { 'h', 'j', 'k', 'l' },
    silent = true,
    hooks = {
      on_enter = function() vim.notify('Entering resize mode') end,
      on_leave = function() vim.notify('Leaving resize mode') end,
    },
  },
  ignored_events = {
    'BufEnter',
    'WinEnter',
  },

  tmux_integration = true,
})
-- setup keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-w>r", "<cmd>lua require('smart-splits').start_resize_mode()<CR>", opts)
