vim.o.termguicolors = true

vim.g.tokyonight_style = 'night'
vim.g.tokyonight_terminal_colors = false
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_hide_inactive_statusline = false
vim.g.tokyonight_sidebars = {}
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = { bg_float = 'none' }
vim.g.tokyonight_day_brightness = 0.3
vim.g.tokyonight_lualine_bold = true

vim.cmd('colorscheme tokyonight')

vim.api.nvim_set_hl(0, 'StatusLineTabLastItem', { bg = '#6b7089', fg = '#161821' })
vim.api.nvim_set_hl(0, 'StatusLineTabActive', { bg = '#e2a478', fg = '#161821' })
vim.api.nvim_set_hl(0, 'StatusLineTabActiveStart', { bg = '#e2a478', fg = '#161821' })
vim.api.nvim_set_hl(0, 'StatusLineTabActiveEnd', { fg = '#e2a478' })
vim.api.nvim_set_hl(0, 'StatusLineTabInactive', { bg = '#6b7089', fg = '#1e2132' })
vim.api.nvim_set_hl(0, 'StatusLineTabInactiveStart', { bg = '#6b7089', fg = '#161821' })
vim.api.nvim_set_hl(0, 'StatusLineTabInactiveEnd', { fg = '#6b7089' })
