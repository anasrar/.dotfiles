local M = {}

M.plugin = {
  "nanozuki/tabby.nvim",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local tabby = require("tabby.tabline")

  vim.o.showtabline = 2

  tabby.set(function(line)
    return {
      {
        { "▎", hl = "@accent.300", },
      },
      {
        { "neovim", hl = "", },
      },
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        local hl = win.buf().is_changed() and "@accent.300" or win.is_current() and "@accent.200"
            or ""
        return {
          " ",
          win.is_current() and "⏵ " or "",
          (win.buf_name() == "[No Name]" and "NO NAME" or win.buf_name()),
          "",
          hl = hl,
        }
      end),
      line.spacer(),
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and "@accent.200" or ""
        return {
          tab.is_current() and "⏵ " or "",
          (tab.name() == "[No Name]" and "NO NAME" or tab.name()),
          " ",
          hl = hl,
        }
      end),
      hl = "TabLineFill",
    }
  end)
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
