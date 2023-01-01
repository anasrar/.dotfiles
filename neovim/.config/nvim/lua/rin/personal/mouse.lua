local M = {}

M.setup = function()
  vim.cmd("set mouse=")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
