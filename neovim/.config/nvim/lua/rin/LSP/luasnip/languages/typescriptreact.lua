local S = {}

require('rin.LSP.luasnip.SSOT.javascript').extend(S)
require('rin.LSP.luasnip.SSOT.typescript').extend(S)
require('rin.LSP.luasnip.SSOT.typescriptreact').extend(S)

return S
