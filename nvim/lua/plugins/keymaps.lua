local key_set = vim.keymap.set

-- nvim-telescope/telescope.nvim
-----------------------------------------------------------------------------------
key_set('n', '<leader>ff', require('telescope.builtin').find_files, {})
key_set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
key_set('n', '<leader>fb', require('telescope.builtin').buffers, {})
key_set('n', '<leader>fo', require('telescope.builtin').oldfiles, {})
key_set('n', '<leader>fc', require('telescope.builtin').colorscheme, {})
key_set('n', '<leader>fz', require('telescope.builtin').current_buffer_fuzzy_find, {})
key_set('n', '<leader>fl', require('telescope.builtin').lsp_references, {})

-- adjacent : find files in same dir
key_set("n", "<leader>fff", "<cmd>Telescope adjacent<cr>", { noremap = true, silent = false })

-- undo
key_set('n', '<leader>fu', "<cmd>Telescope undo<cr>", {})

-- menu
key_set('n', '<leader>fm', "<cmd>Telescope menu<cr>", {})

-- VonHeikemen/lsp-zero.nvim
-----------------------------------------------------------------------------------
key_set({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
key_set({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
key_set({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
key_set({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
key_set({ 'n', 't' }, '<C-p>', '<CMD>NavigatorPrevious<CR>')

-- VonHeikemen/lsp-zero.nvim
-----------------------------------------------------------------------------------
require 'lsp-zero'.on_attach(function(client, bufnr)
    require 'lsp-zero'.default_keymaps({ buffer = bufnr })
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
key_set("n", "<leader>ha", function() require 'harpoon':list():append() end)
key_set("n", "<leader>h", function() require 'harpoon'.ui:toggle_quick_menu(require 'harpoon':list()) end)

key_set("n", "<leader>1", function() require 'harpoon':list():select(1) end)
key_set("n", "<leader>2", function() require 'harpoon':list():select(2) end)
key_set("n", "<leader>3", function() require 'harpoon':list():select(3) end)
key_set("n", "<leader>4", function() require 'harpoon':list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
key_set("n", "<leader>i", function() require 'harpoon':list():prev() end)
key_set("n", "<leader>o", function() require 'harpoon':list():next() end)


-- rmagatti/goto-preview
-----------------------------------------------------------------------------------
key_set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

-- tpope/vim-fugitive
-----------------------------------------------------------------------------------
key_set('n', '<leader>gs', vim.cmd.Git)

-- roobert/search-replace.nvim
-----------------------------------------------------------------------------------

key_set("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
key_set("n", "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>", opts)

-- show the effects of a search / replace in a live preview window
vim.o.inccommand = "split"
