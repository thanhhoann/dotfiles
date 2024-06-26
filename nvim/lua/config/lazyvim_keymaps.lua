-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead

-- better up/down
LazyVim.safe_keymap_set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
LazyVim.safe_keymap_set(
  { "n", "x" },
  "<Down>",
  "v:count == 0 ? 'gj' : 'j'",
  { desc = "Down", expr = true, silent = true }
)
LazyVim.safe_keymap_set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
LazyVim.safe_keymap_set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
LazyVim.safe_keymap_set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
LazyVim.safe_keymap_set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
LazyVim.safe_keymap_set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
LazyVim.safe_keymap_set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
LazyVim.safe_keymap_set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
LazyVim.safe_keymap_set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
LazyVim.safe_keymap_set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
LazyVim.safe_keymap_set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
LazyVim.safe_keymap_set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
LazyVim.safe_keymap_set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
LazyVim.safe_keymap_set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
LazyVim.safe_keymap_set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
LazyVim.safe_keymap_set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- buffers
LazyVim.safe_keymap_set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
LazyVim.safe_keymap_set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
LazyVim.safe_keymap_set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
LazyVim.safe_keymap_set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
LazyVim.safe_keymap_set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
LazyVim.safe_keymap_set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
LazyVim.safe_keymap_set("n", "<leader>bd", LazyVim.ui.bufremove, { desc = "Delete Buffer" })
LazyVim.safe_keymap_set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search with <esc>
LazyVim.safe_keymap_set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
LazyVim.safe_keymap_set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
LazyVim.safe_keymap_set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
LazyVim.safe_keymap_set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
LazyVim.safe_keymap_set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
LazyVim.safe_keymap_set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
LazyVim.safe_keymap_set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
LazyVim.safe_keymap_set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
LazyVim.safe_keymap_set("i", ",", ",<c-g>u")
LazyVim.safe_keymap_set("i", ".", ".<c-g>u")
LazyVim.safe_keymap_set("i", ";", ";<c-g>u")

-- save file
LazyVim.safe_keymap_set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
LazyVim.safe_keymap_set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
LazyVim.safe_keymap_set("v", "<", "<gv")
LazyVim.safe_keymap_set("v", ">", ">gv")

-- commenting
LazyVim.safe_keymap_set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
LazyVim.safe_keymap_set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
LazyVim.safe_keymap_set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
LazyVim.safe_keymap_set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

LazyVim.safe_keymap_set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
LazyVim.safe_keymap_set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

LazyVim.safe_keymap_set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
LazyVim.safe_keymap_set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
LazyVim.safe_keymap_set({ "n", "v" }, "<leader>f", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
LazyVim.safe_keymap_set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
LazyVim.safe_keymap_set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
LazyVim.safe_keymap_set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
LazyVim.safe_keymap_set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
LazyVim.safe_keymap_set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
LazyVim.safe_keymap_set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
LazyVim.safe_keymap_set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
LazyVim.safe_keymap_set("n", "<leader>uf", function() LazyVim.format.toggle() end,
  { desc = "Toggle Auto Format (Global)" })
LazyVim.safe_keymap_set("n", "<leader>uF", function() LazyVim.format.toggle(true) end,
  { desc = "Toggle Auto Format (Buffer)" })
LazyVim.safe_keymap_set("n", "<leader>us", function() LazyVim.toggle("spell") end, { desc = "Toggle Spelling" })
LazyVim.safe_keymap_set("n", "<leader>uw", function() LazyVim.toggle("wrap") end, { desc = "Toggle Word Wrap" })
LazyVim.safe_keymap_set("n", "<leader>uL", function() LazyVim.toggle("relativenumber") end,
  { desc = "Toggle Relative Line Numbers" })
LazyVim.safe_keymap_set("n", "<leader>ul", function() LazyVim.toggle.number() end, { desc = "Toggle Line Numbers" })
LazyVim.safe_keymap_set("n", "<leader>ud", function() LazyVim.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
LazyVim.safe_keymap_set("n", "<leader>uc", function() LazyVim.toggle("conceallevel", false, { 0, conceallevel }) end,
  { desc = "Toggle Conceal" })
if vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint then
  LazyVim.safe_keymap_set("n", "<leader>uh", function() LazyVim.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
end
LazyVim.safe_keymap_set("n", "<leader>uT",
  function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end,
  { desc = "Toggle Treesitter Highlight" })
LazyVim.safe_keymap_set("n", "<leader>ub", function() LazyVim.toggle("background", false, { "light", "dark" }) end,
  { desc = "Toggle Background" })

-- lazygit
-- LazyVim.safe_keymap_set("n", "<leader>gg", function() LazyVim.lazygit({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
LazyVim.safe_keymap_set("n", "<leader>gG", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
LazyVim.safe_keymap_set("n", "<leader>gb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
LazyVim.safe_keymap_set("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })

LazyVim.safe_keymap_set("n", "<leader>gf", function()
  local git_path = vim.api.nvim_buf_get_name(0)
  LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } })
end, { desc = "Lazygit Current File History" })

LazyVim.safe_keymap_set("n", "<leader>gl", function()
  LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Log" })
LazyVim.safe_keymap_set("n", "<leader>gL", function()
  LazyVim.lazygit({ args = { "log" } })
end, { desc = "Lazygit Log (cwd)" })

-- quit
LazyVim.safe_keymap_set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
LazyVim.safe_keymap_set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
LazyVim.safe_keymap_set("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- LazyVim Changelog
LazyVim.safe_keymap_set("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
LazyVim.safe_keymap_set("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
LazyVim.safe_keymap_set("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
LazyVim.safe_keymap_set("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
LazyVim.safe_keymap_set("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
LazyVim.safe_keymap_set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
LazyVim.safe_keymap_set("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
LazyVim.safe_keymap_set("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
LazyVim.safe_keymap_set("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
LazyVim.safe_keymap_set("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
LazyVim.safe_keymap_set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
LazyVim.safe_keymap_set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- windows
LazyVim.safe_keymap_set("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
LazyVim.safe_keymap_set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
LazyVim.safe_keymap_set("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
LazyVim.safe_keymap_set("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
LazyVim.safe_keymap_set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
LazyVim.safe_keymap_set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
LazyVim.safe_keymap_set("n", "<leader>wm", function() LazyVim.toggle.maximize() end, { desc = "Maximize Toggle" })

-- tabs
LazyVim.safe_keymap_set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
LazyVim.safe_keymap_set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
LazyVim.safe_keymap_set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
LazyVim.safe_keymap_set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
LazyVim.safe_keymap_set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
LazyVim.safe_keymap_set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
LazyVim.safe_keymap_set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
