local M = {}

M.plugin = {
  "j-morano/buffer_manager.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "buffer_manager",
  })
  if not ok then
    return
  end

  local buffer = require("buffer_manager")
  local buffer_ui = require("buffer_manager.ui")

  buffer.setup({})

  local keymap = require("rin.utils.keymap").keymap

  keymap("n", "<Leader>qq", buffer_ui.toggle_quick_menu)
  keymap("n", "<A-,>", buffer_ui.nav_next)
  keymap("n", "<A-.>", buffer_ui.nav_prev)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
