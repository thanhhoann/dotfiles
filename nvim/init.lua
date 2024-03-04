require 'thanhhoann'
require 'customs'
-- require 'utils'

-- STARTUP Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme catppuccin-macchiato")
vim.g.theme_id = 11
-- end themery block

if vim.fn.has("persistent_undo") == 1 then
    local target_path = vim.fn.expand('~/.undodir')
    -- -- Create the directory and any parent directories
    -- -- if the location does not exist.
    if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.mkdir(target_path, "p", 0700)
    end
    vim.opt.undodir = target_path
    vim.opt.undofile = true
end

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = vim.api.nvim_create_augroup('highlight-on-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
