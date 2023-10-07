local safe_require = require("rin.utils.safe_require")
local ok_lspsaga, lspsaga = safe_require("lspsaga")

if not ok_lspsaga then
  return
end

lspsaga.setup({
  finder = {
    max_height = 0.5,
    left_width = 0.3,
    right_width = 0.3,
    default = "ref+imp",
    layout = "float",
    keys = {
      shuttle = "[w",
      toggle_or_open = "o",
      vsplit = "s",
      split = "i",
      tabe = "t",
      tabnew = "r",
      quit = { "q", "<ESC>" },
      close = "<C-c>k",
    },
  },

  definition = {
    keys = {
      edit = "<C-c>o",
      vsplit = "<C-c>v",
      split = "<C-c>i",
      tabe = "<C-c>t",
      quit = "q",
      close = "<ESC>",
    },
  },

  code_action = {
    num_shortcut = true,
    show_server_name = true,
    extend_gitsigns = false,
    keys = {
      -- string |table type
      quit = "q",
      exec = "<CR>",
    },
  },

  lightbulb = {
    enable = false,
  },

  diagnostic = {
    show_code_action = true,
    jump_num_shortcut = true,
    keys = {
      exec_action = "o",
      quit = "q",
      toggle_or_jump = "<CR>",
      quit_in_show = { "q", "<ESC>" }
    },
  },

  rename = {
    in_select = true,
    auto_save = false,
    project_max_width = 0.5,
    project_max_height = 0.5,
    keys = {
      quit = "<ESC>",
      exec = "<CR>",
      select = "x",
    },
  },

  outline = {
    win_position = "right",
    win_width = 30,
    auto_preview = false,
    detail = true,
    auto_close = true,
    close_after_jump = true,
    layout = "normal",
    max_height = 0.5,
    left_width = 0.3,
    keys = {
      toggle_or_jump = "o",
      quit = { "q", "<ESC>" },
      jump = "e",
    },
  },

  callhierarchy = {
    keys = {
      edit = "e",
      vsplit = "s",
      split = "i",
      tabe = "t",
      quit = "q",
      shuttle = "[w",
      toggle_or_req = "u",
      close = "<C-c>k",
    },
  },

  symbol_in_winbar = {
    enable = false,
    separator = " ",
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    color_mode = true,
  },

  ui = {
    title = true,
    border = "rounded",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    actionfix = ' ',
    imp_sign = '󰳛 ',
    kind = nil,
  },
})
