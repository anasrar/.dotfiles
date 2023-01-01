local M = {}

M.setup = function(args)
  vim.cmd("set tabstop=2")
  vim.cmd("set softtabstop=2")
  vim.cmd("set shiftwidth=2")
  vim.cmd("set expandtab")
  vim.cmd("set autoindent")
  vim.cmd("set copyindent")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
