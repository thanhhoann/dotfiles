local navigator = require("navigator")

navigator.setup({
    debug = false,
    width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
    height = 0.3, -- max list window height, 0.3 by default
    preview_height = 0.35, -- max height of preview windows
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
    on_attach = function(client, bufnr)
        -- your hook
    end,

    treesitter_analysis = true,
    treesitter_navigation = true,
    treesitter_analysis_max_num = 100,
    treesitter_analysis_condense = true,
    transparency = 50,
    lsp_signature_help = true,
    signature_help_cfg = nil,
    icons = {
        icons = true,
        code_action_icon = "🏏",
        diagnostic_head = '🐛',
        diagnostic_head_severity_1 = "🈲",
        fold = {
            prefix = '⚡',
            separator = '',
        },
    },
    mason = true,
    lsp = {
        enable = true,
        code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
        code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
        document_highlight = true,
        format_on_save = true,
        format_options = { async = true },
        disable_format_cap = { "sqlls", "lua_ls", "gopls" },
        diagnostic = {
            underline = true,
            virtual_text = true,
            update_in_insert = false,
            float = {
                focusable = false,
                sytle = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
        }
    },
    hover = {
        enable = true,
        keymap = {
            ['<C-k>'] = {
                go = function()
                    local w = vim.fn.expand('<cWORD>')
                    vim.cmd('GoDoc ' .. w)
                end,
                default = function()
                    local w = vim.fn.expand('<cWORD>')
                    vim.lsp.buf.workspace_symbol(w)
                end,
            },
        },

        diagnostic_scrollbar_sign = { '▃', '▆', '█' },
        diagnostic_virtual_text = true,
        diagnostic_update_in_insert = false,
        display_diagnostic_qf = 'trouble',
    }
})

