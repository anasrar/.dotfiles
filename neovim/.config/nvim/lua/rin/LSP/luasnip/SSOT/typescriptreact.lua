local node = require("rin.LSP.luasnip.utils.node")
local M = {}

local S = {
  node.s(
    {
      trig = "us",
      name = "React Hook useState",
      dscr = "React Hook useState Boilerplate",
      docstring = "const [state, setState] = useState<T>(val)"
    },
    node.fmt(
      "const [{1}, set{2}] = useState{3}({4});",
      {
        node.i(1, "state"),
        node.f(
          function(args)
            return args[1][1]:gsub("^%l", string.upper)
          end,
          {1}
        ),
        node.c(2, {
          node.fmt(
            "<{}>",
            {
              node.i(1, "T")
            }
          ),
          node.t(""),
        }),
        node.i(3, "val")
      }
    )
  ),
  node.parse_snippet(
    {
      trig = "ue",
      name = "React Hook useEffect",
      dscr = "React Hook useEffect Boilerplate",
      docstring = "useEffect(() => {\n\n\t\n}, [dependency]);",
    },
    "useEffect(() => {\n\n\t$0\n}, [${1}]);"
  ),
  node.parse_snippet(
    {
      trig = "uc",
      name = "React Hook useCallback",
      dscr = "React Hook useCallback Boilerplate",
      docstring = "useCallback(() => {\n\n}, [dependency]);",
    },
    "useCallback(($1) => {\n\t$0\n}, [$2]);"
  ),
  node.s(
    {
      trig = "rfc",
      name = "React Functional Components",
      dscr = "React Component Boilerplate",
      docstring = "const Component: FC<T> = () => {\n\tretrun (<div>text</div>)\n}"
    },
    {
      node.t("const "),
      node.i(1, "Component"),
      node.t(": FC"),
      node.c(2, {
        node.fmt(
          "<{}>",
          { node.i(1, "T"), }
        ),
        node.t(""),
      }),
      node.t({
        " = () => {",
        "\treturn (<"
      }),
      node.i(3, "div"),
      node.t(">"),
      node.i(4, "text"),
      node.t("</"),
      node.rep(3),
      node.t({
        ">);",
        "}",
      }),
    }
  ),
  node.parse_snippet(
    {
      trig = "<<",
      name = "React XML",
      dscr = "React XML Boilerplate",
      docstring = "<div></div>",
    },
    "<${1:div}>$0</$1>"
  ),
  node.parse_snippet(
    {
      trig = "<<<",
      name = "React XML Self-close",
      dscr = "React XML Self-close Boilerplate",
      docstring = "<div />",
    },
    "<${1:div} />"
  ),
}

M.extend = function(snippets)
  for _, s in ipairs(S) do
    table.insert(snippets, s)
  end
end

return M
