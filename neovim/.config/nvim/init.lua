vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
  use {
    'wbthomason/packer.nvim',
  }

  -- # Util
  use {
    'editorconfig/editorconfig-vim',
    config = function() require('rin.personal.main') end
  }
  use {
    'nvim-lua/plenary.nvim',
  }

  -- # Theme
  use {
    'folke/tokyonight.nvim',
    config = function() require('rin.theme.tokyonight') end
  }
  -- use {
  --   'tiagovla/tokyodark.nvim',
  --   config = function() require('rin.theme.tokyodark') end
  -- }
  -- use {
  --   'cocopon/iceberg.vim',
  --   config = function() require('rin.theme.iceberg') end
  -- }
  -- use {
  --   'rebelot/kanagawa.nvim',
  --   config = function() require('rin.theme.kanagawa') end
  -- }
  -- use {
  --   'EdenEast/nightfox.nvim',
  --   branch = 'main',
  --   config = function() require('rin.theme.nightfox') end
  -- }
  -- use {
  --   'bluz71/vim-nightfly-guicolors',
  --   config = function() require('rin.theme.nightly') end
  -- }
  -- use {
  --   'catppuccin/nvim', as = 'catppuccin',
  --   config = function() require('rin.theme.catppuccin') end
  -- }
  -- use {
  --   'marko-cerovac/material.nvim',
  --   config = function() require('rin.theme.material') end
  -- }

  -- #Buffer
  use {
    'romgrk/barbar.nvim',
    config = function() require('rin.buffer.barbar') end
  }
  -- use {
  --   'akinsho/bufferline.nvim',
  --   tag = 'v2.1.0',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function() require('rin.buffer.bufferline') end
  -- }

  -- # Terminal
  use {
    'akinsho/toggleterm.nvim',
    branch = 'main',
    config = function() require('rin.terminal.toggleterm') end
  }

  -- # Parser
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('rin.parser.treesitter') end
  }

  -- # Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = function() require('rin.finder.telescope') end
  }

  -- # File Tree
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons',
  --   },
  --   tag = 'nightly',
  --   config = function() require('rin.filetree.nvim-tree') end
  -- }
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = { 
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function() require('rin.filetree.neo-tree') end
  }

  -- # Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
    },
    config = function() require('rin.statusline.lualine') end
  }

  -- # Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('rin.git.gitsigns') end
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
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      -- # LSP Snippet
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      -- # LSP Status
      'nvim-lua/lsp-status.nvim',
      -- # LSP UI
      {
        'glepnir/lspsaga.nvim',
        branch = 'main',
      }
    },
    config = function() require('rin.LSP.main') end
  }

  -- # DAP
  use {
    'mfussenegger/nvim-dap',
    requires = {
      'rcarriga/nvim-dap-ui',
      'nvim-treesitter/nvim-treesitter',
      'theHamsta/nvim-dap-virtual-text',
      'mxsdev/nvim-dap-vscode-js',
    },
    config = function() require('rin.DAP.main') end
  }
end)
