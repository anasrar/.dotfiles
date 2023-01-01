local node = require("rin.LSP.luasnip.utils.node")

local S = {
  node.parse_snippet(
    {
      trig = "req",
      name = "Require",
      dscr = "Require File Boilerplate",
      docstring = "local name = require(\"\")",
    },
    "local ${1:name} = require(\"$0\")"
  ),
  node.parse_snippet(
    {
      trig = "func",
      name = "Function",
      dscr = "Function Boilerplate",
      docstring = "local F = function(args)\n\treturn \nend",
    },
    "local ${1:F} = function(${2:args})\n\t${3|return ,|}${0}\nend"
  ),
  node.parse_snippet(
    {
      trig = "funcanon",
      name = "Anonymous Function",
      dscr = "Anonymous Function Boilerplate",
      docstring = "function(args)\n\treturn \nend",
    },
    "function(${1:args})\n\t${2|return ,|}${0}\nend"
  ),
  node.parse_snippet(
    {
      trig = "module",
      name = "Module",
      dscr = "Module Boilerplate",
      docstring = "local M = {}\n\n\n\nreturn M",
    },
    "local ${1:M} = {}\n\n$0\n\nreturn $1"
  ),
}

return S
