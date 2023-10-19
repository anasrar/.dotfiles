--[=[
install clang with bundle clangd and clang-format
--]=]

local ok = require("rin.utils.check_requires").check({
  "lspconfig",
  "cmp_nvim_lsp",
  "null-ls",
})
if not ok then
  return
end

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
end

local capabilities
cmp_nvim_lsp.default_capabilities()

lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  root_dir = lspconfig.util.root_pattern("compile_commands.json"),
})
