--[=[
install clang with bundle clangd and clang-format
--]=]

local safe_require = require("rin.utils.safe_require")
local ok_lspconfig, lspconfig = safe_require("lspconfig")
local ok_cmp_nvim_lsp, cmp_nvim_lsp = safe_require("cmp_nvim_lsp")

if not(ok_lspconfig and ok_cmp_nvim_lsp) then
  return
end

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
end

local capabilities cmp_nvim_lsp.default_capabilities()

lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  root_dir = lspconfig.util.root_pattern("compile_commands.json"),
})
