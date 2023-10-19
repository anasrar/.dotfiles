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
  local ok = require("rin.utils.check_requires").check({
    "telescope",
  })
  if not ok then
    return
  end

  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      prompt_prefix = " 󱡴 ",
      selection_caret = "󰁔 ",
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  })
  telescope.load_extension("fzy_native")

  local keymap = require("rin.utils.keymap").keymap

  keymap("n", "<leader>ff", ":Telescope find_files<CR>")
  keymap("n", "<leader>fg", ":Telescope live_grep<CR>")
  keymap("n", "<leader>fc", ":Telescope current_buffer_fuzzy_find<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
