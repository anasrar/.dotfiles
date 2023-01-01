--[=[
CSS completions
```
npm i -g vscode-langservers-extracted @fsouza/prettierd
```
--]=]

local safe_require = require("rin.utils.safe_require")
local ok_lspconfig, lspconfig = safe_require("lspconfig")
local ok_cmp_nvim_lsp, cmp_nvim_lsp = safe_require("cmp_nvim_lsp")
local ok_null_ls, null_ls = safe_require("null-ls")

if not(ok_lspconfig and ok_cmp_nvim_lsp and ok_null_ls) then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    require("rin.LSP.utils.keymap")(bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

null_ls.register({
  name = "null-ls-CSS",
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "css", "scss", "less" },
    }),
  },
})
