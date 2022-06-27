--[=[
Python lsp, linting, and formatting
project set up
```
python -m venv .venv
source .venv/bin/activate
```
install pyright for lsp / type check
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

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local on_attach = function(client, bufnr)
    require('rin.LSP.utils.keymap')(bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
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
