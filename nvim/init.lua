-- Bootstrap lazy.nvim & LazyVim
require("config.lazy")

-- and Plugins Configurations
require("plugins.configs.luasnip")
require("plugins.configs.neogit")
require("plugins.configs.highlight-colors")

-- and Colorschemes Configurations
require("plugins.configs.colorschemes.night-owl")
-- require("plugins.configs.colorschemes.tokyonight")
-- require("plugins.configs.colorschemes.rose-pine")
-- require("plugins.configs.colorschemes.catppuccin")

-- Set colorscheme
vim.cmd("colorscheme night-owl")

_G.SearchReplaceFromTo = function(fromLine, toLine, before, after)
  vim.cmd(fromLine .. "," .. toLine .. "s/" .. before .. "/" .. after .. "/gc")
end
