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
      if vim.fn.has('nvim-0.8') == 1 then
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
      else
          client.resolved_capabilities.document_formatting = false
          client.resolved_capabilities.document_range_formatting = false
      end
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
