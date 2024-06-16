-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Open neotree
vim.keymap.set("n", "-", "<CMD>Neotree toggle<CR>")

-- Select all
vim.keymap.set("n", "<leader>a", "gg<S-v>G")

-- Split window
vim.keymap.set("n", "ss", ":split<Return>")
vim.keymap.set("n", "sv", ":vsplit<Return>")

-- Open neogit
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>")
