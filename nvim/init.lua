-- Bootstrap lazy.nvim & LazyVim
require("config.lazy")

-- load Personal Configurations
require("config.user_cmds")

-- and Plugins Configurations
require("plugins.config.luasnip")
require("plugins.config.neogit")
-- require("plugins.config.highlight-colors")
-- require("plugins.config.oil")
require("plugins.config.obsidian")
require("plugins.config.lsp")
require("plugins.config.cmp")
require("plugins.config.neo-tree")

-- and Colorschemes Configurations
-- require("plugins.config.colorschemes.night-owl")
-- require("plugins.config.colorschemes.tokyonight")
-- require("plugins.config.colorschemes.rose-pine")
-- require("plugins.config.colorschemes.catppuccin")
-- require("plugins.config.colorschemes.kanagawa")
require("plugins.config.colorschemes.cyberdream")

-- Set colorscheme
vim.cmd("colorscheme cyberdream")

-- TODO:
-- create a mapping to quickly navigate to obsidian
