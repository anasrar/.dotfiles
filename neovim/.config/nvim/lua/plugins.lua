vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
  use {
    'wbthomason/packer.nvim',
  }

  -- # Util
  use {
    'editorconfig/editorconfig-vim',
    config = function() require('personal.main') end
  }
  use {
    'nvim-lua/plenary.nvim',
  }

  -- # Theme
  use {
    'folke/tokyonight.nvim',
    config = function() require('theme.tokyonight') end
  }
  -- use {
  --   'cocopon/iceberg.vim',
  --   config = function() require('theme.iceberg') end
  -- }
  -- use {
  --   'rebelot/kanagawa.nvim',
  --   config = function() require('theme.kanagawa') end
  -- }
  -- use {
  --   'EdenEast/nightfox.nvim',
  --   branch = 'main',
  --   config = function() require('theme.nightfox') end
  -- }
  -- use {
  --   'bluz71/vim-nightfly-guicolors',
  --   config = function() require('theme.nightly') end
  -- }
  -- use {
  --   'catppuccin/nvim', as = 'catppuccin',
  --   config = function() require('theme.catppuccin') end
  -- }

  -- #Buffer
  use {
    'romgrk/barbar.nvim',
    config = function() require('buffer.barbar') end
  }

  -- # Terminal
  use {
    'akinsho/toggleterm.nvim',
    branch = 'main',
    config = function() require('terminal.toggleterm') end
  }

  -- # Parser
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('parser.treesitter') end
  }

  -- # Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = function() require('finder.telescope') end
  }

  -- # File Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly',
    config = function() require('filetree.nvim-tree') end
  }

  -- # Status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('statusline.lualine') end
  }

  -- # LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- # LSP Hook
      'jose-elias-alvarez/null-ls.nvim',
      'jose-elias-alvarez/nvim-lsp-ts-utils', -- null-ls for TS project
      -- # LSP Completion
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      -- # LSP Snippet
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
    },
    config = function() require('LSP.main') end
  }

  -- # DAP
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      'nvim-treesitter/nvim-treesitter',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function() require('DAP.main') end
  }
end)
