local lsp = require("lsp-zero")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp.default_setup,
    },
})

lsp.set_preferences({
    suggest_lsp_servers = true,
})
lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.on_attach(function(client, bufnr)
    -- lsp.default_keymaps({ buffer = bufnr })
    lsp.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set('n', 'ca', '<cmd> lua vim.lsp.buf.code_action()<cr>', opts)
    vim.keymap.set('n', 'ch', '<cmd> lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', 'cf', '<cmd> lua vim.diagnostic.setqflist()<cr>', opts)
end)

vim.diagnostic.config({
    virtual_text = true
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = false }),
    ["<C-k>"] = cmp.mapping.complete(),
})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
lsp.setup({ mapping = cmp_mappings })


-- LANGUAGE SERVER(S) SETUP

require 'lspconfig'.dartls.setup {
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true
    },
    settings = {
        dart = {
            completeFunctionCalls = true,
            showTodos = true,
            enableSdkFormatter = true
        }
    }
}

require 'lspconfig'.tsserver.setup {
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    init_options = {
        single_file_support = false,
        settings = {
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        }
    }

}

require 'lspconfig'.lua_ls.setup {
    mason = false,
    cmd = { "lua-language-server" },
    single_file_support = true,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    -- runtime = {
                    --     version = 'LuaJIT'
                    -- },
                    workspace = {
                        checkThirdParty = false,
                    },
                    completion = {
                        workspaceWord = true,
                        callSnippet = "Both",
                    },
                    misc = {
                        parameters = {
                            "--log-level=trace",
                        },
                    },
                    diagnostics = {
                        globals = { 'vim' },
                        disable = { "incomplete-signature-doc" },
                        -- enable = false,
                        groupSeverity = {
                            strong = "Warning",
                            strict = "Warning",
                        },
                        groupFileStatus = {
                            ["ambiguity"] = "Opened",
                            ["await"] = "Opened",
                            ["codestyle"] = "None",
                            ["duplicate"] = "Opened",
                            ["global"] = "Opened",
                            ["luadoc"] = "Opened",
                            ["redefined"] = "Opened",
                            ["strict"] = "Opened",
                            ["strong"] = "Opened",
                            ["type-check"] = "Opened",
                            ["unbalanced"] = "Opened",
                            ["unused"] = "Opened",
                        },
                        unusedLocalExclude = { "_*" },
                    },
                    format = {
                        enable = false,
                        defaultConfig = {
                            indent_style = "space",
                            indent_size = "2",
                            continuation_indent_size = "2",
                        },
                    },
                    hint = {
                        enable = true,
                        setType = true,
                    },
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
}