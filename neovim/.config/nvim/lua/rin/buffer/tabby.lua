local M = {}

M.plugin = {
  "nanozuki/tabby.nvim",
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local ok = require("rin.utils.check_requires").check({
    "tabby.tabline",
  })
  if not ok then
    return
  end

  local tabby = require("tabby.tabline")

  vim.o.showtabline = 2

  tabby.set(function(line)
    return {
      {
        { " 󰯌 ", hl = "TabbyBufferIcon", },
      },
      line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        local hl = win.buf().is_changed() and "TabbyBufferTextChanged" or win.is_current() and "TabbyBufferTextCurrent"
            or "TabbyBufferText"
        return {
          " ",
          (win.buf_name() == "[No Name]" and "NO NAME" or win.buf_name()),
          " ",
          hl = hl,
        }
      end),
      line.spacer(),
      {
        { " 󰖯 ", hl = "TabbyTabIcon", },
      },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and "TabbyTabTextCurrent" or "TabbyTabText"
        return {
          " ",
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
