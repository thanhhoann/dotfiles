---@type Wezterm
local wezterm = require("wezterm")
local config = wezterm.config_builder()

wezterm.log_info("Reloading...")

require("tabs").setup(config)
require("links").setup(config)

config.front_end = "WebGpu"
config.front_end = "OpenGL"
config.enable_wayland = true
config.webgpu_power_preference = "HighPerformance"

-- Cursor

-- Fonts
config.font_size = 16.0
-- config.font = wezterm.font("FantasqueSansMono Nerd Font Mono")
-- config.font = wezterm.font("EnvyCodeR Nerd Font Mono")
-- config.font = wezterm.font("FiraCode Nerd Font Mono")
-- config.font = wezterm.font("Monofur Nerd Font Mono")
-- config.font = wezterm.font("mononoki Nerd Font Mono")
-- config.font = wezterm.font("0xProto Nerd Font Mono")
config.font = wezterm.font("MonaspiceRn Nerd Font Propo")
config.bold_brightens_ansi_colors = true

-- Colorscheme
config.color_scheme = "tokyonight"

-- Window
-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.7
config.macos_window_background_blur = 0

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

return config --[[@as Wezterm]]
