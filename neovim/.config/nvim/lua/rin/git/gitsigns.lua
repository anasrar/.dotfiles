require('gitsigns').setup({
  signs = {
    add          = { hl = 'GitSignsAdd'   , text = '▍', numhl = 'GitSignsAddNr'   , linehl = 'GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '▍', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '▍', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '▍', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '▍', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'rounded',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
  on_attach = function(bufnr)
    vim.api.nvim_set_hl(0, 'GitSignsAdd', {
      fg = '#b4be82',
    })
    vim.api.nvim_set_hl(0, 'GitSignsChange', {
      fg = '#84a0c6',
    })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', {
      fg = '#e27878',
    })

    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or { silent = true }
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>g]', ':Gitsigns next_hunk<CR>')
    map('n', '<leader>g[', ':Gitsigns prev_hunk<CR>')
    map('n', '<leader>gd', gs.diffthis)
    map('n', '<leader>gp', gs.preview_hunk)
    map('n', '<leader>gb', function() gs.blame_line{full=true} end)
    map('n', '<leader>gtb', gs.toggle_current_line_blame)
    map('n', '<leader>gtd', gs.toggle_deleted)
  end
})
