local M = {}

M.setup = function()
  vim.cmd(string.rep("tab split", 1, "|") .. "|tabfirst")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
