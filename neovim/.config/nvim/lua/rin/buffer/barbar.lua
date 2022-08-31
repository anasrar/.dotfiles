require('bufferline').setup({
  animation = false,
  auto_hide = false,
  closable = false,
  tabpages = false,
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ':BufferMoveNext<CR>', opts)
map('n', '<A-w>', ':BufferClose<CR>', opts)
map('n', '<A-W>', ':BufferClose!<CR>', opts)
