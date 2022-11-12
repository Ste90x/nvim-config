local status, ibl = pcall(require, "indent-blankline")
if not status then
  return
end

vim.opt.list = true

ibl.setup({
  show_end_of_line = true,
  space_char_blankline = " ",
})
