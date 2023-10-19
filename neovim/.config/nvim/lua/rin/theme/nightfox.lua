local M = {}

M.plugin = {
  "EdenEast/nightfox.nvim",
  branch = "main",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "nightfox",
  })
  if not ok then
    return
  end

  local nightfox = require("nightfox")

  nightfox.setup({
    options = {
      transparent = true,
      terminal_colors = true,
      styles = {
        commnets = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
    }
  })

  vim.cmd("colorscheme nightfox")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
