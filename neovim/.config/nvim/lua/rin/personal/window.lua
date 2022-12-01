local command_name_setup = 'RinSetupWindow'
local command_name_clear = 'RinClearWindow'
local tab_key = 'RinWindow'
local setup = '60vs | sp | wincmd l'
local clear = 'wincmd q'

local get_var = function()
  return vim.api.nvim_tabpage_get_var(0, tab_key)
end
local get_state = function()
  if pcall(get_var) then
    return get_var()
  else
    return false
  end
end
local set_state = function(val)
  vim.api.nvim_tabpage_set_var(0, tab_key,val)
end

vim.api.nvim_create_user_command(
  'RinSetupWindow',
  function()
    if not get_state() then
      vim.cmd(setup)
      set_state(true)
    end
  end,
  {}
)

vim.api.nvim_create_user_command(
  'RinClearWindow',
  function()
    local tab_total_window = #vim.api.nvim_tabpage_list_wins(0) 
    if tab_total_window > 1 then
      vim.cmd(string.rep(clear, tab_total_window - 1, ' | '))
    end
    set_state(false)
  end,
  {}
)


vim.api.nvim_create_user_command(
  'RinToggleWindow',
  function()
    if get_state() then
      vim.cmd(command_name_clear)
    else
      vim.cmd(command_name_setup)
    end
  end,
  {}
)
