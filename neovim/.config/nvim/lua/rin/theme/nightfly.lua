local M = {}

M.plugin = {
  "bluz71/vim-nightfly-guicolors",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  vim.o.termguicolors = true
  vim.cmd("colorscheme nightfly")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
