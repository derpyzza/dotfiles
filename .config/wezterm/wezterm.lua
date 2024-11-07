-- Pull in the wezterm API
local wezterm = require 'wezterm'
local appearance = require 'appearance'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- if appearance.is_dark() then
config.color_scheme = 'Kasugano (terminal.sexy)'
-- else
--   config.color_scheme = 'Catppuccin Latte'
-- end
config.font = wezterm.font 'Fira Code'

-- config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.keys = {
  {
    key = 'T',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'W',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },

  {
    -- enter aka return aka carriage return
    key = '\r',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
}

config.window_frame = {

  font = wezterm.font { family = 'Fira Code', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 12.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

wezterm.on('update-status', function(window)
  -- Grab the utf8 character for the "powerline" left facing
  -- solid arrow.
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Grab the current window's configuration, and from it the
  -- palette (this is the combination of your chosen colour scheme
  -- including any overrides).
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
    -- First, we draw the arrow...
    { Background = { Color = 'none' } },
    { Foreground = { Color = bg } },
    { Text = SOLID_LEFT_ARROW },
    -- Then we draw our text
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },
  }))
end)



-- and finally, return the configuration to wezterm
return config
