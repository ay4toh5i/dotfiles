local wezterm = require 'wezterm'

local keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitPane { 
      direction = 'Right',
      top_level = true,
    }
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitPane { 
      direction = 'Down',
      top_level = true,
    }
  },
  {
    key = '[',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = ']',
    mods = 'CMD',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
}

return {
  color_scheme = 'iceberg-dark',
  window_background_opacity = 0.7,
  text_background_opacity = 0.7,
  font_size = 16.0,
  font = wezterm.font 'Ricty for Powerline',
  keys = keys,
}