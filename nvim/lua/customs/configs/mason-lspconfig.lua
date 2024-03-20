return {
    'williamboman/mason-lspconfig.nvim',
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup_handlers({
                ["pylsp"] = function()
                    require("lspconfig").pylsp.setup({
                        on_attach = function(client, bufnr)
                            require("navigator.lspclient.mapping").setup({ client = client, bufnr = bufnr }) -- setup navigator keymaps here,
                            require("navigator.dochighlight").documentHighlight(bufnr)
                            require("navigator.codeAction").code_action_prompt(bufnr)
                        end,
                    })
                end,
            })
            -- require("mason-lspconfig").setup({})
        end,
    }
}
