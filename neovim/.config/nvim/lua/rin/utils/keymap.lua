local M = {}

M.keymap = function(mode, key, command, opts)
  vim.keymap.set(
    mode,
    key,
    command,
    opts or {
      noremap = true,
      silent = true,
    }
  )
end

M.buf_keymap = function(bufnr, mode, key, command, opts)
  opts = opts or {
    silent = true
  }
  opts.buffer = bufnr

  vim.keymap.set(
    mode,
    key,
    command,
    opts
  )
end

return M
