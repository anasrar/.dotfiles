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
    if vim.fn.has('nvim-0.8') == 1 then
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
        end
    else
        if client.resolved_capabilities.document_formatting then
            vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
        end
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        if vim.fn.has('nvim-0.8') == 1 then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        else
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
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
