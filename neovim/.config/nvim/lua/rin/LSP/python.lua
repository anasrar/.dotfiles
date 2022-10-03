--[=[
Python lsp, linting, and formatting
project set up
```
python -m venv .venv
source .venv/bin/activate
```
install pylsp for lsp
```
pip install python-lsp-server
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

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local on_attach = function(client, bufnr)
    require('rin.LSP.utils.keymap')(bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
})

null_ls.register({
    name = 'null-ls-Python',
    sources = {
        null_ls.builtins.diagnostics.pydocstyle.with({
          filetypes = { 'python' },
          extra_args = { '--config=$ROOT/setup.cfg' },
        }),
        null_ls.builtins.formatting.autopep8.with({
          filetypes = { 'python' },
        }),
    },
    on_attach = on_attach,
})
