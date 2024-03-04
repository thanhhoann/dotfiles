local projections = require 'projections'.setup({
    -- workspaces = {
    --     "~/.config/nvim",
    --     { '~/.config/nvim/', {} }
    -- }
})

local Workspace = require("projections.workspace")
-- Add workspace command
vim.api.nvim_create_user_command("AddWorkspace", function()
    Workspace.add(vim.loop.cwd())
end, {})
