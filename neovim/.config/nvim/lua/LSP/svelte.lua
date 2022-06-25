--[=[
Svelte lsp
linting and formatting you can check on `typescript.lua`
```
npm i -g svelte-language-server eslint_d @fsouza/prettierd
```
--]=]

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local on_attach = function(client, bufnr)
    require('LSP.utils.keymap')(bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.svelte.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, bufnr)
    end,
})

null_ls.setup({
    name = 'null-ls-svelte',
    filetypes = { 'svelte' },
    sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { 'svelte' },
        }),
    },
    on_attach = on_attach,
})
