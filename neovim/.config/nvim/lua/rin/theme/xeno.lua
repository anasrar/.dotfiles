local M = {}

M.plugin = {
  "kyza0d/xeno.nvim",
  commit = "4a1d3946b5c3b9b581e76a84746a06b0977b1fed",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  require("xeno").new_theme("xeno-my-theme", {
    base        = "#18181B", -- zinc   900
    -- accent   = "#E4E4E7", -- zinc   200
    -- accent   = "#FFCCD3", -- rose   200
    -- accent   = "#D8F999", -- lime   200
    accent      = "#C6D2FF", -- indigo 200
    -- accent   = "#DDD6FF", -- violet 200
    -- accent   = "#b8e6fe", -- sky    200
    -- accent   = "#FEE685", -- amber  200
    contrast    = 0.1,
    transparent = true,
    highlights  = {
    },
  })

  vim.cmd("colorscheme xeno-my-theme")
  vim.cmd("set termguicolors")

  vim.api.nvim_create_user_command(
    "XenoColors",
    function()
      local highlight_hex_colors = function(buf, lines)
        -- Add hex color highlighting with contrast text
        for i, line in ipairs(lines) do
          for hex in line:gmatch("#%x%x%x%x%x%x") do
            local start_col = line:find(hex, 1, true) - 1
            local end_col = start_col + #hex
            local hl_group = "HexColor" .. hex:sub(2):upper()

            -- Calculate luminance to determine if we need light or dark text
            local r = tonumber(hex:sub(2, 3), 16) / 255
            local g = tonumber(hex:sub(4, 5), 16) / 255
            local b = tonumber(hex:sub(6, 7), 16) / 255

            -- Calculate relative luminance (simplified)
            local luminance = 0.299 * r + 0.587 * g + 0.114 * b
            local text_color = luminance > 0.5 and "#000000" or "#FFFFFF"

            -- Create highlight group with the hex color background and contrasting text
            vim.api.nvim_set_hl(0, hl_group, { fg = text_color, bg = hex })

            -- Apply highlight to the hex code
            vim.api.nvim_buf_add_highlight(buf, -1, hl_group, i - 1, start_col, end_col)
          end
        end
      end

      local redir_to_buffer_with_colors = function(command, buffer_name)
        buffer_name = buffer_name or "[Output]"

        local output = vim.fn.execute(command)

        vim.cmd("new")
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_name(buf, buffer_name)
        vim.bo[buf].buftype = "nofile"
        vim.bo[buf].bufhidden = "wipe"
        vim.bo[buf].swapfile = false

        local lines = vim.split(output, "\n")
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

        highlight_hex_colors(buf, lines)

        vim.bo[buf].modifiable = false
      end

      redir_to_buffer_with_colors("highlight", "Highlight Groups")
    end,
    { desc = "" }
  )
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
