local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'buffer' },
            { name = 'snippy' },
            -- { name = 'path' },
            { name = 'cmdline' },
            -- { name = 'fish' },
            -- { name = "fonts",   option = { space_filter = "-" } }
        }),

    mapping = {
        ['<C-Space>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
                -- elseif luasnip.expand_or_jumpable() then
                --     luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
                -- elseif luasnip.jumpable(-1) then
                --     luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

})

-- cmp-cmdline
--
-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

-- cmp-fonts
--
-- Only enable `fonts` for only * file types
cmp.setup.filetype({ "conf", "config", "toml" },
    { sources = { { name = "fonts" } } })

-- cmp-lsp
--
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}

require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities
}
