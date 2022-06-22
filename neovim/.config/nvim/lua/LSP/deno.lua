--[=[
Deno lsp, lint and, formatting
just install deno
--]=]

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

vim.g.markdown_fenced_languages = {
  'ts=typescript'
}
local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local on_attach = function(client, bufnr)
    vim.cmd('command! LspDef lua vim.lsp.buf.definition()')
    vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
    vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
    vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
    vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
    vim.cmd('command! LspRefs lua vim.lsp.buf.references()')
    vim.cmd('command! LspTypeDef lua vim.lsp.buf.type_definition()')
    vim.cmd('command! LspImplementation lua vim.lsp.buf.implementation()')
    vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
    vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
    vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')
    vim.cmd('command! LspSignatureHelp lua vim.lsp.buf.signature_help()')
    buf_map(bufnr, 'n', 'gd', ':LspDef<CR>')
    buf_map(bufnr, 'n', 'gr', ':LspRename<CR>')
    buf_map(bufnr, 'n', 'gy', ':LspTypeDef<CR>')
    buf_map(bufnr, 'n', 'K', ':LspHover<CR>')
    buf_map(bufnr, 'n', '[a', ':LspDiagPrev<CR>')
    buf_map(bufnr, 'n', ']a', ':LspDiagNext<CR>')
    buf_map(bufnr, 'n', 'ga', ':LspCodeAction<CR>')
    buf_map(bufnr, 'n', '<Leader>a', ':LspDiagLine<CR>')
    buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')
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
