--[=[
Python lsp, linting, and formatting
project set up
```
python -m venv .venv
source .venv/bin/activate
```
install pyright for static type checker
```
pip install pyright
```
install pydocstyle for documentation lint
```
pip install pydocstyle
```
install autopep8 for formatting
```
pip install autopep8
```
--]=]

local ok = require("rin.utils.check_requires").check({
  "lspconfig",
  "cmp_nvim_lsp",
  "null-ls",
})
if not ok then
  return
end

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local null_ls = require("null-ls")

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
})

null_ls.register({
  name = "null-ls-Python",
  sources = {
    null_ls.builtins.diagnostics.pydocstyle.with({
      filetypes = { "python" },
      extra_args = { "--config=$ROOT/setup.cfg" },
    }),
    null_ls.builtins.formatting.autopep8.with({
      filetypes = { "python" },
    }),
  },
  on_attach = on_attach,
})
