-- IDEAS
--   conventional-commit.nvim: show popup or steps to set a commit, like better-commits (cli)
--   font-picker.nvim: show 2 panes side-by-side, left is fonts, right is preview

-- Bootstrap lazy.nvim & LazyVim
require("config.core")

-- Personal Configurations
-- NOTE: LazyVim autoloads in lua/config: autocmds, keymaps, options
require("config.user_commands")
require("config.functions")

-- Plugins Configurations
-- 󰇊 Important Plugins
require("plugins.config.none-ls")
require("plugins.config.lsp")
require("plugins.config.telescope")
require("plugins.config.luasnip")
require("plugins.config.cmp")
require("plugins.config.conform") 
-- 󰇋 Less important
require("plugins.config.gen") -- generate text using LLMs with customizable prompts
require("plugins.config.copilot-chat") -- generate text using LLMs with customizable prompts
require("plugins.config.rip-substitute") -- search & replace for current buffer (regex, code completion, range support, Regex101 integrated)
require("plugins.config.neogit")
require("plugins.config.highlight-colors")
require("plugins.config.render-markdown")
require("plugins.config.obsidian")

-- Available colorschemes
-- NOTE: This command loads both colorscheme & its config file
-- set_colorscheme(colorscheme: string, hasConfigFile: boolean)
-- Available colorschemes: tokyonight | night-owl | rose-pine | catppuccin | tokyodark | nightfall - deepernight - maron
set_colorscheme("nightfall", true)

-- Temporarily disable diagnostic virtual text for tiny-inline-diagnostic.nvim to work
-- vim.diagnostic.config({ virtual_text = false })
