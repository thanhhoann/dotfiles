local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { char = "󱞩" },
    whitespace = {
        remove_blankline_trail = false,
    },
    scope = { enabled = true },
}
