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
  {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action { SendString = '\x1bb' },
  },
  {
    -- Make Option-Right equivalent to Alt-f; forward-word
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action { SendString = '\x1bf' },
  },
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.DisableDefaultAssignment,
  }
}

return {
  color_scheme = 'nord',
  colors = {
    background = '#242933',
  },
  window_background_opacity = 0.95,
  text_background_opacity = 0.95,
  font_size = 14.0,
  font = wezterm.font_with_fallback {
    "PlemolJP Console NF",
    'Ricty for Powerline',
    'JetBrains Mono',
  },
  keys = keys,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = 'INTEGRATED_BUTTONS | RESIZE',
  window_padding = {
    top = '2.25cell',
  },
  send_composed_key_when_right_alt_is_pressed = false, -- For using right option key as meta key. See https://wezfurlong.org/wezterm/config/keyboard-concepts.html?h=send_composed_key_when_left_alt_is_pressed#macos-left-and-right-option-key
}
