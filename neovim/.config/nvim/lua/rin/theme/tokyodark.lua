local M = {}

M.plugin = {
  "tiagovla/tokyodark.nvim",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  vim.o.termguicolors = true

  vim.g.tokyodark_transparent_background = true
  vim.g.tokyodark_enable_italic_comment = true
  vim.g.tokyodark_enable_italic = true
  vim.g.tokyodark_color_gamma = "1.0"

  vim.cmd("colorscheme tokyodark")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
