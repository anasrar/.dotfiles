local function LSP()
  local msg = require('lsp-status').status()
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return "聯" .. client.name .. msg
    end
  end
  return msg
end

local setup_winbar = {
  options = {
    globalstatus = true,
    disabled_filetypes = {
      statusline = {
      },
      winbar = {
        'dap-repl',
      },
    },
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
        LSP,
        separator = '',
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
