local M = {}

M.plugin = {
  "cocopon/iceberg.vim",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  vim.o.termguicolors = true
  vim.cmd("colorscheme iceberg")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
