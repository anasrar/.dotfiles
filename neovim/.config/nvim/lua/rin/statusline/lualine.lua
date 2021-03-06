local setup_default = {
  sections = {
    lualine_a = {
      {
        'mode',
      },
    },
    lualine_b = {
      {
        'branch',
      },
    },
    lualine_c = {
      {
        'filename',
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
  inactive_sections = {
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
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'filetype',
      },
    }
  },
}

local setup_winbar = {
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
      },
    },
    lualine_b = {
      {
        'branch',
      },
    },
    lualine_c = {
    },
    lualine_x = {
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

require('lualine').setup(vim.fn.has('nvim-0.8') == 1 and setup_winbar or setup_default)

vim.cmd('set noshowmode')
