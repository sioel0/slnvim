local project = require('project_nvim')

project.setup({
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git", "Makefile", "package.json", "Cargo.toml" },
  show_hidden = true,
  silent_chdir = true,
  scope_chdir = 'global',
  datapath = vim.fn.stdpath("data"),
})
