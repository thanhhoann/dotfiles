return {
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
		{
			{
				"echasnovski/mini.nvim",
				config = function()
					-- Better Around/Inside textobjects
					--
					-- Examples:
					--  - va)  - [V]isually select [A]round [)]paren
					--  - yinq - [Y]ank [I]nside [N]ext [']quote
					--  - ci'  - [C]hange [I]nside [']quote
					require("mini.ai").setup({ n_lines = 500 })

					-- Add/delete/replace surroundings (brackets, quotes, etc.)
					--
					-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
					-- - sd'   - [S]urround [D]elete [']quotes
					-- - sr)'  - [S]urround [R]eplace [)] [']
					require("mini.surround").setup()
				end,
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

}
