local M = {}

M.plugin = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-lua/lsp-status.nvim",
  },
  -- event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_lualine, lualine = safe_require("lualine")
  local ok_lsp_status, lsp_status = safe_require("lsp-status")

  if not (ok_lualine and ok_lsp_status) then
    return
  end

  lsp_status.register_progress()
  lsp_status.config({
    status_symbol = "",
    show_filename = true,
    diagnostics = false,
  })

  local function LSP()
    local msg = lsp_status.status()
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    local lsp_clients = ""
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        lsp_clients = lsp_clients .. " " .. client.name .. " "
      end
    end
    return lsp_clients .. msg
  end

  local setup_winbar = {
    options = {
      globalstatus = true,
      disabled_filetypes = {
        statusline = {
        },
        winbar = {
          "dap-repl",
        },
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          separator = {
            left = "",
            right = "",
          },
        },
      },
      lualine_b = {
        {
          "branch",
          icon = "שׂ",
          separator = {
            right = "",
          },
        },
      },
      lualine_c = {
        {
          LSP,
          separator = "",
        },
      },
      lualine_x = {
        {
          require("rin.personal.tab").statusline,
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
          "filename",
          path = 1,
          symbols = {
            modified = " 洛",
            readonly = " ",
            unnamed = "NO NAME",
          },
        },
      },
      lualine_x = {
        {
          "diagnostics",
          always_visible = false,
          separator = "",
        },
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
          separator = "",
        },
        {
          "filetype",
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
          "filename",
          path = 1,
          symbols = {
            modified = " 洛",
            readonly = " ",
            unnamed = "NO NAME",
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
          "diagnostics",
          always_visible = false,
          separator = "",
        },
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
          separator = "",
        },
        {
          "filetype",
        },
      },
    }
  }

  lualine.setup(setup_winbar)

  vim.cmd("set noshowmode")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
