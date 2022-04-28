--[=[
Prettier using prettierd for { 'html', 'json', 'jsonc', 'yaml', 'markdown', 'graphql' }
```
npm i -g prettier @fsouza/prettierd
```
--]=]

local null_ls = require('null-ls')

null_ls.register({
    name = 'null-ls-Prettier',
    sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = { 'html', 'json', 'jsonc', 'yaml', 'markdown', 'graphql' },
        }),
    },
})
