-- # Line

vim.cmd('set relativenumber')
vim.cmd('set number')

vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  space = '·'
}

-- # Line manipulation

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- # Move Line

map('n', '<A-up>', ':move -2<CR>', opts)
map('n', '<A-down>', ':move +1<CR>', opts)

-- # Duplicate Line

map('n', '<A-S-up>', ':copy .<CR>:move -2<CR>', opts)
map('n', '<A-S-down>', ':copy .<CR>', opts)
