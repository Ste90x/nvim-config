vim.cmd [[
  augroup autosave_folds
    autocmd BufWrite * mkview
    autocmd BufRead * silent! loadview
  augroup end
]]

-- Custom commands
-- fold-preview
vim.api.nvim_create_user_command("FoldPreviewToggle", require("fold-preview").toggle_preview, { bang = true })
