return {
	-- An interactive and powerful Git interface for Neovim, inspired by Magit
	-- {
	-- 	"NeogitOrg/neogit",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- required
	-- 		"sindrets/diffview.nvim", -- optional - Diff integration
	--
	-- 		-- Only one of these is needed, not both.
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 		"ibhagwan/fzf-lua", -- optional
	-- 	},
	-- 	config = true,
	-- },

	-- Neovim git GUI powered by libgit2
	{
		'SuperBo/fugit2.nvim',
		opts = {
			-- width = 70,
			libgit2_path = '/usr/local/opt/libgit2/lib/libgit2.dylib',
		},
		dependencies = {
			'MunifTanjim/nui.nvim',
			'nvim-tree/nvim-web-devicons',
			'nvim-lua/plenary.nvim',
			{
				'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
				dependencies = { 'stevearc/dressing.nvim' }
			},
		},
		cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
		keys = {
			{ '<leader>F', mode = 'n', '<cmd>Fugit2<cr>' }
		}
	},

	-- Single tabpage interface for easily cycling
	-- through diffs for all modified files for any git rev.
	{
		'sindrets/diffview.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		-- lazy, only load diffview by these commands
		cmd = {
			'DiffviewFileHistory', 'DiffviewOpen', 'DiffviewToggleFiles', 'DiffviewFocusFiles',
			'DiffviewRefresh'
		}
	}
}
