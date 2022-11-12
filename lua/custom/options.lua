vim.cmd("autocmd!")

vim.wo.number = true
vim.scriptencoding = 'utf-8'

local vo = vim.opt

vo.smartcase = true
vo.ignorecase = true
vo.number = true
vo.relativenumber = true
vo.mouse = "a"
vo.encoding = 'utf-8'
vo.fileencoding = 'utf-8'
vo.title = true
vo.autoindent = true
vo.smartindent = true
vo.hlsearch = true
vo.backup = false
vo.showcmd = true
vo.cmdheight = 1
vo.laststatus = 2
vo.expandtab = true
vo.scrolloff = 10
vo.shell = 'fish'
vo.backupskip = { '/tmp/*', '/private/tmp/*' }
vo.inccommand = 'split'
vo.smarttab = true
vo.breakindent = true
vo.shiftwidth = 2
vo.tabstop = 2
vo.wrap = false -- No Wrap lines
vo.path:append { '**' } -- Finding files - Search down into subfolders
vo.wildignore:append { '*/node_modules/*' }

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vo.formatoptions:append { 'r' }

vo.list = true
--[[ vo.listchars:append "space:⋅" ]]
