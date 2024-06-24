-- NOTE:
-- Keep it FAST & SIMPLE:
--  Remove unused plugins & mappings
--  Create mappings to reduce keystrokes
--  Keep plugins loaded on start < 20

-- TODO:
-- Config telescope live-grep-args, browser-bookmarks

-- Bootstrap lazy.nvim & LazyVim
require("config.lazy")

-- Personal Configurations
require("config.user_cmds")

-- Plugins Configurations
require("plugins.config.luasnip")
require("plugins.config.neogit")
require("plugins.config.highlight-colors")
require("plugins.config.obsidian")
require("plugins.config.lsp")
require("plugins.config.cmp")
require("plugins.config.neo-tree")
-- require("plugins.config.telescope")
-- require("plugins.config.browser-bookmarks")

-- Custom Plugins
require("customs.font-picker")

-- Colorschemes Configurations
require("plugins.config.colorschemes.night-owl")
-- require("plugins.config.colorschemes.tokyonight")
-- require("plugins.config.colorschemes.rose-pine")
-- require("plugins.config.colorschemes.catppuccin")
-- require("plugins.config.colorschemes.kanagawa")
-- require("plugins.config.colorschemes.cyberdream")

-- Set colorscheme
vim.cmd("colorscheme night-owl")
