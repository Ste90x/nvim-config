local opts = { noremap = true, silent = true }

local km = vim.api.nvim_set_keymap

km("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

km("n", "<leader>q", ":q!<CR>", opts)
km("n", "<C-s>", ":w<CR>", opts)

km("n", "<leader>bl", ":bnext<CR>", opts)
km("n", "<leader>bh", ":bprevious<CR>", opts)
km("n", "<leader>bk", ":bdelete!<CR>", opts)
km("i", "jk", "<ESC>", opts)

km("n", "<C-S-UP>", ":m .-2<CR>", opts)
km("n", "<C-S-DOWN>", ":m .+1<CR>", opts)

km("v", "<C-S-UP>", ":m .-2<CR>==", opts)
km("v", "<C-S-DOWN>", ":m .+1<CR>==", opts)
km("v", "p", '"_dP', opts)

km("x", "<C-S-UP>", ":move '<-2<CR>gv-gv", opts)
km("x", "<C-S-DOWN>", ":move '>+1<CR>gv-gv", opts)

-- Plugins
-- Packer
km("n", "<leader>ps", ":PackerSync<CR>", opts)
km("n", "<leader>pi", ":PackerInstall<CR>", opts)
-- Telescope
km("n", "<leader>ff", ":Telescope find_files<CR>", opts)
km("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
km("n", "<leader>fp", ":Telescope projects<CR>", opts)
km("n", "<leader>fb", ":Telescope buffers<CR>", opts)
km("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
km("n", "<leader>fg", ":Telescope git_status<CR>", opts)
km("n", "<leader>fh", ":Telescope harpoon marks<CR>", opts)
-- NvimTree
km("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- Fold-preview (custom command)
km("n", "<C-p>", ":FoldPreviewToggle<CR>", opts)
-- Harpoon
km("n", "<leader>ht", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
km("n", "<leader>ha", "<CMD>lua require('harpoon.mark').add_file()<CR>", opts)
km("n", "<leader>hn", "<CMD>lua require('harpoon.mark').nav_next()<CR>", opts)
km("n", "<leader>hp", "<CMD>lua require('harpoon.mark').nav_prev()<CR>", opts)

-- Whichkey
local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then return end

wk.register({
  f = {
    name = "Telescope",
    f = { "Find File" },
    w = { "Find Word (Grep)" },
    p = { "Find Projects" },
    b = { "Find Buffers" },
    k = { "Find Keymaps" },
    g = { "Show Git diff" },
    h = { "Show Harpoon Marks" }
  },
  q = { "Quit" },
  h = {
    name = "Harpoon",
    t = { "Toggle Quick Menu" },
    a = { "Add File" },
    n = { "Next File" },
    p = { "Previous File" }
  },
  b = {
    name = "Buffer",
    l = { "Next Buffer" },
    h = { "Previous Buffer" },
    k = { "Delete Buffer" },
  },
  p = {
    name = "Packer",
    s = { "Sync (PackerSync)" },
  }
}, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
})
