local set = vim.keymap.set

-- PERSONAL
-- lazygit on tmux
-- set("n", "<leader>gt", "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>", { desc = "Git Go" })

-- so I dont have to press ":"
set("n", "<leader>w", ":w<CR>")

set("n", "<leader>f", ":w<CR>:lua vim.lsp.buf.format { async = true }<CR>")

-- Select all
set("n", "<leader>a", "gg<S-v>G")

-- Split window
set("n", "ss", ":split<Return>")
set("n", "sv", ":vsplit<Return>")

-- quick quit
set("n", "<leader>q", ":q!<CR>")
-- quick save
set("n", "<leader>wq", ":wq<CR>")

-- PLUGINS

-- open a tmux popup for noting todos
set(
  "n",
  "<leader>m",
  "<CMD>!tmux display-popup -w 80 -h 30 -E 'env TERM=wezterm nvim /Users/thanhhoann/core_machine/desktop/studies/TODOs.md'<CR>"
)

-- telescope
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
set("n", "<leader>gc", live_grep_args_shortcuts.grep_word_under_cursor)

-- neogit https://github.com/NeogitOrg/neogit
set("n", "<leader>gg", ":Neogit<CR>")

-- search-replace.nvim https://github.com/roobert/search-replace.nvim
set("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>")
set("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>")
set("v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>")

set("n", "<leader>rs", "<CMD>SearchReplaceSingleBufferSelections<CR>")
set("n", "<leader>ro", "<CMD>SearchReplaceSingleBufferOpen<CR>")
set("n", "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>")
set("n", "<leader>rW", "<CMD>SearchReplaceSingleBufferCWORD<CR>")
set("n", "<leader>re", "<CMD>SearchReplaceSingleBufferCExpr<CR>")
set("n", "<leader>rf", "<CMD>SearchReplaceSingleBufferCFile<CR>")

set("n", "<leader>rbs", "<CMD>SearchReplaceMultiBufferSelections<CR>")
set("n", "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>")
set("n", "<leader>rbw", "<CMD>SearchReplaceMultiBufferCWord<CR>")
set("n", "<leader>rbW", "<CMD>SearchReplaceMultiBufferCWORD<CR>")
set("n", "<leader>rbe", "<CMD>SearchReplaceMultiBufferCExpr<CR>")
set("n", "<leader>rbf", "<CMD>SearchReplaceMultiBufferCFile<CR>")
