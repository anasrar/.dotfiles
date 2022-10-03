-- # Line

vim.cmd('set relativenumber')
vim.cmd('set number')
vim.cmd('set nowrap')

vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  lead = '·',
  trail = '·',
  eol = '↵',
}

-- # Line manipulation

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- # Move Line

map('n', '<A-k>', ':move -2<CR>', opts)
map('n', '<A-j>', ':move +1<CR>', opts)

-- # Duplicate Line

map('n', '<A-K>', ':copy .<CR>:move -2<CR>', opts)
map('n', '<A-J>', ':copy .<CR>', opts)
