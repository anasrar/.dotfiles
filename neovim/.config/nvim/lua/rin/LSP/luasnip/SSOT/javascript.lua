local node = require("rin.LSP.luasnip.utils.node")
local M = {}

local S = {
  node.parse_snippet(
    {
      trig = "co",
      name = "Constant Variable",
      dscr = "Declare Constant Variable",
      docstring = "const A = ;",
    },
    "const ${1:A} = $0;"
  ),
  node.parse_snippet(
    {
      trig = "le",
      name = "Let Variable",
      dscr = "Declare Let Variable",
      docstring = "let A = ;",
    },
    "let ${1:A} = $0;"
  ),
  node.parse_snippet(
    {
      trig = "func",
      name = "Function",
      dscr = "Function Boilerplate",
      docstring = "function F (args){\n\treturn \n}",
    },
    "function ${1:F} (${2:args}){\n\t${3|return ,|}${0}\n}"
  ),
  node.parse_snippet(
    {
      trig = "funcanon",
      name = "Anonymous Function",
      dscr = "Anonymous Function Boilerplate",
      docstring = "function(args){\n\treturn \n}",
    },
    "function(${1:args}){\n\t${2|return ,|}${0}\n}"
  ),
  node.parse_snippet(
    {
      trig = "funcarrow",
      name = "Arrow Function",
      dscr = "Arrow Function Boilerplate",
      docstring = "const F = (args) => {\n\treturn \n}",
    },
    "const ${1:F} = (${2:args}) => {\n\t${3|return ,|}${0}\n}"
  ),
  node.parse_snippet(
    {
      trig = "funcarrowanon",
      name = "Arrow Anonymous Function",
      dscr = "Arrow Anonymous Function Boilerplate",
      docstring = "(args) => {\n\treturn \n}",
    },
    "(${1:args}) => {\n\t${2|return ,|}${0}\n}"
  ),
  node.parse_snippet(
    {
      trig = "imp",
      name = "ES Module Import",
      dscr = "ES Module Import Boilerplate",
      docstring = "import  from \"\";",
    },
    "import $0 from \"$1\";"
  ),
  node.parse_snippet(
    {
      trig = "impdest",
      name = "ES Module Import With Destructuring",
      dscr = "ES Module Import With Destructuring Boilerplate",
      docstring = "import {} from \"\";",
    },
    "import {$0} from \"$1\";"
  ),
  node.parse_snippet(
    {
      trig = "cl",
      name = "Console Log",
      dscr = "Console Log Boilerplate",
      docstring = "console.log();",
    },
    "console.log($0);"
  ),
}

M.extend = function(snippets)
  for _, s in ipairs(S) do
    table.insert(snippets, s)
  end
end

return M
