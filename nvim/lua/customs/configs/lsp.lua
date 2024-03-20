local lsp = require("lsp-zero")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp.default_setup,
    },
})

-- lsp.set_preferences({
--     suggest_lsp_servers = true,
-- })

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

-- require 'lspconfig'.tsserver.setup {
--     filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--     init_options = {
--         single_file_support = false,
--         settings = {
--             javascript = {
--                 inlayHints = {
--                     includeInlayParameterNameHints = "all",
--                     includeInlayParameterNameHintsWhenArgumentMatchesName = false,
--                     includeInlayFunctionParameterTypeHints = true,
--                     includeInlayVariableTypeHints = true,
--                     includeInlayPropertyDeclarationTypeHints = true,
--                     includeInlayFunctionLikeReturnTypeHints = true,
--                     includeInlayEnumMemberValueHints = true,
--                 },
--             },
--         }
--     }
-- }

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

-- require 'lspconfig'.tsserver.setup({
--     -- Needed for inlayHints. Merge this table with your settings or copy
--     -- it from the source if you want to add your own init_options.
--     init_options = require("nvim-lsp-ts-utils").init_options,
--     --
--     on_attach = function(client, bufnr)
--         local ts_utils = require("nvim-lsp-ts-utils")
--
--         -- defaults
--         ts_utils.setup({
--             debug = false,
--             disable_commands = false,
--             enable_import_on_completion = true,
--
--             -- import all
--             import_all_timeout = 5000, -- ms
--             -- lower numbers = higher priority
--             import_all_priorities = {
--                 same_file = 1,      -- add to existing import statement
--                 local_files = 2,    -- git files or files with relative path markers
--                 buffer_content = 3, -- loaded buffer content
--                 buffers = 4,        -- loaded buffer names
--             },
--             import_all_scan_buffers = 100,
--             import_all_select_source = false,
--             -- if false will avoid organizing imports
--             always_organize_imports = true,
--
--             -- filter diagnostics
--             filter_out_diagnostics_by_severity = {},
--             filter_out_diagnostics_by_code = {},
--
--             -- inlay hints
--             auto_inlay_hints = true,
--             inlay_hints_highlight = "Comment",
--             inlay_hints_priority = 200, -- priority of the hint extmarks
--             inlay_hints_throttle = 150, -- throttle the inlay hint request
--             inlay_hints_format = {      -- format options for individual hint kind
--                 Type = {},
--                 Parameter = {},
--                 Enum = {},
--                 -- Example format customization for `Type` kind:
--                 -- Type = {
--                 --     highlight = "Comment",
--                 --     text = function(text)
--                 --         return "->" .. text:sub(2)
--                 --     end,
--                 -- },
--             },
--
--             -- update imports on file move
--             update_imports_on_move = true,
--             require_confirmation_on_move = false,
--             watch_dir = nil,
--         })
--
--         -- required to fix code action ranges and filter diagnostics
--         ts_utils.setup_client(client)
--
--         -- no default maps, so you may want to define some here
--         local opts = { silent = true }
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "tss", ":TSLspOrganize<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "tsr", ":TSLspRenameFile<CR>", opts)
--         vim.api.nvim_buf_set_keymap(bufnr, "n", "tsi", ":TSLspImportAll<CR>", opts)
--     end,
-- })
