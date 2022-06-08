--[=[
install python
and on root project
```
python -m venv .venv
source .venv/bin/active
pip install debugpy
```
--]=]

local dap = require('dap')

command = vim.fn.getcwd() .. '/.venv/bin/python'

dap.adapters.python = {
  type = 'executable',
  command = command,
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch Program',
    program = '${file}',
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end,
  }
}
