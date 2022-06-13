--[=[
install vscode chrome debug
```
git clone https://github.com/Microsoft/vscode-chrome-debug ~/.DAP/vscode-chrome-debug
cd ~/.DAP/vscode-chrome-debug
npm install
npm run build
```
run chrome with argument `--remote-debugging-port=9222`
```
chrome --remote-debugging-port=9222
```

install vscode node debug2
```
git clone https://github.com/microsoft/vscode-node-debug2.git ~/.DAP/vscode-node-debug2
cd ~/.DAP/vscode-node-debug2
npm install
NODE_OPTIONS=--no-experimental-fetch npm run build
```
and run any node using flag `--inspect` or `--inspect-brk`, you can also debug deno using the same flag

--]=]

local dap = require('dap')

dap.adapters.chrome = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.DAP/vscode-chrome-debug/out/src/chromeDebug.js' },
}

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.DAP/vscode-node-debug2/out/src/nodeDebug.js' },
}

local exts = {'javascript','typescript','javascriptreact','typescriptreact'}

for i, ext in ipairs(exts) do
  dap.configurations[ext] = {
    {
      type = 'chrome',
      request = 'attach',
      name = 'Attach Program (Chrome)',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      port = 9222,
      webRoot = '${workspaceFolder}',
    },
    {
      type = 'node2',
      request = 'attach',
      name = 'Attach Program (Node2)',
      processId = require('dap.utils').pick_process,
    },
  }
end
