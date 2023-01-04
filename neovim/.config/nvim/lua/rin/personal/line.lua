local M = {}

M.setup = function()
  -- # Line

  vim.cmd("set relativenumber")
  vim.cmd("set number")
  vim.cmd("set nowrap")

  vim.opt.list = true
  vim.opt.listchars = {
    tab = "→ ",
    lead = "·",
    trail = "·",
    eol = "↵",
  }

  -- # Line manipulation

  local keymap = require("rin.utils.keymap").keymap

  -- # Move Line

  keymap("n", "<A-k>", ":move -2<CR>")
  keymap("n", "<A-j>", ":move +1<CR>")

  -- # Duplicate Line

  keymap("n", "<A-K>", ":copy .<CR>:move -2<CR>")
  keymap("n", "<A-J>", ":copy .<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
