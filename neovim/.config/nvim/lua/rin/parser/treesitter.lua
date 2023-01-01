local M = {}

M.plugin = {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_treesitter_configs, treesitter_configs = safe_require("nvim-treesitter.configs")

  if not ok_treesitter_configs then
    return
  end

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
