require('toggleterm').setup({
  direction = 'float',
  close_on_exit = true,
  float_opts = {
    border = 'curved',
  },
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-t>', ':ToggleTerm direction=float<CR>', opts)
map('t', '<A-t>', '<C-\\><C-n> :ToggleTerm<CR>', opts)
