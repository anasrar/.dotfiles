local M = {}

M.plugin = {
  "akinsho/toggleterm.nvim",
  branch = "main",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "toggleterm",
  })
  if not ok then
    return
  end

  local toggleterm = require("toggleterm")

  toggleterm.setup({
    direction = "float",
    close_on_exit = true,
    float_opts = {
      border = "curved",
    },
  })

  local keymap = require("rin.utils.keymap").keymap

  keymap("n", "<A-t>", ":ToggleTerm direction=float<CR>")
  keymap("t", "<A-t>", "<C-\\><C-n> :ToggleTerm<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
