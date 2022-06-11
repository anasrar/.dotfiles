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
--]=]

local dap = require('dap')

dap.adapters.chrome = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.DAP/vscode-chrome-debug/out/src/chromeDebug.js' },
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
    }
  }
end
