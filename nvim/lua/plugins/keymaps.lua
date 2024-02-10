local key = vim.keymap.set

-- INFO: chrisgrieser/nvim-spider.nvim
-----------------------------------------------------------------------------------
key({ 'n', 'o', 'x' }, 'w', "<cmd>lua require('spider').motion('w')<cr>", { desc = "Spider-W" })
key({ 'n', 'o', 'x' }, 'e', "<cmd>lua require('spider').motion('e')<cr>", { desc = "Spider-E" })
key({ 'n', 'o', 'x' }, 'b', "<cmd>lua require('spider').motion('b')<cr>", { desc = "Spider-B" })

-- INFO: folke/trouble.nvim
-----------------------------------------------------------------------------------
key("n", "<leader>xx", function() require("trouble").toggle() end)
key("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
key("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
key("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
key("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
key("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- INFO: nvim-telescope/telescope.nvim
-----------------------------------------------------------------------------------
key('n', '<leader>ff', require('telescope.builtin').find_files, {})
key('n', '<leader>fb', require('telescope.builtin').buffers, {})
key('n', '<leader>fo', require('telescope.builtin').oldfiles, {})
key('n', '<leader>fc', require('telescope.builtin').colorscheme, {})
key('n', '<leader>fz', require('telescope.builtin').current_buffer_fuzzy_find, {})
key('n', '<leader>fl', require('telescope.builtin').lsp_references, {})
key("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
-- adjacent : find files in same dir
key("n", "<leader>fff", "<cmd>Telescope adjacent<cr>", { noremap = true, silent = false })
-- undo
key('n', '<leader>fu', "<cmd>Telescope undo<cr>", {})
-- menu
key('n', '<leader>fm', "<cmd>Telescope menu<cr>", {})

-- INFO: ???
-----------------------------------------------------------------------------------
key({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
key({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
key({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
key({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
key({ 'n', 't' }, '<C-p>', '<CMD>NavigatorPrevious<CR>')

-- INFO: kawre/leetcode.nvim
-----------------------------------------------------------------------------------
key('n', '<leader>l', ':Leet<CR>')
key('n', '<leader>lr', ':Leet run<CR>')
key('n', '<leader>ll', ':Leet list<CR>')
key('n', '<leader>ls', ':Leet submit<CR>')

-- INFO: ThePrimeagen/harpoon
-----------------------------------------------------------------------------------
key("n", "<leader>ha", function() require 'harpoon':list():append() end)
key("n", "<leader>h", function() require 'harpoon'.ui:toggle_quick_menu(require 'harpoon':list()) end)

key("n", "<leader>1", function() require 'harpoon':list():select(1) end)
key("n", "<leader>2", function() require 'harpoon':list():select(2) end)
key("n", "<leader>3", function() require 'harpoon':list():select(3) end)
key("n", "<leader>4", function() require 'harpoon':list():select(4) end)

-- INFO: rmagatti/goto-preview
-----------------------------------------------------------------------------------
key("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

-- INFO: tpope/vim-fugitive
-----------------------------------------------------------------------------------
key('n', '<leader>gs', vim.cmd.Git)

-- INFO: roobert/search-replace.nvim
-----------------------------------------------------------------------------------
key("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
key("n", "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>", opts)
key('v', '<leader>)', ":s/)/),/gcI<cr>a<cr>") -- put comma behind every bracket
-- show the effects of a search / replace in a live preview window
vim.o.inccommand = "split"

-- eandrju/cellular-automaton.nvim
-----------------------------------------------------------------------------------
-- key_set('n', '<leader><leader><leader>', ':CellularAutomaton make_it_rain<CR>')
