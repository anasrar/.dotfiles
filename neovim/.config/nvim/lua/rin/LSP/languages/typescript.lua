--[=[
JavaScript and TypeScript lsp and formatting
lint using eslint_d
formatting using prettierd, you can use eslint_d
```
npm i -g typescript typescript-language-server eslint_d @fsouza/prettierd
```
--]=]

local safe_require = require("rin.utils.safe_require")
local ok_lspconfig, lspconfig = safe_require("lspconfig")
local ok_cmp_nvim_lsp, cmp_nvim_lsp = safe_require("cmp_nvim_lsp")
local ok_null_ls, null_ls = safe_require("null-ls")
local ok_ts_utils, ts_utils = safe_require("nvim-lsp-ts-utils")

if not(ok_lspconfig and ok_cmp_nvim_lsp and ok_null_ls and ok_ts_utils) then
  return
end

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    ts_utils.setup({})
    ts_utils.setup_client(client)
    on_attach(client, bufnr)
  end,
  root_dir = lspconfig.util.root_pattern("package.json"),
})

null_ls.register({
  name = "null-ls-TypeScript",
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      condition = function(utils)
        return utils.root_has_file({ "package.json" })
      end,
    }),
    null_ls.builtins.code_actions.eslint_d.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      condition = function(utils)
        return utils.root_has_file({ "package.json" })
      end,
    }),
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      condition = function(utils)
        return utils.root_has_file({ "package.json" })
      end,
    }),
  },
  on_attach = on_attach,
})
