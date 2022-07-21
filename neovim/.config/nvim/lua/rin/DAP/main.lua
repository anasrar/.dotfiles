-- # DAP

local dap = require('dap')
local dapui = require('dapui')

-- # Sign
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🟧', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='🟩', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🈁', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='⬜', texthl='', linehl='', numhl=''})

-- # DAP Virtual Text
require('nvim-dap-virtual-text').setup({
  enabled = true,
  enabled_commands = true,
  highlight_changed_variables = true,
  highlight_new_as_changed = false,
  show_stop_reason = true,
  commented = false,
  only_first_definition = true,
  all_references = false,
  filter_references_pattern = '<module',
  virt_text_pos = 'eol',
  all_frames = false,
  virt_lines = false,
  virt_text_win_col = nil,
})

-- # DAP UI
require('dapui').setup({
  icons = { expanded = '▾', collapsed = '▸' },
  mappings = {
    expand = { '<CR>', '<2-LeftMouse>' },
    open = 'o',
    remove = 'd',
    edit = 'e',
    repl = 'r',
    toggle = 't',
  },
  expand_lines = vim.fn.has('nvim-0.7'),
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = 'scopes', size = 0.25 },
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        { id = 'repl', size = 0.5 },
        { id = 'console', size = 0.5 },
      },
      size = 10,
      position = 'bottom',
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = 'rounded', -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { 'q', '<Esc>' },
    },
  },
  windows = { indent = 1 },
  render = { 
    max_type_length = nil,
  }
})
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- # Keymap
local buf_map = function(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts or {
    silent = true,
  })
end

buf_map('n', '<Leader>di', ':lua require(\'dap\').toggle_breakpoint()<CR>')
buf_map('n', '<Leader>dI', ':lua require(\'dap\').set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>')
buf_map('n', '<Leader>dp', ':lua require(\'dap\').set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>')
buf_map('n', '<Leader>ds', ':lua require(\'dap\').continue()<CR>')
buf_map('n', '<Leader>dl', ':lua require(\'dap\').run_to_cursor()<CR>')
buf_map('n', '<Leader>dS', ':lua require(\'dap\').disconnect()<CR>')
buf_map('n', '<Leader>dn', ':lua require(\'dap\').step_over()<CR>')
buf_map('n', '<Leader>dN', ':lua require(\'dap\').step_into()<CR>')
buf_map('n', '<Leader>do', ':lua require(\'dap\').step_out()<CR>')

buf_map('n', '<Leader>dww', ':lua require(\'dapui\').toggle()<CR>')
buf_map('n', '<Leader>dw[', ':lua require(\'dapui\').toggle(1)<CR>')
buf_map('n', '<Leader>dw]', ':lua require(\'dapui\').toggle(2)<CR>')

-- # DAP Config
require('rin.DAP.python')
require('rin.DAP.typescript')
require('rin.DAP.cpp')
require('rin.DAP.go')
