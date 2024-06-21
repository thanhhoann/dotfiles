-- Bootstrap lazy.nvim & LazyVim
require("config.lazy")

-- load Personal Configurations
require("config.user_cmds")

-- and Plugins Configurations
require("plugins.configs.luasnip")
require("plugins.configs.neogit")
-- require("plugins.configs.highlight-colors")
require("plugins.configs.oil")
require("plugins.configs.obsidian")
require("plugins.configs.lsp")
require("plugins.configs.cmp")
require("plugins.configs.neo-tree")

-- and Colorschemes Configurations
-- require("plugins.configs.colorschemes.night-owl")
require("plugins.configs.colorschemes.tokyonight")
-- require("plugins.configs.colorschemes.rose-pine")
-- require("plugins.configs.colorschemes.catppuccin")
-- require("plugins.configs.colorschemes.kanagawa")
-- require("plugins.configs.colorschemes.cyberdream")

-- Set colorscheme
vim.cmd("colorscheme tokyonight")

-- TODO:
-- create workspaces in Obsidian.nvim (goals/technical skills, goals/...)
