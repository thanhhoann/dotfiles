local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
    -- sources = {
    --     null_ls.builtins.diagnostics.eslint.with({
    --         only_local = "node_modules/.bin",
    --     }), -- eslint or eslint_d
    --     -- null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
    --     -- null_ls.builtins.formatting.prettier  -- prettier, eslint, eslint_d, or prettierd
    -- },
})
