--[=[
Deno lsp, lint and, formatting
just install deno
--]=]

local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

vim.lsp.config("denols", {
  capabilities = capabilities,
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
  },
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  single_file_support = false,
})
vim.lsp.enable("denols")
