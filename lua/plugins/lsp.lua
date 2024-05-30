return {
  { 
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
      local keymap = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      keymap("n", "<leader>m", ":Mason<CR>", opts)
    end,
  },
  { 
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'ansiblels', 'bashls', 'clangd', 'cmake', 'texlab', 'lua_ls', 'pyright', 'rust_analyzer', 'taplo' },
        automatic_installation = true,
      })
    end,
  },
  { 'neovim/nvim-lspconfig' },
}
