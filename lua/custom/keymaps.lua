local opts = { noremap = true, silent = true }

local km = vim.api.nvim_set_keymap

km("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--      normal mode = "n"
--      insert mode = "i"
--      visual mode = "v"
--      visual block mode = "x"
--      term mode = "t"
--      command mode = "c"
--      all modes = "a"

km("n", "<leader>q", ":q!<CR>", opts)
km("n", "<C-s>", ":w<CR>", opts)

km("n", "<leader>bl", ":bnext<CR>", opts)
km("n", "<leader>bh", ":bprevious<CR>", opts)
km("n", "<leader>bk", ":bdelete!<CR>", opts)
km("i", "jk", "<ESC>", opts)

km("n", "<C-S-j>", ":m .+1<CR>", opts)
km("n", "<C-S-k>", ":m .-2<CR>", opts)

km("v", "<C-S-j>", ":m .+1<CR>==", opts)
km("v", "<C-S-k>", ":m .-2<CR>==", opts)
km("v", "p", '"_dP', opts)

-- km("x", "J", ":move '>+1<CR>gv-gv", opts)
-- km("x", "K", ":move '<-2<CR>gv-gv", opts)
km("x", "<C-S-j>", ":move '>+1<CR>gv-gv", opts)
km("x", "<C-S-k>", ":move '<-2<CR>gv-gv", opts)

-- Plugins
-- Packer
km("n", "<leader>ps", ":PackerSync<CR>", opts)
-- Telescope
km("n", "<leader>ff", ":Telescope find_files<CR>", opts)
km("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
km("n", "<leader>fp", ":Telescope projects<CR>", opts)
km("n", "<leader>fb", ":Telescope buffers<CR>", opts)
km("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
-- NvimTree
km("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Terminal

-- Whichkey
local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then return end

wk.register({
  f = {
    name = "Telescope",
    f = { "Find File" },
    g = { "Live Grep" },
    p = { "Projects" },
    b = { "Buffers" },
    k = { "Keymaps" },
  },
  F = { "Find String (grep)" },
  q = { "Quit" },
  h = { "Remove Highlight" },
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
