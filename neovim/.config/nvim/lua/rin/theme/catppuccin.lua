local M = {}

M.plugin = {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "catppuccin",
  })
  if not ok then
    return
  end

  local catppuccin = require("catppuccin")

  catppuccin.setup({})

  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  vim.cmd("colorscheme catppuccin")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
