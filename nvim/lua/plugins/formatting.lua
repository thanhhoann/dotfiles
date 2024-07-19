return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls").builtins
      opts.sources = { --override lazyvim's default sources
        -- nls.code_actions.gitsigns,
        -- go
        -- require("none-ls.code_actions.eslint"),
        nls.code_actions.gomodifytags,
        nls.code_actions.impl,
        nls.formatting.goimports,
        -- nls.diagnostics.golangci_lint,
        nls.formatting.biome.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "json",
            "jsonc",
            "typescript",
            "typescriptreact",
            "css",
          },
          args = {
            "check",
            "--write",
            "--unsafe",
            "--formatter-enabled=true",
            "--organize-imports-enabled=true",
            "--skip-errors",
            "--stdin-file-path=$FILENAME",
          },
        }),
        nls.formatting.stylua,
        nls.formatting.shfmt.with({
          filetypes = { "sh", "zsh" },
        }),
        -- nls.formatting.prettierd.with({
        --   filetypes = {
        --     "javascript",
        --     "javascriptreact",
        --     "json",
        --     "jsonc",
        --     "typescript",
        --     "typescriptreact",
        --     "css",
        --   },
        -- args = {
        --   "check",
        --   "--write",
        --   "--unsafe",
        --   "--formatter-enabled=true",
        --   "--organize-imports-enabled=true",
        --   "--skip-errors",
        --   "--stdin-file-path=$FILENAME",
        -- },
        -- }),
      }
      opts.debug = true
      return opts
    end,
  },
}
