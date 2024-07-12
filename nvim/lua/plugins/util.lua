return {
  { "brenoprata10/nvim-highlight-colors", lazy = true },
  { "justinsgithub/wezterm-types" },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "f",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },

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

  -- {
  --   "willothy/wezterm.nvim",
  --   config = true,
  -- },

  {
    "dhruvmanila/browser-bookmarks.nvim",
    version = "*",
    opts = {
      selected_browser = "brave",
    },
    dependencies = {
      -- Only if you're using the Telescope extension
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      -- you'll need at least one of these
      -- {'nvim-telescope/telescope.nvim'},
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require("neoclip").setup()
    end,
  },

  {
    "FelipeLema/cmp-async-path",
  },

  {
    "andersevenrud/cmp-tmux",
  },

  {
    "onsails/lspkind.nvim",
  },

  -- { "jcha0713/cmp-tw2css" },

  { "bullets-vim/bullets.vim" },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },

  {
    "Wansmer/treesj",
    keys = { "<leader>zz", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({})
    end,
  },
  -- {
  --   "rachartier/tiny-inline-diagnostic.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("tiny-inline-diagnostic").setup()
  --   end,
  -- },
}
