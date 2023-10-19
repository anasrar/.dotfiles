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
    backends = { "lsp", "treesitter", "markdown", "man" },
    close_on_select = true,
    layout = {
      min_width = 60,
    },
    float = {
      relative = "editor",
      min_width = { 0.2, 20 },
      min_height = { 10, 0.1 },
    },
    filter_kind = false,
  })

  -- # Keymap
  local keymap = require("rin.utils.keymap").keymap

  keymap("n", "<Leader>o", ":AerialToggle float<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
