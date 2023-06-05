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

local safe_require = require("rin.utils.safe_require")
local ok_lspconfig, lspconfig = safe_require("lspconfig")
local ok_cmp_nvim_lsp, cmp_nvim_lsp = safe_require("cmp_nvim_lsp")
local ok_null_ls, null_ls = safe_require("null-ls")

if not(ok_lspconfig and ok_cmp_nvim_lsp and ok_null_ls) then
  return
end

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
