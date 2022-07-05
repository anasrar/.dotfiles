local ls = require('luasnip')

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
  events = require('luasnip.util.events'),
  ai = require('luasnip.nodes.absolute_indexer'),
  fmt = require('luasnip.extras.fmt').fmt,
  rep = require('luasnip.extras').rep,
  m = require('luasnip.extras').m,
  lambda = require('luasnip.extras').l,
  postfix = require('luasnip.extras.postfix').postfix,
  parse_snippet = ls.parser.parse_snippet,
}

return M
