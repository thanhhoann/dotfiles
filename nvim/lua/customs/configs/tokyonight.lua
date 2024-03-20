require("tokyonight").setup({
    style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true,     -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { bold = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = { italic = true },
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "transparent",                            -- style for sidebars, see below
        floats = "transparent",                              -- style for floating windows
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    hide_inactive_statusline = false,                        -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = true,                                     -- dims inactive windows
    lualine_bold = true,                                     -- When `true`, section headers in the lualine theme will be bold

    on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
    end,

    -- borderless telescope
    on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
            bg = prompt,
        }
        hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
        }
        hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
        }
        hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
        }
    end,
})

-- signify (git plugin)
vim.cmd([[
        function! TokyonightThemeHighlighting()
          highlight SignifySignAdd    guifg=#399a96
          highlight SignifySignChange guifg=#6382bd
          highlight SignifySignDelete guifg=#c25d64
        endfunction

        augroup TokyonightThemeAutoCommands
          autocmd!
          au ColorScheme tokyonight,tokyonight-storm,tokyonight-night,tokyonight-moon
                       \ call TokyonightThemeHighlighting()
        augroup END
      ]])
