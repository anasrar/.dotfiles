local M = {}

M.plugin = {
  "akinsho/bufferline.nvim",
  tag = "v2.1.0",
  dependencies = {
    "kyazdani42/nvim-web-devicons"
  },
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_bufferline, bufferline = safe_require("bufferline")

  if not ok_bufferline then
    return
  end

  vim.opt.termguicolors = true

  bufferline.setup({
    options = {
      mode = "buffers",
      numbers = "none",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator = {
        icon = "▎",
        style = "icon",
      },
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true, -- whether or not tab names should be truncated
      tab_size = 18,
      diagnostics = false,
      diagnostics_update_in_insert = false,
      color_icons = true, -- whether or not to add the filetype icon highlights
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = false,
      show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
      show_close_icon = false,
      show_tab_indicators = false,
      show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { "|", "|" }
      separator_style = "thick",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      hover = {
        enabled = false,
        delay = 200,
        reveal = {
          "close",
        },
      },
      sort_by = "insert_at_end",
    },
  })

  local keymap = require("rin.utils.keymap").keymap

  keymap("n", "<A-,>", ":BufferLineCyclePrev<CR>")
  keymap("n", "<A-.>", ":BufferLineCycleNext<CR>")
  keymap("n", "<A-<>", ":BufferLineMovePrev<CR>")
  keymap("n", "<A->>", ":BufferLineMoveNext<CR>")
  keymap("n", "<A-w>", ":bdelete<CR>")
  keymap("n", "<A-W>", ":bdelete!<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
