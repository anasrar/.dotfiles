local M = {}

M.plugin = {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_gitsigns, gitsigns = safe_require("gitsigns")

  if not ok_gitsigns then
    return
  end

  gitsigns.setup({
    signs                        = {
      add          = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change       = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete       = { hl = "GitSignsDelete", text = "▍", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete    = { hl = "GitSignsDelete", text = "▍", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      untracked    = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddLn", linehl = "GitSignsAddLn" },
    },
    signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
      interval = 1000,
      follow_files = true
    },
    attach_to_untracked          = true,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
      virt_text = true,
      virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil, -- Use default
    max_file_length              = 40000,
    preview_config               = {
      -- Options passed to nvim_open_win
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1
    },
    yadm                         = {
      enable = false
    },
    on_attach                    = function(bufnr)
      local gs = package.loaded.gitsigns

      local buf_keymap = require("rin.utils.keymap").buf_keymap

      buf_keymap(bufnr, "n", "<leader>g]", ":Gitsigns next_hunk<CR>")
      buf_keymap(bufnr, "n", "<leader>g[", ":Gitsigns prev_hunk<CR>")
      buf_keymap(bufnr, "n", "<leader>gd", gs.diffthis)
      buf_keymap(bufnr, "n", "<leader>gp", gs.preview_hunk)
      buf_keymap(bufnr, "n", "<leader>gb", function() gs.blame_line({ full = true }) end)
      buf_keymap(bufnr, "n", "<leader>gtb", gs.toggle_current_line_blame)
      buf_keymap(bufnr, "n", "<leader>gtd", gs.toggle_deleted)
    end
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
