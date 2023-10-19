local M = {}

M.plugin = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
  },
  -- event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "lualine",
  })
  if not ok then
    return
  end

  local lualine = require("lualine")

  local function LSP()
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return ""
    end
    local lsp_clients = ""
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        lsp_clients = lsp_clients .. client.name .. " "
      end
    end
    return lsp_clients
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
      },
      lualine_b = {
      },
      lualine_c = {
        {
          "mode",
          padding = 0,
          separator = {
            left = "",
            right = "",
          },
          fmt = function(str) return "%#StatusLineModeIcon#  %*" .. "%#StatusLineModeText# " .. str .. " %*" end,
        },
        {
          "branch",
          icon = "",
          padding = 0,
          separator = {
            left = "",
            right = "",
          },
          fmt = function(str) return "%#StatusLineGitBranchIcon#  %*" .. "%#StatusLineGitBranchText# " .. str .. " %*" end,
        },
        {
          LSP,
          icon = "",
          padding = 0,
          separator = {
            left = "",
            right = "",
          },
          fmt = function(str) return "%#StatusLineLspIcon# 󰛓 %*" ..
                "%#StatusLineLspText# " .. (#str == 0 and "NO LSP" or str) .. " %*"
          end,
        },
      },
      lualine_x = {
        {
          "location",
          icon = "",
          padding = 0,
          separator = {
            left = "",
            right = "",
          },
          fmt = function(str) return "%#StatusLineLocationIcon# 󰕅 %*" .. "%#StatusLineLocationText# " .. str .. " %*" end,
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
            modified = "",
            readonly = "",
            unnamed = "NO NAME",
          },
          padding = 0,
          separator = {
            left = "",
            right = "",
          },
          fmt = function(str) return "%#StatusLineFilePathIcon#  %*" .. "%#StatusLineFilePathText# " .. str .. " %*" end,
        },
      },
      lualine_x = {
        {
          function()
            return " "
          end,
          padding = 0,
          separator = {
            left = "",
            right = "",
          },
        },
        {
          "diagnostics",
          always_visible = false,
          padding = 1,
          separator = {
            left = "",
            right = "",
          },
        },
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
          padding = 0,
          separator = {
            left = "",
            right = "",
          },
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
            modified = "",
            readonly = "",
            unnamed = "NO NAME",
          },
          padding = 0,
          separator = {
            left = "",
            right = "",
          },
          fmt = function(str) return "%#StatusLineFilePathIcon#  %*" .. "%#StatusLineFilePathText# " .. str .. " %*" end,
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
