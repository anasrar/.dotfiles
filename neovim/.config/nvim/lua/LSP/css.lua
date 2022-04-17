--[=[
CSS completions
just require this with TypeScript, it will handle formatting
```
npm i -g vscode-langservers-extracted
```
--]=]

local lspconfig = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
  end,
})
