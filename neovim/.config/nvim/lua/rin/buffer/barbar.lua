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
    closable = false,
    tabpages = false,
  })

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<A-,>", ":BufferPrevious<CR>", opts)
  map("n", "<A-.>", ":BufferNext<CR>", opts)
  map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
  map("n", "<A->>", ":BufferMoveNext<CR>", opts)
  map("n", "<A-w>", ":BufferClose<CR>", opts)
  map("n", "<A-W>", ":BufferClose!<CR>", opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
