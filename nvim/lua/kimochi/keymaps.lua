-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

-- neoscroll
local neoscroll = require("neoscroll")
local keymap = {
	["<C-k>"] = function()
		neoscroll.ctrl_u({ duration = 250 })
	end,
	["<C-j>"] = function()
		neoscroll.ctrl_d({ duration = 250 })
	end,
}
local modes = { "n", "v", "x" }
for key, func in pairs(keymap) do
	vim.keymap.set(modes, key, func)
end
