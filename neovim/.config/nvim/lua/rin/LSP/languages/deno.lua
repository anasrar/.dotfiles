--[=[
Deno lsp, lint and, formatting
just install deno
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

lspconfig.denols.setup({
  capabilities = capabilities,
  init_options = {
    enable = true,
    lint = true,
    unstable = false
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  single_file_support = false,
})

null_ls.register({
  name = "null-ls-deno",
  sources = {
    null_ls.builtins.formatting.deno_fmt.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "markdown", "json", "jsonc" },
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/pull/1313
      args = function(params)
        local extensions = {
          javascript = "js",
          javascriptreact = "jsx",
          json = "json",
          jsonc = "jsonc",
          markdown = "md",
          typescript = "ts",
          typescriptreact = "tsx",
        }

        return {
          "fmt",
          "-",
          "--ext",
          extensions[params.ft],
        }
      end,
      condition = function(utils)
        return utils.root_has_file({ "deno.json", "deno.jsonc" })
      end,
    }),
  },
  on_attach = on_attach,
})
