return {
  { 
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local lspkind = require('lspkind')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<Esc>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
        formatting = ({
          fields = {  "menu", "abbr", "kind" },
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
            ellipsis_char = '...',
            before = function(entry, vim_item)
              -- Kind icons
              vim_item.menu = ({
                nvim_lsp = "",
                buffer = "",
                path = "",
                luasnip = "",
              })[entry.source.name]
              return vim_item
            end,
          }),
        }),
        confirm_opts = ({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        window = ({
          documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          },
        }),
        experimental = ({
          ghost_text = true,
          native_menu = false,
        }),
      })
    end
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'onsails/lspkind.nvim' },
  { 
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      local opts = { noremap = true, silent = true }

      -- shorten keymap function name
      local keymap = vim.api.nvim_set_keymap

      keymap("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
      keymap("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

      -- setup LuaSnip with vscode-like snippets from friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  },
  { 'rafamadriz/friendly-snippets' },
}
