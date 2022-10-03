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
    require('rin.LSP.utils.keymap')(bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.svelte.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
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
