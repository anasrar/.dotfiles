local node = require('rin.LSP.luasnip.utils.node')
local M = {}

local S = {
  node.parse_snippet(
    {
      trig = 'ty',
      name = 'Type',
      dscr = 'Type Boilerplate',
      docstring = 'type T = {\n\n};',
    },
    'type ${1:T} = {\n\t$0\n};'
  ),
  node.parse_snippet(
    {
      trig = 'ty1l',
      name = 'Type 1 Line',
      dscr = 'Type 1 Line Boilerplate',
      docstring = 'type T = ;',
    },
    'type ${1:T} = $0;'
  ),
  node.parse_snippet(
    {
      trig = 'inter',
      name = 'Interface',
      dscr = 'Interface Boilerplate',
      docstring = 'interface T {\n\n}',
    },
    'interface ${1:T} {\n\t$0\n}'
  ),
  node.parse_snippet(
    {
      trig = 'interext',
      name = 'Interface Extend',
      dscr = 'Interface Extend Boilerplate',
      docstring = 'interface T extends A {\n\n}',
    },
    'interface ${1:T} extends ${2:A} {\n\t$0\n}'
  ),
}

M.extend = function(snippets)
  for _, s in ipairs(S) do
    table.insert(snippets, s)
  end
end

return M
