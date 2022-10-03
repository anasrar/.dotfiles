--[=[
GO lsp, linting, and formatting
install gopls for lsp
```
go install golang.org/x/tools/gopls@latest
```
install golangci-lint for lint
```
https://golangci-lint.run/usage/install
```
gofmt pre-installed on go
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

lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
})

null_ls.register({
    name = 'null-ls-Go',
    sources = {
        null_ls.builtins.diagnostics.golangci_lint.with({
          filetypes = { 'go' },
        }),
        null_ls.builtins.formatting.gofmt.with({
          filetypes = { 'go' },
        }),
    },
    on_attach = on_attach,
})
