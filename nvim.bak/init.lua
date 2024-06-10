require("thanh_hoan.options")
require("thanh_hoan.keymaps")
require("thanh_hoan.autocmds")
require("thanh_hoan.functions")

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
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.format"),
	require("plugins.git"),
	require("plugins.treesitter"),
	require("plugins.motions"),
	require("plugins.autocompletion"),
	require("plugins.misc"),
	require("plugins.colorschemes"),
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
require("plugins.keymaps")
