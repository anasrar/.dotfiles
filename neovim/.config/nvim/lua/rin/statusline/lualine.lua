require('lualine').setup({
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
})

vim.cmd('set noshowmode')
