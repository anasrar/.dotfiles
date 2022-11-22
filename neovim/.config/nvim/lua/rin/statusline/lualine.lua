local setup_winbar = {
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = {
          left = '',
          right = '',
        },
      },
    },
    lualine_b = {
      {
        'branch',
        separator = {
          right = '',
        },
      },
    },
    lualine_c = {
      {
        'lsp_progress',
        display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
        timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
        spinner_symbols = { '⠟', '⠯', '⠷', '⠾', '⠽', '⠻' },
        message = { commenced = 'In Progress', completed = 'Completed' },
        max_message_length = 30,
      },
    },
    lualine_x = {
      {
        require('rin.personal.tab').statusline,
        padding = 0,
      },
    },
    lualine_y = {
    },
    lualine_z = {
    },
  },
  winbar = {
    lualine_a = {
    },
    lualine_b = {
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = ' 洛',
          readonly = ' ',
          unnamed = 'NO NAME',
        },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        always_visible = false,
        separator = '',
      },
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
        separator = '',
      },
      {
        'filetype',
      },
    },
    lualine_y = {
    },
    lualine_z = {
    },
  },
  inactive_winbar = {
    lualine_a = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = ' 洛',
          readonly = ' ',
          unnamed = 'NO NAME',
        },
      },
    },
    lualine_b = {
    },
    lualine_c = {
    },
    lualine_x = {
    },
    lualine_y = {
    },
    lualine_z = {
      {
        'diagnostics',
        always_visible = false,
        separator = '',
      },
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
        separator = '',
      },
      {
        'filetype',
      },
    },
  }
}

require('lualine').setup(setup_winbar)

vim.cmd('set noshowmode')
