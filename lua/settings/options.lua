local options = {
  backup = false,                           -- creates backup file
  clipboard = "unnamedplus",                -- gives access to system clipboard
  cmdheight = 1,                            -- command line size
  completeopt = { "menuone", "noselect" },  -- just for cmp
  conceallevel = 0,                         -- make `` visible in md files
  fileencoding = "utf-8",                   -- file encoding
  hlsearch = false,                         -- highlight matches from search pattern
  incsearch = true,                         -- show incrementally if pattern matches a string
  ignorecase = true,                        -- ignore case in search patterns
  mouse = "a",                              -- enable mouse support
  pumheight = 10,                           -- popup menu height
  showmode = false,                         -- hide --INSERT-- etc.
  smartcase = true,                         -- smart case
  smartindent = true,                       -- make indentation smart
  splitbelow = true,                        -- horizontal split goes below
  splitright = true,                        -- vertical split goes right
  swapfile = false,                         -- creates a swap file
  termguicolors = true,                     -- set termguicolors
  timeoutlen = 500,                         -- time to wait to read a mapping
  undofile = true,                          -- enable persistent undo
  updatetime = 300,                         -- faster completion
  expandtab = true,                         -- convert tab to spaces
  shiftwidth = 2,                           -- number of spaces for eache indentation
  tabstop = 2,                              -- inser spaces for tab
  cursorline = true,                        -- highlight current line
  number = true,                            -- show line number
  relativenumber = true,                    -- show relative number
  numberwidth = 4,                          -- space for numbers
  signcolumn = "yes",                       -- show the sign column
  wrap = true,                              -- wrap long lines
  scrolloff = 14,                           -- leave 14 lines at the bottom when scrolling down
  sidescrolloff = 14,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
