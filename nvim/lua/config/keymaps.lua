-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--
vim.keymap.set("n", "-", "<CMD>Neotree toggle<CR>", { desc = "Open parent directory" })

--
vim.keymap.set("n", "co", "<CMD>VtsExec organize_imports<CR>", { desc = "Organize imports" })
vim.keymap.set("n", "cii", "<CMD>VtsExec add_missing_imports<CR>", { desc = "Add missing imports" })
vim.keymap.set("n", "cid", "<CMD>VtsExec remove_unused_imports<CR>", { desc = "Remove unused imports" })

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
vim.keymap.set("n", "ss", ":split<Return>", opts)
vim.keymap.set("n", "sv", ":vsplit<Return>", opts)
