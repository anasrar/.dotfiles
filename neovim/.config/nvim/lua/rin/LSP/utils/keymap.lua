local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

local mapping = function(bufnr)
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
    buf_map(bufnr, 'n', '<Leader>ld', ':LspDef<CR>')
    buf_map(bufnr, 'n', '<Leader>lr', ':LspRename<CR>')
    buf_map(bufnr, 'n', '<Leader>lt', ':LspTypeDef<CR>')
    buf_map(bufnr, 'n', '<Leader>lj', ':LspHover<CR>')
    buf_map(bufnr, 'n', '<Leader>l[', ':LspDiagPrev<CR>')
    buf_map(bufnr, 'n', '<Leader>l]', ':LspDiagNext<CR>')
    buf_map(bufnr, 'n', '<Leader>la', ':LspCodeAction<CR>')
    buf_map(bufnr, 'n', '<Leader>ll', ':LspDiagLine<CR>')
    buf_map(bufnr, 'i', '<C-x><C-x>', '<cmd> LspSignatureHelp<CR>')
end

return mapping
