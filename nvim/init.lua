-- NOTE:
--  Remove unused plugins & key-mappings
--  Create key-mappings to reduce keystrokes
--  Keep number of plugins loaded on start < 50

-- TODO:
--   Tidy & Sort plugins, files
--   conventional-commit.nvim: show popup or steps to set a commit, like better-commits (cli)
--   font-picker.nvim: show 2 panes side-by-side, left is fonts, right is preview

-- Bootstrap lazy.nvim & LazyVim
require("config.core")

-- Personal Configurations
-- NOTE: LazyVim autoloads in lua/config: autocmds, keymaps, options
require("config.user_commands")
require("config.functions")

-- Plugins Configurations
require("plugins.config.gen") -- generate text using LLMs with customizable prompts
require("plugins.config.spectre") -- search & replace for multiple files (regex, filter by filetype)
-- require("plugins.config.grug-far") -- nvim-spectre improved
require("plugins.config.rip-substitute") -- search & replace for current buffer (regex, code completion, range support, Regex101 integrated)
require("plugins.config.none-ls")
require("plugins.config.luasnip")
require("plugins.config.neogit")
require("plugins.config.conform")
require("plugins.config.nio")
require("plugins.config.highlight-colors")
require("plugins.config.obsidian")
require("plugins.config.lsp")
require("plugins.config.cmp")
require("plugins.config.neo-tree")
require("plugins.config.telescope")
require("plugins.config.headlines") -- adds horizontal highlights for text filetypes, like markdown

-- Available colorschemes
-- NOTE: This command loads both colorscheme & its config
-- tokyonight | night-owl | rose-pine | catppuccin | tokyodark
set_colorscheme("tokyodark")
