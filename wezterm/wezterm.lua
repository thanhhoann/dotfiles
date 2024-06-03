local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- FONTS
-- config.font = wezterm.font("FantasqueSansMono Nerd Font Mono")
-- config.font = wezterm.font("EnvyCodeR Nerd Font Mono")
-- config.font = wezterm.font("FiraCode Nerd Font Mono")
-- config.font = wezterm.font("Monofur Nerd Font Mono")
-- config.font = wezterm.font("mononoki Nerd Font Mono")
config.font = wezterm.font("0xProto Nerd Font Mono")
config.font_size = 16.0

-- COLOR SCHEME
config.color_scheme = "tokyonight"

-- WINDOW
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 1

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 0,
}

-- KEY CONTROLS
-- keys = {
--     { key = 'f' mods = 'CTRL' action = wezterm.action.ToggleFullScreen }
-- }
config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
