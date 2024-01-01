local fterm = require("FTerm")

require 'FTerm'.setup({
    border     = 'single',
    dimensions = {
        height = 0.8,
        width = 0.9,
    },
    blend      = 10,
})

vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('n', '<leader>tc', '<CMD>lua require("FTerm").run("vim_config")<CR>')
vim.keymap.set('n', '<leader>tf', '<CMD>lua require("FTerm").run("fx")<CR> | <CMD>lua require("FTerm").close()<CR>')

-- gitui

local gitui = fterm:new({
    ft = 'fterm_gitui', -- You can also override the default filetype, if you want
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    },
})

vim.keymap.set('n', '<leader>tg', function() gitui:toggle() end)
vim.keymap.set('n', '<leader>tgc', '<CMD>lua require("FTerm").run("cd ~/.config/gitui")<CR>')

-- btop

local btop = fterm:new({
    ft = 'fterm_btop',
    cmd = "btop"
})

vim.keymap.set('n', '<leader>tb', function() btop:toggle() end)
vim.keymap.set('n', '<leader>tbc', '<CMD>lua require("FTerm").run("nvim ~/.config/btop/btop.conf")<CR>')

