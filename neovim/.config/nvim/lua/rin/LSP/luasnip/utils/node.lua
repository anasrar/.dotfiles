local ok = require("rin.utils.check_requires").check({
  "luasnip",
})
if not ok then
  return
end

local ls = require("luasnip")
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt")
local postfix = require("luasnip.extras.postfix")
local extras = require("luasnip.extras")

local M = {
  s = ls.snippet,
  sn = ls.snippet_node,
  isn = ls.indent_snippet_node,
  t = ls.text_node,
  i = ls.insert_node,
  f = ls.function_node,
  c = ls.choice_node,
  d = ls.dynamic_node,
  r = ls.restore_node,
  events = events,
  ai = ai,
  fmt = fmt.fmt,
  rep = extras.rep,
  m = extras.m,
  lambda = extras.l,
  postfix = postfix.postfix,
  parse_snippet = ls.parser.parse_snippet,
}

return M
