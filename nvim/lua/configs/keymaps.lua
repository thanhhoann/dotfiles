local key = vim.keymap.set
vim.g.mapleader = " "

--          ╭─────────────────────────────────────────────────────────╮
--          │                          TMUX                           │
--          ╰─────────────────────────────────────────────────────────╯

-- send "R" window "1" to hot restart. for simulators, bc web i had dashmon :)
key('n', '<leader>fr', ':w<cr>:LspZeroFormat<cr>:! tmux send-keys -t "1" R<cr><cr>')

--          ╭─────────────────────────────────────────────────────────╮
--          │                       NORMAL MODE                       │
--          ╰─────────────────────────────────────────────────────────╯

-- useful !
key('n', 'W', ':w!<CR>')
key('n', 'WQ', ':wq!<CR>')
key('n', 'Q', ':q!<CR>')

-- format
key('n', '<leader>f', ':LspZeroFormat<CR>:w<CR>')
-- replace selected word with regex
key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- format -> save -> source
key('n', "<leader>n", ':LspZeroFormat<CR>:w<CR>:so<CR>')
-- select all
key('n', "<leader>a", "ggVG")
-- quit
key('n', 'Z', ':wq<CR>')
-- maximize the buffer
key('n', '<leader>bm', "<C-w>T<cr>")
-- after maximize the buffer, return to splits
key('n', '<Leader>br', "mAZZ<C-w>S`A")
-- repeating macro ',', instead of '@@'
key('n', ',', '@@')

--          ╭─────────────────────────────────────────────────────────╮
--          │                       VISUAL MODE                       │
--          ╰─────────────────────────────────────────────────────────╯

-- moving strings
key("v", "J", ":m '>+1<CR>gv=gv")
key("v", "K", ":m '<-2<CR>gv=gv")
-- indenting
key('v', '>', '>gv')
key('v', '<', '<gv')
-- copy on exits
key('v', '<C-c>', '"+y')

--          ╭─────────────────────────────────────────────────────────╮
--          │                       INSERT MODE                       │
--          ╰─────────────────────────────────────────────────────────╯

-- escaping
key("i", "<C-c>", "<Esc>")
-- moving
key("i", "<C-k>", "<C-o>gk") -- up
key("i", "<C-j>", "<C-o>gj") -- down
key("i", "<C-h>", "<Left>")
key("i", "<C-l>", "<Right>")

--          ╭─────────────────────────────────────────────────────────╮
--          │                         COMMON                          │
--          ╰─────────────────────────────────────────────────────────╯

-- clipboard
key({ "n", "v" }, "<leader>y", [["+y]])
key({ "n", "v" }, "<leader>p", [["+p]])
-- backspace
key('n', '<BS>', 'x')
key('v', '<BS>', '<BS>x')
