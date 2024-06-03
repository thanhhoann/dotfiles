local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local colorscheme_lazy_utils = {
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
}

require("lazy").setup({
	--          ╭─────────────────────────────────────────────────────────╮
	--          │                      _DEVELOPMENT                       │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{ "dmmulroy/ts-error-translator.nvim" },

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                           CMP                           │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = { "L3MON4D3/LuaSnip" },
	},
	-- sources
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "doxnit/cmp-luasnip-choice" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                           AI                            │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"Exafunction/codeium.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" },
		config = function()
			require("codeium").setup({})
		end,
	},

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                          DEBUG                          │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                         SNIPPETS                         │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "honza/vim-snippets" },
	{ "rafamadriz/friendly-snippets" },

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                           _GIT                           │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},

	{
		"SuperBo/fugit2.nvim",
		opts = {
			width = 70,
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
		keys = {
			{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
		},
	},
	-- { "mhinz/vim-signify" },

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                       TREESITTER                        │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                           LSP                           │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "neovim/nvim-lspconfig" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	-- sources
	{ "onsails/lspkind.nvim" },
	{ "folke/lsp-colors.nvim" },
	{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
	{
		"nvimdev/lspsaga.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                        TELESCOPE                        │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	-- sources
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                           _UI                            │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "MunifTanjim/nui.nvim" },
	{ "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	-- { 'j-hui/fidget.nvim' },
	{ "rcarriga/nvim-notify" },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{ "xiyaowong/transparent.nvim" },
	{
		"grapp-dev/nui-components.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                      _FILE_MOTIONS                       │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "stevearc/oil.nvim", opts = {}, dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                          _UTILS                          │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
	{ "nvimtools/none-ls.nvim" }, -- null-ls alternative

	{ "mrjones2014/legendary.nvim", priority = 10000, lazy = false },
	{
		"chrishrb/gx.nvim",
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1 -- disable netrw gx
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		submodules = false, -- not needed, submodules are required only for tests
		config = true,
	},
	{ "LintaoAmons/cd-project.nvim" },
	{ -- Garbage collector that stops inactive LSP clients to free RAM
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {},
	},

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                     _EDITING SUPPORT                     │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
	{ "windwp/nvim-ts-autotag" },
	{ "cpea2506/relative-toggle.nvim" },
	{ "numToStr/Comment.nvim", opts = {}, lazy = false },
	{ "LudoPinelli/comment-box.nvim" }, -- commentstring drawings
	{
		"roobert/search-replace.nvim",
		config = function()
			require("search-replace").setup({
				default_replace_single_buffer_options = "gcI",
				default_replace_multi_buffer_options = "egcI",
			})
		end,
	},
	{ "MunifTanjim/prettier.nvim" },
	-- { 'mhartington/formatter.nvim' },
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
			},
		},
	},
	-- { "NvChad/nvim-colorizer.lua" },
	-- {
	-- 	"chrisgrieser/nvim-spider",
	-- 	lazy = true,
	-- 	keys = {
	-- 		{ "w", "<cmd>lua require('spider').motion('w')<cr>", mode = { "n", "x", "o" }, desc = "Spider W" },
	-- 		{ "e", "<cmd>lua require('spider').motion('e')<cr>", mode = { "n", "x", "o" }, desc = "Spider E" },
	-- 		{ "b", "<cmd>lua require('spider').motion('b')<cr>", mode = { "n", "x", "o" }, desc = "Spider B" },
	-- 	},
	-- },
	{ "karb94/neoscroll.nvim" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{
		"Wansmer/treesj",
		keys = { "<space>m", "<space>j", "<space>s" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
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
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })

			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
			vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
			-- vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
		end,
	},
	--          ╭─────────────────────────────────────────────────────────╮
	--          │                        _EDUCATION                        │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"roobert/surround-ui.nvim",
		dependencies = {
			"kylechui/nvim-surround",
			"folke/which-key.nvim",
		},
		config = function()
			require("surround-ui").setup({
				root_key = "S",
			})
		end,
	},
	{
		"tris203/precognition.nvim",
		config = function()
			require("precognition").setup({
				startVisible = true,
				showBlankVirtLine = false,
				highlightColor = { link = "Comment" },
				hints = {
					Caret = { text = "^", prio = 2 },
					Dollar = { text = "$", prio = 1 },
					MatchingPair = { text = "%", prio = 5 },
					Zero = { text = "0", prio = 1 },
					w = { text = "w", prio = 10 },
					b = { text = "b", prio = 9 },
					e = { text = "e", prio = 8 },
					W = { text = "W", prio = 7 },
					B = { text = "B", prio = 6 },
					E = { text = "E", prio = 5 },
				},
				gutterHints = {
					G = { text = "G", prio = 10 },
					gg = { text = "gg", prio = 9 },
					PrevParagraph = { text = "{", prio = 8 },
					NextParagraph = { text = "}", prio = 8 },
				},
			})
		end,
	},
	-- {
	-- 	"m4xshen/hardtime.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	-- 	opts = {},
	-- },
	--
	--          ╭─────────────────────────────────────────────────────────╮
	--          │                       STATUS LINE                       │
	--          ╰─────────────────────────────────────────────────────────╯
	{ "nvim-lualine/lualine.nvim" },
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                      _COLORSCHEMES                       │
	--          ╰─────────────────────────────────────────────────────────╯
	-- { "themercorp/themer.lua" },
	-- { "rktjmp/lush.nvim" },
	{ "oxfist/night-owl.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	--          ╭─────────────────────────────────────────────────────────╮
	--          │                       _NOTE TAKING                       │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "preservim/vim-markdown" },
	{
		"NFrid/due.nvim",
		config = function()
			require("due_nvim").setup({})
		end,
	},

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                         COLORS                          │
	--          ╰─────────────────────────────────────────────────────────╯
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                          misc                           │
	--          ╰─────────────────────────────────────────────────────────╯
	-- {
	--     'eandrju/cellular-automaton.nvim'
	-- }

	--          ╭─────────────────────────────────────────────────────────╮
	--          │                          mini                           │
	--          ╰─────────────────────────────────────────────────────────╯

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
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()
		end,
	},
})
