return {
	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth" },
	-- Useful for getting pretty icons, requires a Nerd Font
	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	-- Neovim file explorer: edit your filesystem like a buffer
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- A blazing fast and easy to configure
	-- neovim statusline plugin written in pure lua.
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "ayu_dark",
				},
			})
		end,
	},
	-- An interactive and powerful Git interface for Neovim, inspired by Magit
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
}
