require 'notify'.setup({
    background_colour = "#000000",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 1,
    -- render = "wrapped-compact",
    render = "default",
    stages = "slide",
    time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
    },
    timeout = 3000,
    top_down = true,
    max_width = 30, -- max number of cols for msg
    -- max_height = 50, -- max number of lines for msg
    nvim_open_win = {
        opacity = 40
    }
})
