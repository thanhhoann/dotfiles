require 'lspsaga'.setup({
    diagnostic = {
        max_height = 0.8,
        keys = {
            quit = { 'q', '<ESC>' }
        }
    },
    code_action = {
        show_server_name = true,
        extend_gitsigns = true
    }
})
