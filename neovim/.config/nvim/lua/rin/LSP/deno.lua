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
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.denols.setup({
    capabilities = capabilities,
    init_options = {
      enable = true,
      lint = true,
      unstable = false
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
})

null_ls.register({
    name = 'null-ls-deno',
    sources = {
        null_ls.builtins.formatting.deno_fmt.with({
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'markdown', 'json', 'jsonc' },
          condition = function(utils)
              return utils.root_has_file({ 'deno.json', 'deno.jsonc' })
          end,
        }),
    },
    on_attach = on_attach,
})
