return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls").builtins
      opts.sources = { --override lazyvim's default sources
        -- nls.code_actions.gitsigns,
        -- go
        nls.code_actions.gomodifytags,
        nls.code_actions.impl,
        nls.formatting.goimports,
        -- nls.diagnostics.golangci_lint,
        -- ts
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
        -- other
        nls.formatting.stylua,
        nls.formatting.shfmt.with({
          filetypes = { "sh", "zsh" },
        }),
      }
      opts.debug = true
      return opts
    end,
  },
}
