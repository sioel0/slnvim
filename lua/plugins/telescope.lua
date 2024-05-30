return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()

      local keymap = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      keymap("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
      keymap("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
      keymap("n", "<leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)

      local tel = require('telescope')
      local actions = require('telescope.actions')

      tel.setup({
        defaults = {
          mappings = {
            i = {
              ["<Esc>"] = actions.close
            },
          },
        },
      })

    end,
  },
}

