vim.cmd('packadd packer.nvim')

require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  -- # Util
  use { 'editorconfig/editorconfig-vim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }

  -- # Theme
  use { 'folke/tokyonight.nvim' }
  -- use { 'cocopon/iceberg.vim' }
  -- use { 'rebelot/kanagawa.nvim' }
  -- use { 'EdenEast/nightfox.nvim', branch = 'main' }
  -- use { 'bluz71/vim-nightfly-guicolors' }
  -- use { 'catppuccin/nvim', as = 'catppuccin' }

  -- #Buffer
  use { 'romgrk/barbar.nvim' }

  -- # Terminal
  use { 'akinsho/toggleterm.nvim', branch = 'main' }

  -- # Parser
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- # Finder
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'nvim-telescope/telescope.nvim' }

  -- # Status line
  use { 'nvim-lualine/lualine.nvim' }

  -- # LSP
  use { 'neovim/nvim-lspconfig' }
  -- # LSP Hook
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'jose-elias-alvarez/nvim-lsp-ts-utils' } -- null-ls for TS project
  -- # LSP Completion
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  -- # LSP Snippet
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'L3MON4D3/LuaSnip' }
end)

-- # Theme
require('theme.tokyonight')
-- require('theme.iceberg')
-- require('theme.kanagawa')
-- require('theme.nightfox')
-- require('theme.nightfly')
-- require('theme.catppuccin')

-- # Buffer
require('buffer.barbar')

-- # Terminal
require('terminal.toggleterm')

-- # Parser
require('parser.treesitter')

-- # Finder
require('finder.telescope')

-- # Status line
require('statusline.lualine')

-- # LSP utils
require('LSP.utils.icon')
require('LSP.utils.cmp')

-- # LSP Config
require('LSP.typescript')
require('LSP.css')
require('LSP.svelte')
require('LSP.vue')
--require('LSP.deno')
require('LSP.go')
-- format some markup and dif file
require('LSP.prettier')

-- # Personal Preferences

require('personal.tab')
require('personal.line')
