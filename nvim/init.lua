require("hoan_vip_pro.options")
require("hoan_vip_pro.keymaps")
require("hoan_vip_pro.autocmds")

-- lazy bootstrapping --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- lazy bootstrapping --

-- load the plugins first
require("lazy").setup({
	require("kimochi.telescope"),
	require("kimochi.lsp"),
	require("kimochi.colorschemes"),
	require("kimochi.format"),
	require("kimochi.treesitter"),
	require("kimochi.motions"),
	require("kimochi.autocompletion"),
	require("kimochi.misc"),
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- then load the plugins' keymaps
require("kimochi.keymaps")
