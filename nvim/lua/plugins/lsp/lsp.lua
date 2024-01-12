local lsp = require("lsp-zero")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp.default_setup,
    },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})


cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- LANGUAGE SERVER(S) SETUP

require 'lspconfig'.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
}
