local key = vim.keymap.set

--   chrisgrieser/nvim-spider.nvim
-----------------------------------------------------------------------------------
key({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<cr>", { desc = "Spider-W" })
key({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<cr>", { desc = "Spider-E" })
key({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<cr>", { desc = "Spider-B" })

--   folke/trouble.nvim
-----------------------------------------------------------------------------------
key("n", "<leader>xx", function() require("trouble").toggle() end)
key("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
key("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
key("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
key("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
key("n", "gR", function() require("trouble").toggle("lsp_references") end)

--   nvim-telescope/telescope.nvim
-----------------------------------------------------------------------------------
key('n', '<leader>ff', require('telescope.builtin').find_files, {})
key('n', '<leader>fb', require('telescope.builtin').buffers, {})
key('n', '<leader>fo', require('telescope.builtin').oldfiles, {})
key('n', '<leader>fc', require('telescope.builtin').colorscheme, {})
key('n', '<leader>fz', require('telescope.builtin').current_buffer_fuzzy_find, {})
key('n', '<leader>fl', require('telescope.builtin').lsp_references, {})
key("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- command
key("n", "<leader>ft", ":Telescope ")
-- lazy
key("n", "<leader>fl", ":Telescope lazy<CR>")
-- adjacent : find files in same dir
key("n", "<leader>fff", "<cmd>Telescope adjacent<cr>", { noremap = true, silent = false })
-- undo
key('n', '<leader>fu', "<cmd>Telescope undo<cr>", {})
-- menu
key('n', '<leader>fm', "<cmd>Telescope menu<cr>", {})

--   kawre/leetcode.nvim
-----------------------------------------------------------------------------------
key('n', '<leader>l', ':Leet<CR>')
key('n', '<leader>lr', ':Leet run<CR>')
key('n', '<leader>ll', ':Leet list<CR>')
key('n', '<leader>ls', ':Leet submit<CR>')

--   ThePrimeagen/harpoon
-----------------------------------------------------------------------------------
key("n", "<leader>ha", function() require 'harpoon':list():append() end)
key("n", "<leader>h", function() require 'harpoon'.ui:toggle_quick_menu(require 'harpoon':list()) end)
key("n", "<leader>1", function() require 'harpoon':list():select(1) end)
key("n", "<leader>2", function() require 'harpoon':list():select(2) end)
key("n", "<leader>3", function() require 'harpoon':list():select(3) end)
key("n", "<leader>4", function() require 'harpoon':list():select(4) end)

--   roobert/search-replace.nvim
-----------------------------------------------------------------------------------
key("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>")
key("n", "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>")
key('v', '<leader>)', ":s/)/),/gcI<cr>a<cr>") -- put comma behind every bracket

--   windows.nvim
-----------------------------------------------------------------------------------
vim.keymap.set('n', '<c-w>z', '<cmd>WindowsMaximize<cr>')
vim.keymap.set('n', '<c-w>_', '<cmd>WindowsMaximizeVertically<cr>')
vim.keymap.set('n', '<c-w>|', '<cmd>WindowsMaximizeHorizontally<cr>')
vim.keymap.set('n', '<c-w>=', '<cmd>WindowsEqualize<cr>')

--   folke/flash.nvim
-----------------------------------------------------------------------------------
-- jump to diagnostic
key('n', '<leader>jd', function()
    require("flash").jump({
        matcher = function(win)
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
end)
-- jump to a line
key({ 'n', 'x' }, '<leader>jl', function()
    require("flash").jump({
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^"
    })
end)
-- initialize the current word (at cursor) with flash.nvim
key('n', '<leader>j.', function()
    require("flash").jump({ pattern = vim.fn.expand("<cword>") })
end)

--  lspsaga
-----------------------------------------------------------------------------------
vim.keymap.set('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<cr>')
vim.keymap.set('n', '[c', '<cmd>Lspsaga code_action<cr>')
