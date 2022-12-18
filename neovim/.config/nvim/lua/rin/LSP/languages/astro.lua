--[=[
Astro lsp
linting and formatting you can check on `typescript.lua`
```
npm i -g @astrojs/language-server eslint_d @fsouza/prettierd
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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.astro.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- client.server_capabilities.documentFormattingProvider = false
        -- client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
})

null_ls.setup({
    name = 'null-ls-astro',
    filetypes = { 'astro' },
    sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { 'astro' },
        }),
    },
    on_attach = on_attach,
})

