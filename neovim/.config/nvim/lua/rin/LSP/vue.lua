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
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.volar.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
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

