local wezterm = require('wezterm')

return {
  -- debug_key_events = true,
  -- window_decorations = 'NONE',
  window_background_opacity = 0.925,
  enable_tab_bar = false,
  enable_scroll_bar = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  initial_cols = 80,
  initial_rows = 24,

  set_environment_variables = {
    TERM = 'xterm-256color',
  },

  custom_block_glyphs = false,
  font = wezterm.font(
    'RecursiveMonoCslSt Nerd Font',
    {
      weight = 'Medium',
    }
  ),
  font_rules= {
    {
      italic = true,
      font = wezterm.font('RecursiveMonoCslSt Nerd Font', {
        italic = true,
      }),
    },
    {
      intensity = 'Bold',
      font = wezterm.font('RecursiveMonoCslSt Nerd Font', {
        weight = 'ExtraBold',
      }),
    },
    {
      italic = true,
      intensity = 'Bold',
      font = wezterm.font('RecursiveMonoCslSt Nerd Font', {
        italic = true,
        weight = 'ExtraBold',
      }),
    },
  },
  font_size = 10.5,
  line_height = 1.0,
  
  color_scheme = 'tokyonight',

  disable_default_key_bindings = true,
  keys = {
    {
      key = 'c',
      mods = 'CTRL|SHIFT',
      action = 'Copy',
    },
    {
      key = 'v',
      mods = 'CTRL|SHIFT',
      action = 'Paste',
    },
    {
      key = 'Enter',
      mods = 'CTRL|SHIFT',
      action = 'SpawnWindow',
    },
    {
      key = 'v',
      mods = 'CTRL|SHIFT',
      action = 'Paste',
    },
    {
      key = 'raw:102',
      action = wezterm.action.SendKey({ key = '\x1b' }),
    },
    {
      key = 'raw:101',
      action = wezterm.action.SendKey({ key = '\x5c' }),
    },
  },
}
