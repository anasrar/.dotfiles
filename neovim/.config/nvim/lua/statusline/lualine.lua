require('lualine').setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
    },
    lualine_c = {
      {
        'filename',
        symbols = {
          modified = ' 洛',
          readonly = ' ',
          unnamed = 'BUFFER',
        },
      },
      {
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' ',
        },
      },
    },
    lualine_x = {
      'diagnostics',
      -- 'encoding',
      -- 'fileformat',
      'filetype',
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
	inactive_sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'filetype', 'encoding'}
	},
})

vim.cmd('set noshowmode')
