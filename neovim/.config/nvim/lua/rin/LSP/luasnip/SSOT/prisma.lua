local node = require('rin.LSP.luasnip.utils.node')
local M = {}

local S = {
  node.parse_snippet(
    {
      trig = 'ds',
      name = 'Prisma Data Source',
      dscr = 'Prisma Data Source Boilerplate',
      docstring = 'datasource db {\n\tprovider = "postgresql"\n\turl      = env("DATABASE_URL")\n}',
    },
    'datasource db {\n\tprovider = "${1|postgresql,mysql,sqlite,sqlserver,mongodb,cockroachdb|}"\n\turl      = env("DATABASE_URL")\n}\n$0'
  ),
  node.parse_snippet(
    {
      trig = 'gen',
      name = 'Prisma Generator',
      dscr = 'Prisma Generator Boilerplate',
      docstring = 'generator client {\n\tprovider = "prisma-client-js"\n}\n$0',
    },
    'generator client {\n\tprovider = "prisma-client-js"\n}\n$0'
  ),
  node.parse_snippet(
    {
      trig = 'mod',
      name = 'Prisma Model',
      dscr = 'Prisma Model Boilerplate',
      docstring = 'model M {\n\tid String @id @default(auto()) @map("_id") @db.ObjectIdn\n}',
    },
    'model ${1:M} {\n\t${2|id Int @id @default(autoincrement()),id String @id @default(auto()) @map("_id") @db.ObjectId|}\n\t$0\n}'
  ),
  node.parse_snippet(
    {
      trig = 'fi',
      name = 'Prisma Field',
      dscr = 'Prisma Field Boilerplate',
      docstring = 'N T ',
    },
    '${1:N} ${1:T} $0'
  ),
  node.parse_snippet(
    {
      trig = 'fib',
      name = 'Prisma Field Boolean',
      dscr = 'Prisma Field Boolean Boilerplate',
      docstring = 'N Boolean @default(false)',
    },
    '${1:N} Boolean @default(${2|false,true|})'
  ),
  node.parse_snippet(
    {
      trig = 'fis',
      name = 'Prisma Field String',
      dscr = 'Prisma Field String Boilerplate',
      docstring = 'N String ',
    },
    '${1:N} String '
  ),
  node.parse_snippet(
    {
      trig = 'fii',
      name = 'Prisma Field Integer',
      dscr = 'Prisma Field Integer Boilerplate',
      docstring = 'N Int ',
    },
    '${1:N} Int '
  ),
  node.parse_snippet(
    {
      trig = 'fid',
      name = 'Prisma Field DateTime',
      dscr = 'Prisma Field DateTime Boilerplate',
      docstring = 'N DateTime @default(now())',
    },
    '${1:N} DateTime @default(now())'
  ),
  node.parse_snippet(
    {
      trig = 'uni',
      name = 'Prisma Unique Field',
      dscr = 'Prisma Unique Field Boilerplate',
      docstring = '@unique',
    },
    '@unique'
  ),
  node.parse_snippet(
    {
      trig = 'unim',
      name = 'Prisma Multiple Unique Field',
      dscr = 'Prisma Multiple Unique Field Boilerplate',
      docstring = '@@unique([])',
    },
    '@unique([$0])'
  ),
  node.parse_snippet(
    {
      trig = 'rel',
      name = 'Prisma Relations Field',
      dscr = 'Prisma Relations Field Boilerplate',
      docstring = '@relation(fields: [F], references: [T])\n\tF Int',
    },
    '@relation(fields: [${1:F}], references: [${2:T}])\n\t$1 ${3:Int}'
  ),
}

M.extend = function(snippets)
  for _, s in ipairs(S) do
    table.insert(snippets, s)
  end
end

return M
