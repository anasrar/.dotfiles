local M = {}

M.plugin = {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local treesitter = require("nvim-treesitter")

  treesitter.setup({
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
