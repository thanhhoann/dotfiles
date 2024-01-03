require('notify').setup({
    background_colour = "NotifyBackground",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    minimum_width = 30,
    render = "minimal", -- default, minimal, compact, simple, wrapped-compact
    stages = "fade",    -- fade_in_slide_out, fade, slide, static
    timeout = 1000,
    top_down = true
})
