local wezterm = require('wezterm')
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_background_opacity = 0.925
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.initial_cols = 80
config.initial_rows = 24

config.set_environment_variables = {
  TERM = 'xterm-256color',
}

config.custom_block_glyphs = false
config.font = wezterm.font_with_fallback({
  {
    family = 'JetBrains Mono',
    weight = 'Bold',
  },
  {
    family = 'Symbols Nerd Font',
    scale = 1.15
  },
})
config.font_size = 12
-- config.line_height = 1.0

config.color_scheme = 'tokyonight'

config.disable_default_key_bindings = true
config.keys = {
  {
    key = 'c',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CopyTo('Clipboard'),
  },
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PasteFrom('Clipboard'),
  },
  {
    key = 'Enter',
    mods = 'CTRL|SHIFT',
    action = 'SpawnWindow',
  },
  {
    key = 'raw:102',
    action = wezterm.action.SendKey({ key = '\x1b' }),
  },
  {
    key = 'raw:101',
    action = wezterm.action.SendKey({ key = '\x5c' }),
  },
}

return config
