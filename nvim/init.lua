-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.configs.luasnip")
require("plugins.configs.heirline")

-- set colorscheme
vim.cmd([[colorscheme night-owl]])
