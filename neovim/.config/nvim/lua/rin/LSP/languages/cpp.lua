--[=[
install clang with bundle clangd and clang-format
--]=]

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local null_ls = require("null-ls")

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
end

local capabilities
cmp_nvim_lsp.default_capabilities()

vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
})
vim.lsp.enable("clangd")

null_ls.register({
  name = "null-ls-Cpp",
  sources = {
    null_ls.builtins.formatting.clang_format.with({
    }),
  },
  on_attach = on_attach,
})
