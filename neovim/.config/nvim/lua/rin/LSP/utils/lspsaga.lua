local safe_require = require("rin.utils.safe_require")
local ok_lspsaga, lspsaga = safe_require("lspsaga")

if not ok_lspsaga then
  return
end

lspsaga.setup({
  preview = {
    lines_above = 0,
    lines_below = 10,
  },
  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-d>",
  },
  request_timeout = 2000,

  finder = {
    edit = { "o", "<CR>" },
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = { "q", "<ESC>" },
  },

  definition = {
    edit = "<C-c>o",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
    close = "<Esc>",
  },

  code_action = {
    num_shortcut = true,
    keys = {
      -- string |table type
      quit = "q",
      exec = "<CR>",
    },
  },

  lightbulb = {
    enable = false,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },

  diagnostic = {
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g"
    },
  },

  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
    whole_project = false,
  },

  outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = "o",
      expand_collapse = "u",
      quit = "q",
    },
  },

  callhierarchy = {
    show_detail = false,
    keys = {
      edit = "e",
      vsplit = "s",
      split = "i",
      tabe = "t",
      jump = "o",
      quit = "q",
      expand_collapse = "u",
    },
  },

  symbol_in_winbar = {
    enable = false,
    separator = " ",
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },

  ui = {
    -- currently only round theme
    theme = "round",
    -- this option only work in neovim 0.9
    title = true,
    -- border type can be single,double,rounded,solid,shadow.
    border = "rounded",
    winblend = 0,
    expand = "",
    collapse = "",
    preview = " ",
    code_action = "💡",
    diagnostic = "🐞",
    incoming = " ",
    outgoing = " ",
    colors = {
      --float window normal background color
      normal_bg = "#1a1b26",
      --title background color
      title_bg = "#16161e",
      red = "#f7768e",
      magenta = "#bb9af7",
      orange = "#ff9e64",
      yellow = "#e0af68",
      green = "#9ece6a",
      cyan = "#7dcfff",
      blue = "#7aa2f7",
      purple = "#9d7cd8",
      white = "#a9b1d6",
      black = "#15161e",
    },
    kind = {},
  },
})
