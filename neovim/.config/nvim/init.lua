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

local safe_require = require("rin.utils.safe_require")
local ok, lazy = safe_require("lazy")

-- # Utils
require("rin.personal.main").setup()

if ok then
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
    require("rin.buffer.barbar").plugin,
    -- require("rin.buffer.bufferline").plugin,

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
end
