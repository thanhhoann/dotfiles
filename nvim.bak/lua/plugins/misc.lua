return {
	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth" },

	-- lua `fork` of vim-web-devicons for neovim
	{
		'nvim-tree/nvim-web-devicons',
		enabled = vim.g.have_nerd_font
	},

	-- Useful for getting pretty icons, Neovim file explorer: edit your filesystem like a buffer
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies dependencies = { "nvim-tree/nvim-web-devicons" },
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

	-- Indent guides for Neovim
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- A Neovim plugin helping you establish
	-- Good command workflow and quit bad habit
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	-- 	opts = {}
	-- },

	{
		"windwp/nvim-ts-autotag",
	},

	-- ⚡ TypeScript integration NeoVim deserves ⚡
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},

}
