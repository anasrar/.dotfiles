local M = {}

M.plugin = {
  "stevearc/aerial.nvim",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_aerial, aerial = safe_require("aerial")

  if not ok_aerial then
    return
  end

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
