local node = require("rin.LSP.luasnip.utils.node")
local M = {}

local S = {
  node.parse_snippet(
    {
      trig = "iee",
      name = "If err not nil",
      dscr = "If err not nil Boilerplate",
      docstring = "if err != nil {\n\n}",
    },
    "if err != nil {\n$0\n}"
  ),
}

M.extend = function(snippets)
  for _, s in ipairs(S) do
    table.insert(snippets, s)
  end
end

return M
