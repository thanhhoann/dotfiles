-- Make all keymaps silent by default
local key = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  return key(mode, lhs, rhs, opts)
end

-- Select all
key("n", "<leader>a", "gg<S-v>G")

-- Split window
key("n", "ss", ":split<Return>")
key("n", "sv", ":vsplit<Return>")

-- quick quit
key("n", "<leader>q", ":q!<CR>")

-- quick save
key("n", "z", _G.custom_notify("<cmd>w<cr>", "  ", "info", "File status", "500", "   ", "compact"))

-- quick format & save
key(
  { "n", "i" },
  "zf",
  _G.custom_notify("<cmd>LazyFormat<cr><cmd>:w<cr>", "󱡄 +  ", "info", "File status", "500", "   ", "compact")
)

-- esc & saves ! simple !
key("i", "<esc>", "<esc>:w<cr>")

-- move line up/down
key("v", "J", ":m '>+1<cr>gv=gv")
key("v", "K", ":m '<-2<cr>gv=gv")

-------------
-- PLUGINS --
-------------
key(
  "n",
  "<leader>m",
  "<CMD>!tmux display-popup -w 130 -h 40 -E 'env TERM=wezterm nvim /Users/thanhhoann/core_machine/desktop/obsidian/TODOs.md'<CR>"
)

-- neogit https://github.com/NeogitOrg/neogit
key("n", "<leader>gg", ":Neogit<CR>")

-- nvim-spectre https://github.com/nvim-pack/nvim-spectre
key("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word",
})
key("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word",
})
key("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file",
})

-- nvim-rip-substiture https://github.com/chrisgrieser/nvim-rip-substitute
key({ "n", "x" }, "<leader>fs", function()
  require("rip-substitute").sub()
end)

-- yanky.nvim https://github.com/gbprod/yanky.nvim
key("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
key("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
key("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
key("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

key("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
key("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
key("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
key("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

key("n", "=p", "<Plug>(YankyPutAfterFilter)")
key("n", "=P", "<Plug>(YankyPutBeforeFilter)")

key({ "n", "i" }, "<c-p>", "<cmd>Telescope yank_history<cr>")
-- key("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
-- key("n", "<c-n>", "<Plug>(YankyNextEntry)")
