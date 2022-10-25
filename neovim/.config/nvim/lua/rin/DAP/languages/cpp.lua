--[=[
install vscode cpptools
download: https://github.com/microsoft/vscode-cpptools/releases
extract to `~/.DAP/vscode-cpptools`

install gdb
--]=]

local dap = require('dap')

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = os.getenv('HOME') .. '/.DAP/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}

local exts = {'c','cpp'}

for i, ext in ipairs(exts) do
  dap.configurations[ext] = {
    {
      name = 'Launch Program',
      type = 'cppdbg',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
    },
    {
      name = 'Attach to gdbserver :1234',
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      miDebuggerServerAddress = 'localhost:1234',
      miDebuggerPath = '/usr/bin/gdb',
      cwd = '${workspaceFolder}',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
    },
  }
end
