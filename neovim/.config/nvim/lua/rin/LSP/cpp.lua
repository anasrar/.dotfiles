--[=[
install clang with bundle clangd and clang-format
--]=]

local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    require('rin.LSP.utils.keymap')(bufnr)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end,
    root_dir = lspconfig.util.root_pattern('compile_commands.json'),
})
