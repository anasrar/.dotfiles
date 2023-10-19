local M = {}

M.plugin = {
  "stevearc/aerial.nvim",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "aerial",
  })
  if not ok then
    return
  end

  local aerial = require("aerial")
  aerial.setup({
    close_on_select = true,
    float = {
      relative = "editor",
    },
  })

  -- # Keymap
  local keymap = require("rin.utils.keymap").keymap

  keymap("n", "<Leader>o", ":AerialToggle float<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
