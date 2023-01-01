--[=[
# DEPENDENCY
- [ripgrep](github.com/BurntSushi/ripgrep) for live_grep
--]=]

local M = {}

M.plugin = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
  },
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_telescope, telescope = safe_require("telescope")

  if not ok_telescope then
    return
  end

  telescope.setup({
    defaults = {
      prompt_prefix = " 什",
      selection_caret = " ",
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  })
  telescope.load_extension("fzy_native")

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
  map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
