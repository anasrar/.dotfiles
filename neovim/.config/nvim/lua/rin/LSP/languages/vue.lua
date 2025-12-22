--[=[
Vue langue server
```
npm i -g @vue/vue-language-server eslint_d·@fsouza/prettierd
```
--]=]

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local null_ls = require("null-ls")

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("vue_ls", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
})
vim.lsp.enable("vue_ls")

null_ls.register({
  name = "null-ls-Vue",
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "vue" },
    }),
  },
  on_attach = on_attach,
})
