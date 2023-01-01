local M = {}

M.plugin = {
  "EdenEast/nightfox.nvim",
  branch = "main",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_nightfox, nightfox = safe_require("nightfox")

  if not ok_nightfox then
    return
  end

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
