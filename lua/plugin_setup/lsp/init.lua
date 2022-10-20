local mason = require('mason')
local mason_installer = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local handlers = require('plugin_setup.lsp.handlers')

local servers = { "ansiblels", "clangd", "cmake", "dockerls", "jdtls", "ltex", "sumneko_lua", "marksman", "pyright", "rust_analyzer" }

mason.setup()
mason_installer.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end
require('plugin_setup.lsp.signature')

-- add keymap to start mason
local kopts = { noremap = true, silent = true }

-- shorten keymap function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>m", ":Mason<CR>", kopts)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", kopts)
