--[=[
CSS completions
```
npm i -g vscode-langservers-extracted @fsouza/prettierd
```
--]=]

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

null_ls.register({
    name = 'null-ls-CSS',
    sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { 'css', 'scss', 'less' },
        }),
    },
})
