local key_set = vim.keymap.set

-- nvim-telescope/telescope.nvim
-----------------------------------------------------------------------------------
key_set('n', '<leader>ff', require('telescope.builtin').find_files, {})
key_set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
key_set('n', '<leader>fb', require('telescope.builtin').buffers, {})
key_set('n', '<leader>fo', require('telescope.builtin').oldfiles, {})
key_set('n', '<leader>fc', require('telescope.builtin').colorscheme, {})
key_set('n', '<leader>fz', require('telescope.builtin').current_buffer_fuzzy_find, {})

-- adjacent : find files in same dir
key_set("n", "<leader>fff", "<cmd>Telescope adjacent<cr>", { noremap = true, silent = false })

-- undo
key_set('n', '<leader>fu', "<cmd>Telescope undo<cr>", {})

-- VonHeikemen/lsp-zero.nvim
-----------------------------------------------------------------------------------
require('lsp-zero').on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    key_set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    key_set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

-- kawre/leetcode.nvim
-----------------------------------------------------------------------------------
key_set('n', '<leader>l', ':Leet<CR>')
key_set('n', '<leader>lr', ':Leet run<CR>')
key_set('n', '<leader>ll', ':Leet list<CR>')
key_set('n', '<leader>ls', ':Leet submit<CR>')

-- eandrju/cellular-automaton.nvim
-----------------------------------------------------------------------------------
-- key_set('n', '<leader><leader><leader>', ':CellularAutomaton make_it_rain<CR>')

-- ThePrimeagen/harpoon
-----------------------------------------------------------------------------------
key_set('n', '<leader>ha', require('harpoon.mark').add_file)
key_set('n', '<leader>h', require('harpoon.ui').toggle_quick_menu)

key_set('n', '<leader>h1', function() require('harpoon.ui').nav_file(1) end)
key_set('n', '<leader>h2', function() require('harpoon.ui').nav_file(2) end)
key_set('n', '<leader>h3', function() require('harpoon.ui').nav_file(3) end)
key_set('n', '<leader>h4', function() require('harpoon.ui').nav_file(4) end)

-- rmagatti/goto-preview
-----------------------------------------------------------------------------------
key_set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

-- tpope/vim-fugitive
-----------------------------------------------------------------------------------
key_set('n', '<leader>gs', vim.cmd.Git)
