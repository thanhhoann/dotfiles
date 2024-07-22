return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
      },
      codelens = {
        enabled = false,
      },
      -- make sure mason installs the server
      servers = {
        -- not installing tsserver
        tsserver = {
          enabled = false,
        },
      },
      setup = {
        tsserver = function()
          -- disable tsserver
          return true
        end,
      },
    },
  },

  -- Add icons for completion items
  { "onsails/lspkind.nvim" },

  -- LSP Diagnostic Virtual Text Revamped
  {
    "sontungexpt/better-diagnostic-virtual-text",
    config = function(_)
      require("better-diagnostic-virtual-text").setup({
        inline = false,
      })
    end,
  },

  -- In case you dont like the above
  -- {
  --   "rachartier/tiny-inline-diagnostic.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("tiny-inline-diagnostic").setup()
  --   end,
  -- },
}
