local M = {}
local tab_name = {
  'main',
  'debug',
}

M.statusline = function()
  local result = '';
  local current_tab = vim.fn.tabpagenr()
  local total_tab = vim.fn.tabpagenr('$')

  for i = 1, total_tab do
    local hl = i == current_tab and 'StatusLineTabActive' or 'StatusLineTabInactive'
    local name = tab_name[i] or 'unknown';
    result = result .. '%#' .. hl .. '#' .. ' ' .. i .. ' ┃ ' .. name .. ' %*'
    if i ~= total_tab then
      result = result .. '%#' ..hl .. '#' .. '▐' .. '%*'
    end
  end

  return result
end

M.setup = function()
  vim.cmd(string.rep('tab split', #tab_name - 1, '|') .. '|tabfirst')
  -- # default using iceberg colorscheme
  -- vim.api.nvim_set_hl(0, 'StatusLineTabActive', { bg = '#e2a478', fg = '#161821' })
  -- vim.api.nvim_set_hl(0, 'StatusLineTabActiveStart', { bg = '#e2a478', fg = '#161821' })
  -- vim.api.nvim_set_hl(0, 'StatusLineTabActiveEnd', { fg = '#e2a478' })
  -- vim.api.nvim_set_hl(0, 'StatusLineTabInactive', { bg = '#6b7089', fg = '#1e2132' })
  -- vim.api.nvim_set_hl(0, 'StatusLineTabInactiveStart', { bg = '#6b7089', fg = '#161821' })
  -- vim.api.nvim_set_hl(0, 'StatusLineTabInactiveEnd', { fg = '#6b7089' })
end

return M
