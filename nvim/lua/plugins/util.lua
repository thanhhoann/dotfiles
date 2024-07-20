return {
  { "brenoprata10/nvim-highlight-colors", lazy = true },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown", -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },

  {

    { "FelipeLema/cmp-async-path" },

    { "andersevenrud/cmp-tmux" },

    { "onsails/lspkind.nvim" },

    -- { "jcha0713/cmp-tw2css" },

    -- { "bullets-vim/bullets.vim" },
    -- {
    --   "lukas-reineke/headlines.nvim",
    --   dependencies = "nvim-treesitter/nvim-treesitter",
    --   config = true, -- or `opts = {}`
    -- },

    {
      "MeanderingProgrammer/markdown.nvim",
      name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
      config = function()
        require("render-markdown").setup({})
      end,
    },

    {
      "Wansmer/treesj",
      keys = { "<leader>zz", "<space>j", "<space>s" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
        require("treesj").setup({})
      end,
    },

    { "nvimtools/none-ls-extras.nvim" },

    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },

    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({})
      end,
    },

    {
      -- Telescope + Nerd Icons
      "2kabhishek/nerdy.nvim",
      dependencies = {
        "stevearc/dressing.nvim",
        "nvim-telescope/telescope.nvim",
      },
    },

    { "chrisgrieser/nvim-rip-substitute", cmd = "RipSubstitute" },

    { "David-Kunz/gen.nvim" },

    -- { "akinsho/git-conflict.nvim", version = "*", config = true },

    {
      "davidmh/mdx.nvim",
      config = true,
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- crs snake_case
    -- crm MixedCase
    -- crc camelCase
    -- cru UPPER_CASE
    -- cr- dash-case
    -- cr.dot.case
    { "tpope/vim-abolish" },

    { "mbbill/undotree", lazy = true, cmd = "UndotreeToggle" },
  },
}
