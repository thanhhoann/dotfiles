local wezterm = require 'wezterm'

return {
    -- FONTS
    font = wezterm.font 'GoMono Nerd Font Mono',
    font_size = 17.0,

    -- COLOR SCHEME
    color_scheme = 'tokyonight',

    -- WINDOW
    enable_tab_bar = false,
    window_decorations = "RESIZE",
    window_background_opacity = 0.8,
    macos_window_background_blur = 30,

    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 0,
    },

    -- KEY CONTROLS
    keys = {
        { key = 'f', mods = 'CTRL', action = wezterm.action.ToggleFullScreen },
    },
    mouse_bindings = {
        -- Ctrl-click will open the link under the mouse cursor
        {
            event = { Up = { streak = 1, button = 'Left' } },
            mods = 'CTRL',
            action = wezterm.action.OpenLinkAtMouseCursor,
        },
    },

}
