--[=[
JavaScript and TypeScript lsp and formatting
lint using eslint_d
formatting using prettierd, you can use eslint_d
```
npm i -g typescript typescript-language-server eslint_d @fsouza/prettierd
```
--]=]

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
local ts_utils = require('nvim-lsp-ts-utils')

local on_attach = function(client, bufnr)
    require('rin.LSP.utils.keymap')(bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        ts_utils.setup({})
        ts_utils.setup_client(client)
        on_attach(client, bufnr)
    end,
    root_dir = lspconfig.util.root_pattern('package.json'),
})

null_ls.register({
    name = 'null-ls-TypeScript',
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
          condition = function(utils)
              return utils.root_has_file({ 'package.json' })
          end,
        }),
        null_ls.builtins.code_actions.eslint_d.with({
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
          condition = function(utils)
              return utils.root_has_file({ 'package.json' })
          end,
        }),
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
          condition = function(utils)
              return utils.root_has_file({ 'package.json' })
          end,
        }),
    },
    on_attach = on_attach,
})
