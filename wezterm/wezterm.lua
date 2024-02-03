local wezterm = require 'wezterm'
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- FONTS
config.font = wezterm.font 'GoMono Nerd Font Mono'
config.font_size = 15.0

-- COLOR SCHEME
config.color_scheme = 'tokyonight_night'

-- WINDOW

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.85

config.window_padding = {
  left = 15,
  right = 15,
  top = 15,
  bottom = 0,
}

return config
