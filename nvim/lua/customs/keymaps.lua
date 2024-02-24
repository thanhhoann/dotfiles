require 'legendary'.setup({
    keymaps = {
        {
            "<Leader>fm",
            ':Legendary<cr>',
            mode = { 'n' },
            desc = "Open Legendary",
        },

        -- telescope
        {
            "<Leader>ft",
            ':Telescope ',
            mode = { 'n' },
            desc = "Open Legendary",
        },
        {
            "<Leader>ff",
            ':Telescope find_files<cr>',
            mode = { 'n' },
            desc = "Telescope : Find Files",
        },
        {
            "<Leader>fo",
            ':Telescope oldfiles<cr>',
            mode = { 'n' },
            desc = "Telescope : Old Files",
        },
        {
            "<Leader>fg",
            ':Telescope live_grep_args<cr>',
            mode = { 'n' },
            desc = "Telescope : Live Grep Args",
        },
        {
            "<Leader>fz",
            ':Telescope current_buffer_fuzzy_find<cr>',
            mode = { 'n' },
            desc = "Telescope : Current Buffer Fuzzy Find",
        },
        {
            "<Leader>flr",
            ':Telescope LSP references<cr>',
            mode = { 'n' },
            desc = "Telescope : LSP References",
        },

        -- windows.nvim
        {
            "<C-w>z",
            ':WindowsMaximize<cr>',
            mode = { 'n' },
            desc = "Windows : Maximize",
        },
        {
            "<C-w>=",
            ':WindowsEqualize<cr>',
            mode = { 'n' },
            desc = "Windows : Equalize",
        },

        -- lspsaga
        {
            "[c",
            ':<cmd>Lspsaga code_action<cr>',
            mode = { 'n' },
            desc = "Lspsaga : LSP Code Action",
        },

        -- flash : jump to a line
        {
            "<leader>jl",
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { after = { 0, 0 } },
                    pattern = "^"
                })
            end,
            mode = { 'n', 'x' },
            desc = "Flash : Jump to a line",
        },
        -- flash : jump to a diagnostic
        {
            "<leader>jd",
            function()
                require("flash").jump({
                    matcher = function(win)
                        ---@param diag Diagnostic
                        return vim.tbl_map(function(diag)
                            return {
                                pos = { diag.lnum + 1, diag.col },
                                end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
                            }
                        end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
                    end,
                    action = function(match, state)
                        vim.api.nvim_win_call(match.win, function()
                            vim.api.nvim_win_set_cursor(match.win, match.pos)
                            vim.diagnostic.open_float()
                        end)
                        state:restore()
                    end,
                })
            end,
            mode = { 'n', 'x' },
            desc = "Flash : Jump to a diagnostic",
        },


        -- harpoon
        {
            "<leader>ha",
            function()
                require "harpoon":list():append()
            end,
            mode = { 'n' },
            desc = "Harppon : Add",
        },
        {
            "<leader>h",
            function()
                require 'harpoon'.ui:toggle_quick_menu(
                    require 'harpoon':list()
                )
            end,
            mode = { 'n' },
            desc = "Harpoon : Toggle Quick Menu",
        },
        {
            "<leader>h1",
            function()
                require 'harpoon':list():select(1)
            end,
            mode = { 'n' },
            desc = "Harpoon : Select item 1",
        },
        {
            "<leader>h2",
            function()
                require 'harpoon':list():select(2)
            end,
            mode = { 'n' },
            desc = "Harpoon : Select item 2",
        },
        {
            "<leader>h3",
            function()
                require 'harpoon':list():select(3)
            end,
            mode = { 'n' },
            desc = "Harpoon : Select item 3",
        },

        -- search-replace
        {
            "<leader>ro",
            "<CMD>SearchReplaceWithinVisualSelection<CR>",
            mode = { 'v' }
        }

    }
})
