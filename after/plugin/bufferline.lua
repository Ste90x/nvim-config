local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    separator_style = "slant",
    diagnostics = 'nvim_lsp',
  },
}
