local alpha = require 'alpha'
local startify = require 'alpha.themes.startify'
local dashboard = require 'alpha.themes.dashboard'

dashboard.section.buttons.val = {
    dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "Find files", ":Telescope find_files<CR>"),
    dashboard.button("o", "Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("l", "Open lazy.lua", ":e lua/configs/lazy.lua<CR>"),
    dashboard.button("t", "Choose a theme", "<leader>t"),
    dashboard.button("q", "Quit NVIM", ":qa<CR>"),
}

dashboard.section.header.val = {
    [[                                                                                                 ]],
    [[                                                                                                 ]],
    [[                                                                                                 ]],
    [[ ████████▄   ▄█     ▄████████  ▄████████  ▄█     ▄███████▄  ▄█        ▄█  ███▄▄▄▄      ▄████████ ]],
    [[ ███   ▀███ ███    ███    ███ ███    ███ ███    ███    ███ ███       ███  ███▀▀▀██▄   ███    ███ ]],
    [[ ███    ███ ███▌   ███    █▀  ███    █▀  ███▌   ███    ███ ███       ███▌ ███   ███   ███    █▀  ]],
    [[ ███    ███ ███▌   ███        ███        ███▌   ███    ███ ███       ███▌ ███   ███  ▄███▄▄▄     ]],
    [[ ███    ███ ███▌ ▀███████████ ███        ███▌ ▀█████████▀  ███       ███▌ ███   ███ ▀▀███▀▀▀     ]],
    [[ ███    ███ ███           ███ ███    █▄  ███    ███        ███       ███  ███   ███   ███    █▄  ]],
    [[ ███   ▄███ ███     ▄█    ███ ███    ███ ███    ███        ███▌    ▄ ███  ███   ███   ███    ███ ]],
    [[ ████████▀  █▀    ▄████████▀  ████████▀  █▀    ▄████▀      █████▄▄██ █▀    ▀█   █▀    ██████████ ]],
    [[                                                           ▀                                     ]],
    [[                                                                                                 ]],
}



alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])


-- [[                                                                        ]],
-- [[                                                                        ]],
-- [[                                                                        ]],
-- [[                                                                        ]],
-- [[  █████▒█    ██  ▄████▄   ██ ▄█▀    ██░ ██  ▄▄▄       ██▀███  ▓█████▄   ]],
-- [[ ▓██   ▒ ██  ▓██▒▒██▀ ▀█   ██▄█▒    ▓██░ ██▒▒████▄    ▓██ ▒ ██▒▒██▀ ██▌ ]],
-- [[ ▒████ ░▓██  ▒██░▒▓█    ▄ ▓███▄░    ▒██▀▀██░▒██  ▀█▄  ▓██ ░▄█ ▒░██   █▌ ]],
-- [[ ░▓█▒  ░▓▓█  ░██░▒▓▓▄ ▄██▒▓██ █▄    ░▓█ ░██ ░██▄▄▄▄██ ▒██▀▀█▄  ░▓█▄   ▌ ]],
-- [[ ░▒█░   ▒▒█████▓ ▒ ▓███▀ ░▒██▒ █▄   ░▓█▒░██▓ ▓█   ▓██▒░██▓ ▒██▒░▒████▓  ]],
-- [[  ▒ ░   ░▒▓▒ ▒ ▒ ░ ░▒ ▒  ░▒ ▒▒ ▓▒    ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒▓ ░▒▓░ ▒▒▓  ▒  ]],
-- [[  ░     ░░▒░ ░ ░   ░  ▒   ░ ░▒ ▒░    ▒ ░▒░ ░  ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ▒  ▒  ]],
-- [[  ░ ░    ░░░ ░ ░ ░        ░ ░░ ░     ░  ░░ ░  ░   ▒     ░░   ░  ░ ░  ░  ]],
-- [[           ░     ░ ░      ░  ░       ░  ░  ░      ░  ░   ░        ░     ]],
-- [[                 ░                                              ░       ]],
-- [[                                                                        ]],
-- [[                                                                        ]],
-- [[                                                                        ]],
