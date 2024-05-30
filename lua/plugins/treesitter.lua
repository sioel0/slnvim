return {
  { 'JoosepAlviste/nvim-ts-context-commentstring' },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "bash", "c", "cmake", "cpp", "java", "python", "markdown", "lua", "rust", "tmux" },
        sync_install = false,
        ignore_install = { "" },
        auto_install = true,
        highlight = ({
          enable = true,
          additional_vim_regex_highlighting = false
        }),
        indent = ({
          enable = true,
          disable = { "yaml" }
        }),
      })
    end,
  }
}
