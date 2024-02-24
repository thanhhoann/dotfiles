require 'notify'.setup({
    background_colour = "#000000",
    fps = 60,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    render = "wrapped-compact",
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
