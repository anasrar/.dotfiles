local M = {}

M.plugin = {
  "romgrk/barbar.nvim",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "bufferline",
  })
  if not ok then
    return
  end

  local barbar = require("bufferline") -- < why has the same name to bufferline ?

  barbar.setup({
    animation = false,
    auto_hide = false,
    tabpages = false,
    icons = {
      button = '󰖭',
    },
  })

  local keymap = require("rin.utils.keymap").keymap

  keymap("n", "<A-,>", ":BufferPrevious<CR>")
  keymap("n", "<A-.>", ":BufferNext<CR>")
  keymap("n", "<A-<>", ":BufferMovePrevious<CR>")
  keymap("n", "<A->>", ":BufferMoveNext<CR>")
  keymap("n", "<A-w>", ":BufferClose<CR>")
  keymap("n", "<A-W>", ":BufferClose!<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
