--[=[
Deno lsp, lint and, formatting
just install deno
--]=]

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

vim.g.markdown_fenced_languages = {
  'ts=typescript'
}
local on_attach = function(client, bufnr)
    require('LSP.utils.keymap')(bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.denols.setup({
    capabilities = capabilities,
    init_options = {
      enable = true,
      lint = true,
      unstable = false
    },
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, bufnr)
    end,
    root_dir = lspconfig.util.root_pattern('deno.json'),
})

null_ls.register({
    name = 'null-ls-deno',
    sources = {
        null_ls.builtins.formatting.deno_fmt.with({
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
          condition = function(utils)
              return utils.root_has_file({ 'deno.json' })
          end,
        }),
    },
    on_attach = on_attach,
})
