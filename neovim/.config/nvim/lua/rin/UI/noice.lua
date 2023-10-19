local M = {}

M.plugin = {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "noice",
  })
  if not ok then
    return
  end

  local noice = require("noice")

  noice.setup({
    cmdline = {
      enabled = false,
    },
    messages = {
      enabled = false,
    },
    popupmenu = {
      enabled = false,
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    views = {
      mini = {
        win_options = {
          winblend = 0
        },
        position = {
          row = -3,
        },
      },
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = {
        format_done = {
          { "󰸞 ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
        },
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      message = {
        enabled = true,
        view = "mini",
      },
    },
    routes = {
      {
        view = "mini",
        filter = { event = "notify" },
        opts = { title = "Notify" },
      },
    },
  })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
