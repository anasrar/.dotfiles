local safe_require = require("rin.utils.safe_require")
local ok_ls, ls = safe_require("luasnip")
local ok_events, events = safe_require("luasnip.util.events")
local ok_ai, ai = safe_require("luasnip.nodes.absolute_indexer")
local ok_fmt, fmt = safe_require("luasnip.extras.fmt")
local ok_postfix, postfix = safe_require("luasnip.extras.postfix")
local ok_extras, extras = safe_require("luasnip.extras")

if not (ok_ls and ok_events and ok_ai and ok_fmt and ok_postfix and ok_extras) then
  return
end

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
