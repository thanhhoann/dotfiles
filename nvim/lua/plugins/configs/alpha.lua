local alpha = require 'alpha'
local startify = require 'alpha.themes.startify'
local dashboard = require 'alpha.themes.dashboard'

dashboard.section.buttons.val = {
    -- dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
    -- dashboard.button("f", "Find files", ":Telescope find_files<CR>"),
    -- dashboard.button("o", "Recent", ":Telescope oldfiles<CR>"),
    -- dashboard.button("t", "Choose a theme", "<leader>t"),
    -- dashboard.button("q", "Quit NVIM", ":qa<CR>"),
    dashboard.button("l", "lazy.lua", ":e ~/.config/nvim/lua/configs/lazy.lua<CR>"),
    dashboard.button("o", "Obsidian", ":e ~/core_machine/desktop/studies<CR>"),
}

dashboard.section.header.val = {
    [[]],
    [[ 2024 GOALS]],
    [[]],
    [[ Appearance = { 15%, 75kg }]],
    [[]],
    [[ LifeStyle = { sleep < 23:30, less porn, keep focus }]],
    [[]],
    [[ Tech Studies = { ]],
    [[]],
    [[  󰛄 Data Structures & Algorithms = { fundamentals }]],
    [[]],
    [[  󰛄 Flutter = { complete Udemy course }]],
    [[]],
    [[}]],
    [[]],
    [[ Misc. = { ]],
    [[]],
    [[  󰛄 Neovim = { keep simple & fast, less keystroke }]],
    [[]],
    [[  󰛄 Billiards = { practice fundamentals, less gambles, FOCUS }]],
    [[]],
    [[  󰛄 Speed Typing = { 110 wpm }]],
    [[]],
    [[}]],
    [[]],
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

-- [[                                                                                                 ]],
-- [[                                                                                                 ]],
-- [[                                                                                                 ]],
-- [[ ████████▄   ▄█     ▄████████  ▄████████  ▄█     ▄███████▄  ▄█        ▄█  ███▄▄▄▄      ▄████████ ]],
-- [[ ███   ▀███ ███    ███    ███ ███    ███ ███    ███    ███ ███       ███  ███▀▀▀██▄   ███    ███ ]],
-- [[ ███    ███ ███▌   ███    █▀  ███    █▀  ███▌   ███    ███ ███       ███▌ ███   ███   ███    █▀  ]],
-- [[ ███    ███ ███▌   ███        ███        ███▌   ███    ███ ███       ███▌ ███   ███  ▄███▄▄▄     ]],
-- [[ ███    ███ ███▌ ▀███████████ ███        ███▌ ▀█████████▀  ███       ███▌ ███   ███ ▀▀███▀▀▀     ]],
-- [[ ███    ███ ███           ███ ███    █▄  ███    ███        ███       ███  ███   ███   ███    █▄  ]],
-- [[ ███   ▄███ ███     ▄█    ███ ███    ███ ███    ███        ███▌    ▄ ███  ███   ███   ███    ███ ]],
-- [[ ████████▀  █▀    ▄████████▀  ████████▀  █▀    ▄████▀      █████▄▄██ █▀    ▀█   █▀    ██████████ ]],
-- [[                                                           ▀                                     ]],
-- [[                                                                                                 ]],