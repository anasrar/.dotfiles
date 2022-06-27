--[=[
Vue langue server using volar
```
npm i -g @volar/vue-language-server eslint_d·@fsouza/prettierd
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

lspconfig.volar.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, bufnr)
  end,
})

null_ls.register({
    name = 'null-ls-Vue',
    sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { 'vue' },
        }),
    },
    on_attach = on_attach,
})

