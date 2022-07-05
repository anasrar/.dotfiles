local node = require('rin.LSP.luasnip.utils.node')

local S = {
  node.parse_snippet(
    {
      trig = 'qe',
      name = 'Single Quote',
      dscr = 'Single Quote Boilerplate',
      docstring = '\'\'',
    },
    '\'$0\''
  ),
  node.parse_snippet(
    {
      trig = 'qee',
      name = 'Double Quote',
      dscr = 'Double Quote Boilerplate',
      docstring = '""',
    },
    '"$0"'
  ),
  node.parse_snippet(
    {
      trig = 'qw',
      name = 'Curly Braces',
      dscr = 'Curly Braces Boilerplate',
      docstring = '{}',
    },
    '{$0}'
  ),
  node.parse_snippet(
    {
      trig = 'qww',
      name = 'Curly Braces With New Line',
      dscr = 'Curly Braces With New Line Boilerplate',
      docstring = '{\n\t\n}',
    },
    '{\n\t$0\n}'
  ),
  node.parse_snippet(
    {
      trig = 'qs',
      name = 'Square Brackets New Line',
      dscr = 'Square Brackets New Line Boilerplate',
      docstring = '[]',
    },
    '[$0]'
  ),
  node.parse_snippet(
    {
      trig = 'qd',
      name = 'Parentheses',
      dscr = 'PArentheses Boilerplate',
      docstring = '()',
    },
    '($0)'
  ),
  node.parse_snippet(
    {
      trig = 'qa',
      name = 'Angle Brackets',
      dscr = 'Angle Brackets Boilerplate',
      docstring = '<>',
    },
    '<$0>'
  ),
  node.parse_snippet(
    {
      trig = 'ternary',
      name = 'Ternary Operator',
      dscr = 'Ternary Operator Boilerplate',
      docstring = 'condition ? true : false',
    },
    '${1:condition} ? ${2:true} : ${3:false}'
  ),
}

return S
