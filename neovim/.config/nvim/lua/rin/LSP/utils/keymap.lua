local mapping = function(bufnr)
  vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
  vim.cmd("command! LspFormatting lua vim.lsp.buf.format()")
  vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
  vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
  vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
  vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
  vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
  vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
  vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
  vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
  vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
  vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

  local buf_keymap = require("rin.utils.keymap").buf_keymap

  buf_keymap(bufnr, "n", "<Leader>lf", ":Lspsaga lsp_finder<CR>")
  buf_keymap(bufnr, "n", "<Leader>ld", ":LspDef<CR>")
  buf_keymap(bufnr, "n", "<Leader>lr", ":Lspsaga rename<CR>")
  buf_keymap(bufnr, "n", "<Leader>lt", ":LspTypeDef<CR>")
  buf_keymap(bufnr, "n", "<Leader>lj", ":LspHover<CR>")
  buf_keymap(bufnr, "n", "<Leader>l[", ":LspDiagPrev<CR>")
  buf_keymap(bufnr, "n", "<Leader>l]", ":LspDiagNext<CR>")
  buf_keymap(bufnr, "n", "<Leader>la", ":Lspsaga code_action<CR>")
  buf_keymap(bufnr, "n", "<Leader>ll", ":LspDiagLine<CR>")
  buf_keymap(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
end

return mapping
