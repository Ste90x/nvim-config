local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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

km("n", "<leader>e", ":Lex 30<CR>", opts)
km("n", "<leader>h", ":noh<CR>", opts)
km("n", "<leader>bl", ":bnext<CR>", opts)
km("n", "<leader>bh", ":bprevious<CR>", opts)
km("n", "<leader>bk", ":bdelete<CR>", opts)
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

-- plugins
km("n", "<leader>ps", ":PackerSync<CR>", opts)
km("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
km("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
