local bold = { style = "bold" }
local italic = { style = "italic" }

-- amora
-- astron
-- ayu
-- ayu_dark
-- ayu_mirage
-- boo
-- catppuccin
-- darknight
-- doom_one
-- dracula
-- everforest
-- github_dark
-- github_dark_colorblind
-- github_light
-- gruvbox-material-dark-hard
-- gruvbox-material-dark-medium
-- gruvbox-material-dark-soft
-- gruvbox
-- javacafe
-- jellybeans
-- kanagawa
-- kurai
-- monokai
-- monokai_pro
-- monokai_vibrant
-- nightlamp
-- nord
-- onedark
-- onedark_deep
-- papa_dark
-- radium
-- rose_pine
-- rose_pine_dawn
-- rose_pine_moon
-- sakura
-- scery
-- shado
-- sonokai_deep
-- tokyodark
-- tokyonight
-- uwu

require("themer").setup({
	colorscheme = "catppuccin",
	transparent = false,
	term_colors = true,
	dim_inactive = true,
	disable_telescope_themes = {},
	styles = {
		heading = {
			h1 = {},
			h2 = {},
		},
		["function"] = bold,
		functionBuiltIn = {},
		variable = {},
		variableBuiltIn = {},
		include = {},
		identifier = {},
		keyword = {},
		keywordBuiltIn = {},
		struct = {},
		string = italic,
		parameter = bold,
		field = italic,
		type = {},
		typeBuiltIn = {},
		property = {},
		comment = bold,
		punctuation = {},
		constructor = {},
		operator = {},
		constant = {},
		constantBuiltIn = {},
		todo = {},
		character = {},
		conditional = {},
		number = {},
		statement = {},
		uri = {},
		diagnostic = {
			underline = {
				error = bold,
				warn = {},
				info = {},
				hint = {},
			},
			virtual_text = {
				error = {},
				warn = {},
				info = {},
				hint = {},
			},
		},
	},
	remaps = {
		-- per colorscheme palette remaps, for example:
		-- remaps.palette = {
		--     rose_pine = {
		--     	fg = "#000000"
		--     }
		-- },
		-- remaps.highlights = {
		--     rose_pine = {
		--	base = {
		--     	  Normal = { bg = "#000000" }
		--	},
		--     }
		-- },
		--
		-- Also you can do remaps.highlights.globals  for global highlight remaps
		palette = {
			tokyonight = {
				syntax = {
					["function"] = "#baff29",
					keyword = "#65afff",
					struct = "orange",
					string = "white",
					field = "gray",
					parameter = "orange",
					property = "orange",
					punctuation = "#ff6700",
					constructor = "white",
					operator = "#fbda00",
					conditional = "#ffefcd",
				},
				built_in = {
					["function"] = "#baff29",
					type = "#10ab6a",
					constant = "orange",
				},
			},
		},
		highlights = {},
	},

	langs = {
		html = true,
		md = true,
		jsx = true,
		tsx = true,
	},

	plugins = {
		treesitter = true,
		indentline = true,
		barbar = true,
		bufferline = true,
		cmp = true,
		gitsigns = true,
		lsp = true,
		telescope = true,
	},
	enable_installer = true, -- enable installer module
})
