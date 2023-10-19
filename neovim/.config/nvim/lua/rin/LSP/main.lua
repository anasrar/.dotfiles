-- # LSP

local M = {}

M.plugin = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- # LSP Hook
    {
      "nvimtools/none-ls.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    },
    -- # LSP Completion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    -- # LSP Snippet
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    -- # LSP UI
    {
      "nvimdev/lspsaga.nvim",
      branch = "main",
    },
  },
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  -- # LSP utils
  require("rin.LSP.utils.icon")
  require("rin.LSP.utils.cmp")
  -- # LSP UI
  require("rin.LSP.utils.lspsaga")
  -- # LSP Config
  require("rin.LSP.languages.typescript")
  require("rin.LSP.languages.css")
  require("rin.LSP.languages.svelte")
  require("rin.LSP.languages.vue")
  require("rin.LSP.languages.astro")
  require("rin.LSP.languages.deno")
  require("rin.LSP.languages.go")
  require("rin.LSP.languages.cpp")
  require("rin.LSP.languages.python")
  require("rin.LSP.languages.lua")
  require("rin.LSP.languages.php")
  require("rin.LSP.languages.csharp")
  -- format some markup and dif file
  require("rin.LSP.languages.prettier")

  -- # LuaSnip
  require("rin.LSP.luasnip.main")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
