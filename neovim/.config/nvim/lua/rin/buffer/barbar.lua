local M = {}

M.plugin = {
  "romgrk/barbar.nvim",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_barbar, barbar = safe_require("bufferline") -- < why has the same name to bufferline ?

  if not ok_barbar then
    return
  end

  barbar.setup({
    animation = false,
    auto_hide = false,
    tabpages = false,
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
