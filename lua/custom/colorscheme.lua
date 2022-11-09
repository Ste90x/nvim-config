local colorscheme_ok, _ = pcall(require, "catppuccin")
if not colorscheme_ok then
    print("colorscheme not available!")
    return
end

vim.cmd.colorscheme "catppuccin-mocha"
