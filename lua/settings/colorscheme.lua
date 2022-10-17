-- setup colorscheme with fallback if plugin doesn't work
vim.cmd [[
  try
    colorscheme nord
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]]
