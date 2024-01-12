vim.keymap.set('n', '<leader>t', ':Themery<CR>')

require("themery").setup({
    livePreview = true, -- Apply theme while browsing. Default to true.
    themeConfigFile = "~/.config/nvim/init.lua",
    themes = {
        -- https://github.com/linrongbin16/colorbox.nvim/blob/main/COLORSCHEMES.md
        {
            name = "tokyo_night_Default",
            colorscheme = "tokyonight",
        },
        {
            name = "tokyo_night_Night",
            colorscheme = "tokyonight-night",
        },
        {
            name = "tokyo_night_Moon",
            colorscheme = "tokyonight-moon",
        },
        {
            name = "tokyo_night_Storm",
            colorscheme = "tokyonight-storm",
        },

        --------------------------------------
        {
            name = "material_Darker",
            colorscheme = "material-darker",
        },
        {
            name = "material_Oceanic",
            colorscheme = "material-oceanic",
        },
        {
            name = "material_Palenight",
            colorscheme = "material-palenight",
        },
        {
            name = "material_Deep Ocean",
            colorscheme = "material-deep-ocean",
        },

        --------------------------------------
        {
            name = "catppuccin_Default",
            colorscheme = "catppuccin",
        },
        {
            name = "catppuccin_Frappe",
            colorscheme = "catppuccin-frappe",
        },
        {
            name = "catppuccin_Macchiato",
            colorscheme = "catppuccin-macchiato",
        },
        {
            name = "catppuccin_Mocha",
            colorscheme = "catppuccin-mocha",
        },

        --------------------------------------
        {
            name = "kanagawa",
            colorscheme = "kanagawa",
        },
        {
            name = "kanagawa_Dragon",
            colorscheme = "kanagawa-dragon",
        },
        {
            name = "kanagawa_Wave",
            colorscheme = "kanagawa-wave",
        },

        --------------------------------------
        {
            name = "paper_color",
            colorscheme = "PaperColor"
        },

        --------------------------------------
        {
            name = "everforest",
            colorscheme = "everforest"
        },

        --------------------------------------
        {
            name = "iceberg",
            colorscheme = "everforest"
        },

        --------------------------------------
        {
            name = "seoul256",
            colorscheme = "seoul256"
        },

        --------------------------------------
        {
            name = "gruvbox-material",
            colorscheme = "gruvbox-material"
        },

        --------------------------------------
        {
            name = "rose-pine",
            colorscheme = "rose-pine"
        },
        {
            name = "rose-pine-dawn",
            colorscheme = "rose-pine-dawn"
        },
        {
            name = "rose-pine-main",
            colorscheme = "rose-pine-main"
        },
        {
            name = "rose-pine-moon",
            colorscheme = "rose-pine-moon"
        },

        --------------------------------------
        {
            name = "monokai",
            colorscheme = "monokai"
        },

        --------------------------------------
        {
            name = "sonokai",
            colorscheme = "sonokai"
        },

        --------------------------------------
        {
            name = "dracula",
            colorscheme = "dracula"
        },

        --------------------------------------
        {
            name = "onedark",
            colorscheme = "onedark"
        },

        --------------------------------------
        {
            name = "tender",
            colorscheme = "tender"
        },

        --------------------------------------
        {
            name = "solarized8",
            colorscheme = "solarized8"
        },
        {
            name = "solarized8_flat",
            colorscheme = "solarized8_flat"
        },
        {
            name = "solarized8_high",
            colorscheme = "solarized8_high"
        },
        {
            name = "solarized8_low",
            colorscheme = "solarized8_low"
        },

        --------------------------------------
        {
            name = "oceanic-next",
            colorscheme = "OceanicNext"
        },

        --------------------------------------
        {
            name = "github_dark",
            colorscheme = "github_dark"
        },
        {
            name = "github_dark_colorblind",
            colorscheme = "github_dark_colorblind"
        },
        {
            name = "github_dark_default",
            colorscheme = "github_dark_default"
        },
        {
            name = "github_dark_dimmed",
            colorscheme = "github_dark_dimmed"
        },
        {
            name = "github_dark_high_contrast",
            colorscheme = "github_dark_high_contrast"
        },
        {
            name = "github_dark_tritanopia",
            colorscheme = "github_dark_tritanopia"
        },

        --------------------------------------
        {
            name = "github_dark",
            colorscheme = "github_dark"
        },

        --------------------------------------
        {
            name = "gruvbox",
            colorscheme = "gruvbox"
        },

        --------------------------------------
        {
            name = "codedark",
            colorscheme = "codedark"
        },

        --------------------------------------
        {
            name = "zenburn",
            colorscheme = "zenburn"
        },

        --------------------------------------
        {
            name = "apprentice",
            colorscheme = "apprentice"
        },

        --------------------------------------
        {
            name = "oxocarbon",
            colorscheme = "oxocarbon"
        },

        --------------------------------------
        {
            name = "edge",
            colorscheme = "edge"
        },

        --------------------------------------
        {
            name = "lucario",
            colorscheme = "lucario"
        },
    },
})
