require('config.colorscheme')      -- setup nvim colorscheme
require('config.cmp')              -- setup cmp for completions
require('config.gitsigns')         -- gitsigns setup
require('config.indent_blankline') -- setup indent_blankline plugin
require('config.key')              -- shortcuts configuration
require('config.lualine')          -- statusline setup
require('config.telescope')        -- telescope plugin
require('config.treesitter')       -- treesitter plugin
require('defaults')                -- default options
require('plugins')                 -- plugin confgiuration using packer

-- start lualine
require('lualine').setup()
