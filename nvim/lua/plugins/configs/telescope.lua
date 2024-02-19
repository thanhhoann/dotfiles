local builtin = require('telescope.builtin')

require("telescope").setup({
    defaults = {
        layout_config = {
            horizontal = {
                width = 0.99,
                preview_width = 0.6,
            }
        }
    },
    pickers = {
        lsp_references = {
            layout_config = {
                preview_width = 0.65,
            },
        }
    },
    extensions = {
        lazy = {
            -- Optional theme (the extension doesn't set a default theme)
            theme = "ivy",
            -- Whether or not to show the icon in the first column
            show_icon = true,
            -- Mappings for the actions
            mappings = {
                open_in_browser = "<C-o>",
                open_in_file_browser = "<M-b>",
                open_in_find_files = "<C-f>",
                open_in_live_grep = "<C-g>",
                open_in_terminal = "<C-t>",
                open_plugins_picker = "<C-b>", -- Works only after having called first another action
                open_lazy_root_find_files = "<C-r>f",
                open_lazy_root_live_grep = "<C-r>g",
                change_cwd_to_plugin = "<C-c>d",
            },
            -- Configuration that will be passed to the window that hosts the terminal
            -- For more configuration options check 'nvim_open_win()'
            terminal_opts = {
                relative = "editor",
                style = "minimal",
                border = "rounded",
                title = "Telescope lazy",
                title_pos = "center",
                width = 0.5,
                height = 0.5,
            },
        },

        adjacent = {
            level = 1 -- default
        },

        undo = {
            side_by_side = false,
            layout_config = {
                preview_width = 0.65,
            },
        },

        menu = {
            theme = 'ivy',
            default = {
                items = {
                    { display = "Change colorscheme", value = "Themery" },
                },
            },
        },

        ["ui-select"] = {
            require 'telescope.themes'.get_dropdown {
                codeactions = true
            }
        },

        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
        },
    },
})

require "telescope".load_extension "lazy"
require "telescope".load_extension "adjacent"
require "telescope".load_extension "menu"
require "telescope".load_extension "ui-select"
require "telescope".load_extension "live_grep_args"
require "telescope".load_extension "neoclip"

-- require("telescope").load_extension "undo"
-- require("telescope").load_extension "noice"
-- require("telescope").load_extension "flutter"