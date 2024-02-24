local key = vim.keymap.set
vim.g.mapleader = " "

--          ╭─────────────────────────────────────────────────────────╮
--          │                          UNMAP                          │
--          ╰─────────────────────────────────────────────────────────╯
-- vim.keymap.del('i', '<C-n')

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

-- toggle todo check in markdown
key('n', '<c-x>', '0lllxix<C-c>0')
-- key('n', '<c-x>', function()
--     if vim.api.nvim_buf_get_option(0, 'filetype') == 'markdown' then
--         return '0lllxix<C-c>0'
--     end
-- end)

-- format on normal
key('n', '<leader>f', function()
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'javascript' then
        vim.api.nvim_command(":Prettier")
    elseif vim.api.nvim_buf_get_option(0, 'filetype') == 'javascriptreact' then
        vim.api.nvim_command(":Prettier")
    else
        vim.api.nvim_command(":LspZeroFormat")
    end
end)

-- yank -> select line -> comment -> paste
key('n', "y/", "yy" .. "V" .. ":CommentToggle<cr>" .. "p")

-- replace selected word with regex
key("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- format -> save -> source
key('n', "<leader>n", ':LspZeroFormat<CR>:w<CR>:so<CR>')
-- select all
key('n', "<leader>a", "ggVG")
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

-- format on insert
key('i', '<C-f>', function()
    if vim.api.nvim_buf_get_option(0, 'filetype') == 'javascript' then
        vim.api.nvim_command(":Prettier")
    else
        vim.api.nvim_command(":LspZeroFormat")
    end
end)

-- delete line (then go back to insert mode)
key('i', '<c-d>', '<c-c>Vdd<c-c>o<c-c>ki')

-- esc -> go to eol
key('i', '<c-A>', '<c-c>A')


--          ╭─────────────────────────────────────────────────────────╮
--          │                         COMMON                          │
--          ╰─────────────────────────────────────────────────────────╯

-- clipboard
key({ "n", "v" }, "<leader>y", [["+y]])
key({ "n", "v" }, "<leader>p", [["+p]])
-- backspace
key('n', '<BS>', 'x')
key('v', '<BS>', '<BS>x')
