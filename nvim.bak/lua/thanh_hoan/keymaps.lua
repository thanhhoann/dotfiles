-- copy and paste to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- just calling Format()
vim.keymap.set("n", "<leader>f", ":Format<CR>")
