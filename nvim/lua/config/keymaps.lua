-- Make all keymaps silent by default
local keymap_set = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return keymap_set(mode, lhs, rhs, opts)
end

-- Select all
keymap_set("n", "<leader>a", "gg<S-v>G")

-- Split window
keymap_set("n", "ss", ":split<Return>")
keymap_set("n", "sv", ":vsplit<Return>")

-- quick quit
keymap_set("n", "<leader>q", ":q!<CR>")

-- quick save
keymap_set("n", "z", _G.custom_notify("<cmd>w<cr>", "  ", "info", "File status", "500", "   ", "compact"))

-- quick format & save
keymap_set(
  { "n", "i" },
  "zf",
  _G.custom_notify("<cmd>LazyFormat<cr><cmd>:w<cr>", "󱡄 +  ", "info", "File status", "500", "   ", "compact")
)

-- esc & saves ! simple !
keymap_set("i", "<esc>", "<esc>:w<cr>")

-------------
-- PLUGINS --
-------------
keymap_set(
  "n",
  "<leader>m",
  "<CMD>!tmux display-popup -w 100 -h 40 -E 'env TERM=wezterm nvim /Users/thanhhoann/core_machine/desktop/obsidian/TODOs.md'<CR>"
)

-- neogit https://github.com/NeogitOrg/neogit
keymap_set("n", "<leader>gg", ":Neogit<CR>")

-- nvim-spectre https://github.com/nvim-pack/nvim-spectre
keymap_set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
keymap_set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
keymap_set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- nvim-rip-substiture https://github.com/chrisgrieser/nvim-rip-substitute
keymap_set({ "n", "x" }, "<leader>fs", function()
  require("rip-substitute").sub()
end)
