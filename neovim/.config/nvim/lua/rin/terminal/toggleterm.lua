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
  local safe_require = require("rin.utils.safe_require")
  local ok_toggleterm, toggleterm = safe_require("toggleterm")

  if not ok_toggleterm then
    return
  end

  toggleterm.setup({
    direction = "float",
    close_on_exit = true,
    float_opts = {
      border = "curved",
    },
  })

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<A-t>", ":ToggleTerm direction=float<CR>", opts)
  map("t", "<A-t>", "<C-\\><C-n> :ToggleTerm<CR>", opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
