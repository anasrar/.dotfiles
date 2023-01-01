--[=[
lua-language-server
https://github.com/sumneko/lua-language-server
--]=]

local safe_require = require("rin.utils.safe_require")
local ok_lspconfig, lspconfig = safe_require("lspconfig")
local ok_cmp_nvim_lsp, cmp_nvim_lsp = safe_require("cmp_nvim_lsp")

if not(ok_lspconfig and ok_cmp_nvim_lsp) then
  return
end

local on_attach = function(client, bufnr)
  require("rin.LSP.utils.keymap")(bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.sumneko_lua.setup({
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
