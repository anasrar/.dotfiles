--[=[
Prettier using prettierd for { "html", "json", "jsonc", "yaml", "markdown", "graphql" }
```
npm i -g prettier @fsouza/prettierd
```
--]=]

local safe_require = require("rin.utils.safe_require")
local ok_null_ls, null_ls = safe_require("null-ls")

if not ok_null_ls then
  return
end

null_ls.register({
  name = "null-ls-Prettier",
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "html", "yaml", "graphql" },
    }),
  },
})

-- Avoid conflict with deno
null_ls.register({
  name = "null-ls-Prettier-not-deno",
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      filetypes = { "json", "jsonc", "markdown" },
      condition = function(utils)
        return not utils.root_has_file({ "deno.json", "deno.jsonc" })
      end,
    }),
  },
})
