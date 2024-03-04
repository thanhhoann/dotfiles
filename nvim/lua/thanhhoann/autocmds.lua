-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--     buffer = event.buf
--     callback = vim.lsp.buf.document_highlight
-- })
--
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--     buffer = event.buf
--     callback = vim.lsp.buf.clear_references
-- })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    group = vim.api.nvim_create_augroup('highlight-on-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
