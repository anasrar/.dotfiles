local M = {}

M.plugin = {
  "rebelot/kanagawa.nvim",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  vim.cmd("colorscheme kanagawa")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
