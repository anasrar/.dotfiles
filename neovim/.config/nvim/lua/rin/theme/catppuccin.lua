local M = {}

M.plugin = {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_catppuccin, catppuccin = safe_require("catppuccin")

  if not ok_catppuccin then
    return
  end

  catppuccin.setup({})

  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  vim.cmd("colorscheme catppuccin")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
