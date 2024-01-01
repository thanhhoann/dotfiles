local alpha = require 'alpha'
local startify = require 'alpha.themes.startify'
local dashboard = require 'alpha.themes.dashboard'

dashboard.section.buttons.val = {
    dashboard.button("n", "New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("f", "Find file", ":Telescope find_files<CR>"),
    dashboard.button("l", "Lazy Update", ":Lazy update<CR>"),
    dashboard.button("q", "Quit NVIM", ":qa<CR>"),
}

dashboard.section.header.val = {
    [[                                                                        ]],
    [[                                                                        ]],
    [[                                                                        ]],
    [[                                                                        ]],
    [[  █████▒█    ██  ▄████▄   ██ ▄█▀    ██░ ██  ▄▄▄       ██▀███  ▓█████▄   ]],
    [[ ▓██   ▒ ██  ▓██▒▒██▀ ▀█   ██▄█▒    ▓██░ ██▒▒████▄    ▓██ ▒ ██▒▒██▀ ██▌ ]],
    [[ ▒████ ░▓██  ▒██░▒▓█    ▄ ▓███▄░    ▒██▀▀██░▒██  ▀█▄  ▓██ ░▄█ ▒░██   █▌ ]],
    [[ ░▓█▒  ░▓▓█  ░██░▒▓▓▄ ▄██▒▓██ █▄    ░▓█ ░██ ░██▄▄▄▄██ ▒██▀▀█▄  ░▓█▄   ▌ ]],
    [[ ░▒█░   ▒▒█████▓ ▒ ▓███▀ ░▒██▒ █▄   ░▓█▒░██▓ ▓█   ▓██▒░██▓ ▒██▒░▒████▓  ]],
    [[  ▒ ░   ░▒▓▒ ▒ ▒ ░ ░▒ ▒  ░▒ ▒▒ ▓▒    ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒▓ ░▒▓░ ▒▒▓  ▒  ]],
    [[  ░     ░░▒░ ░ ░   ░  ▒   ░ ░▒ ▒░    ▒ ░▒░ ░  ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ▒  ▒  ]],
    [[  ░ ░    ░░░ ░ ░ ░        ░ ░░ ░     ░  ░░ ░  ░   ▒     ░░   ░  ░ ░  ░  ]],
    [[           ░     ░ ░      ░  ░       ░  ░  ░      ░  ░   ░        ░     ]],
    [[                 ░                                              ░       ]],
    [[                                                                        ]],
    [[                                                                        ]],
    [[                                                                        ]],
}



alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
