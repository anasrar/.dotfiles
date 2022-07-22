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
    require('rin.LSP.utils.keymap')(bufnr)
    if vim.fn.has('nvim-0.8') == 1 then
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
        end
    else
        if client.resolved_capabilities.document_formatting then
            vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
        end
    end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

if require('null-ls.utils').make_conditional_utils().root_has_file({ 'deno.json' }) then
    lspconfig.denols.setup({
        capabilities = capabilities,
        single_file_support = true,
        init_options = {
          enable = true,
          lint = true,
          unstable = false
        },
        on_attach = function(client, bufnr)
            if vim.fn.has('nvim-0.8') == 1 then
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            else
                client.resolved_capabilities.document_formatting = false
                client.resolved_capabilities.document_range_formatting = false
            end
            on_attach(client, bufnr)
        end,
        root_dir = lspconfig.util.root_pattern('deno.json'),
    })
end

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
