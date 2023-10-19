-- # Automatically git clone when `lazypath` not found
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "--depth=1",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local ok = require("rin.utils.check_requires").check({ "lazy", })
if not ok then
  return
end

local lazy = require("lazy")

-- # Personal
require("rin.personal.main").setup()

lazy.setup({

  -- # Theme
  require("rin.theme.tokyonight").plugin,
  -- require("rin.theme.tokyodark").plugin,
  -- require("rin.theme.iceberg").plugin,
  -- require("rin.theme.kanagawa").plugin,
  -- require("rin.theme.nightfox").plugin,
  -- require("rin.theme.nightfly").plugin,
  -- require("rin.theme.catppuccin").plugin,
  -- require("rin.theme.material").plugin,

  -- # UI
  require("rin.UI.noice").plugin,

  -- # Buffer
  -- require("rin.buffer.barbar").plugin,
  -- require("rin.buffer.bufferline").plugin,
  require("rin.buffer.tabby").plugin,
  require("rin.buffer.buffer_manager").plugin,

  -- # Terminal
  require("rin.terminal.toggleterm").plugin,

  -- # Parser
  require("rin.parser.treesitter").plugin,

  -- # Finder
  require("rin.finder.telescope").plugin,

  -- # File Tree
  -- require("rin.filetree.nvim-tree").plugin,
  require("rin.filetree.neo-tree").plugin,

  -- # Status line
  require("rin.statusline.lualine").plugin,

  -- # Git
  require("rin.git.gitsigns").plugin,

  -- # LSP
  require("rin.LSP.main").plugin,

  -- # Outline
  require("rin.outline.aerial").plugin,

  -- # DAP
  require("rin.DAP.main").plugin,

})
