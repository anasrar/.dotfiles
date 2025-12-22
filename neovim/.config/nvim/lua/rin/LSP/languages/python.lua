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
--]=]

local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
})
vim.lsp.enable("pyright")

-- TODO: use ruff `https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ruff`
