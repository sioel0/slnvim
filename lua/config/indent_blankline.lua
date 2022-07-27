local status_ok, il = pcall(require, "indent_blankline")
if not status_ok then
    return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

il.setup({
  show_end_of_line = true,
  show_char_blankline = " ",
})
