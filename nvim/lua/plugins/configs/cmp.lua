local cmp = require("cmp")
cmp.setup({
  sources = cmp.config.sources({
    {
      name = "nvim_lsp",
      option = {
        markdown_oxide = {
          keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
        },
      },
    },
  }),
})
