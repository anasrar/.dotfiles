--[=[
# DEPENDENCY
- [ripgrep](github.com/BurntSushi/ripgrep) for live_grep
--]=]

require('telescope').setup({
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
})
require('telescope').load_extension('fzy_native')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
