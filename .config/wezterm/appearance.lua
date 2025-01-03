local wezterm = require 'wezterm'

local module = {}

function module.is_dark()
  -- wezterm.gui is not always available, depending on what
  -- environment wezterm is operating in. Just return true
  -- if it's not defined.
  if wezterm.gui then
    return wezterm.gui.get_appearance():find("Dark")
  end
  return true
end

return module
