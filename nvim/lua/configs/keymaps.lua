local keymap_set = vim.keymap.set

vim.g.mapleader = " "

-- NORMAL MODE
-- -------------------------------------
-- format and save
keymap_set('n', 'W', ':Prettier<CR>:w<CR>')

-- format
keymap_set('n', '<leader>f', ':LspZeroFormat<CR>:w<CR>')

-- copy to clipboard
keymap_set({ "n", "v" }, "<leader>y", [["+y]])

-- replace selected word with regex
keymap_set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- format -> save -> source
keymap_set('n', "<leader>n", ':LspZeroFormat<CR>:w<CR>:so<CR>')

-- select all
keymap_set('n', "<leader>a", "ggVG")

-- quit
keymap_set('n', 'Z', ':quitall<CR>')

-- VISUAL MODE
-- -------------------------------------
-- moving strings
keymap_set("v", "J", ":m '>+1<CR>gv=gv")
keymap_set("v", "K", ":m '<-2<CR>gv=gv")

-- INSERT MODE
-- -------------------------------------
-- esc when inserting
keymap_set("i", "<C-c>", "<Esc>")
