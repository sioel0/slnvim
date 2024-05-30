local on_attach = function(bufrn)
  vim.keymap.set("n", "{", "<Cmd>AerialPrev<CR>", { buffer = bufrn })
  vim.keymap.set("n", "}", "<Cmd>AerialNext<CR>", { buffer = bufrn })
end

return {
  'stevearc/aerial.nvim',
  config = function()
    require('aerial').setup({
      on_attach = on_attach
    })
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- toggle aerial
    keymap("n", "<leader>a", "<Cmd>AerialToggle!<CR>", opts)

  end
}
