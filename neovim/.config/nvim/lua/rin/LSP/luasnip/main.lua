local luasnip = require("luasnip")
local types = require("luasnip.util.types")

-- # Setup
luasnip.config.setup({
  history = true,
  update_events = "TextChangedI",
  region_check_events = "InsertEnter",
  delete_check_events = "TextChanged",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{ "", "LuaSnipChoiceNode" }}
      }
    },
    [types.insertNode] = {
      active = {
        virt_text = {{ "פֿ", "LuaSnipInsertNode" }}
      }
    }
  },
})

-- # Color bind
vim.cmd("hi link LuaSnipChoiceNode Boolean")
vim.cmd("hi link LuaSnipInsertNode String")

-- # Keymap
local keymap = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

keymap({ "i", "s" }, "<C-j>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end)
keymap({ "i", "s" }, "<C-k>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end)
keymap({ "i", "s" }, "<C-l>", function()
  if luasnip.choice_active() then
      luasnip.change_choice(1)
  end
end)

-- # Snippet
luasnip.add_snippets("all", require("rin.LSP.luasnip.languages.all"))
luasnip.add_snippets("javascript", require("rin.LSP.luasnip.languages.javascript"))
luasnip.add_snippets("javascriptreact", require("rin.LSP.luasnip.languages.javascriptreact"))
luasnip.add_snippets("typescript", require("rin.LSP.luasnip.languages.typescript"))
luasnip.add_snippets("typescriptreact", require("rin.LSP.luasnip.languages.typescriptreact"))
luasnip.add_snippets("astro", require("rin.LSP.luasnip.languages.astro"))
luasnip.add_snippets("lua", require("rin.LSP.luasnip.languages.lua"))
luasnip.add_snippets("prisma", require("rin.LSP.luasnip.languages.prisma"))
