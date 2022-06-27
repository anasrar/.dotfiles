local nightfox = require('nightfox')

nightfox.setup({
  options = {
    transparent = true,
    terminal_colors = true,
    styles = {
      commnets = "italic",
      keywords = "bold",
      types = "italic,bold",
    },
  }
})

vim.cmd("colorscheme nightfox")
