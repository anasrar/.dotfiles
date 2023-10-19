--[=[
Vue langue server using volar
```
npm i -g @volar/vue-language-server eslint_d·@fsouza/prettierd
```
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
local null_ls = require("null-ls")

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.volar.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
})

null_ls.register({
  name = "null-ls-Vue",
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "vue" },
    }),
  },
  on_attach = on_attach,
})
