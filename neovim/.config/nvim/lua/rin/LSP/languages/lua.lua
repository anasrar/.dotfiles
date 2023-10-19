--[=[
lua-language-server
https://github.com/sumneko/lua-language-server
--]=]

local ok = require("rin.utils.check_requires").check({
  "lspconfig",
  "cmp_nvim_lsp",
})
if not ok then
  return
end

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Using builtin formatter
    -- client.server_capabilities.documentFormattingProvider = false
    -- client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})
