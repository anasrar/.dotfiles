local M = {}

M.plugin = {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "nvim-treesitter",
  })
  if not ok then
    return
  end

  local treesitter_configs = require("nvim-treesitter.configs")

  treesitter_configs.setup({
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
