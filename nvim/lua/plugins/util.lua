return {
  { "dmmulroy/ts-error-translator.nvim" },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup({})
    end,
  },

  {
    "sarrisv/readermode.nvim",
    config = function()
      require("readermode").setup({
        enable = true,
        keymap = "<leader>R",
      })
    end,
  },

  { "brenoprata10/nvim-highlight-colors", lazy = true },
  { "justinsgithub/wezterm-types" },

  {
    "roobert/search-replace.nvim",
    config = function()
      require("search-replace").setup({
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
  },

  { "cpea2506/relative-toggle.nvim" },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },


  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
  },

  -- {
  --   "jackMort/ChatGPT.nvim",
    -- event = "VeryLazy",
    -- dependencies = {
    --   "MunifTanjim/nui.nvim",
    --   "nvim-lua/plenary.nvim",
    --   "folke/trouble.nvim",
    --   "nvim-telescope/telescope.nvim",
    -- },
  --   config = function()
  --     require("chatgpt").setup({
  --       api_key_cmd = "op read op://private/OpenAI/credential --no-newline"
  --     })
  --   end,
  -- },


}
