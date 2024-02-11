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
    -- maximum_width = 5,
    -- maximum_height = 15,
    render = "minimal",
    stages = "fade",
    time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
    },
    timeout = 2000,
    top_down = false
})
