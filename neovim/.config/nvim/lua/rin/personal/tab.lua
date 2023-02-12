local M = {}
local tab_name = {
  "main",
  "debug",
}

M.statusline = function()
  local result = "";
  local current_tab = vim.fn.tabpagenr()
  local total_tab = vim.fn.tabpagenr("$")

  for i = 1, total_tab do
    local hl = i == current_tab and "StatusLineTabActive" or "StatusLineTabInactive"
    local name = tab_name[i] or "unknown";
    result = result .. "  " .. "%#" .. hl .. "#" .. i .. ":" .. name .. "%*"
  end

  return result .. " "
end

M.setup = function()
  vim.cmd(string.rep("tab split", #tab_name - 1, "|") .. "|tabfirst")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
