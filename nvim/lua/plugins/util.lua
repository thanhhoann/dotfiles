return {
  -- Add support for color highlighting
  { "brenoprata10/nvim-highlight-colors", lazy = true },

  -- Obsidian + Neovim
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown", -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Scrolling in Neovim with ease
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },

  -- Telescope + Nerd Icons
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- View undo history
  { "mbbill/undotree", lazy = true, cmd = "UndotreeToggle" },

  -- Auto close quickfix by timer
  -- Deletes the Quickfix buffer after closing the window.
  {
    "mei28/qfc.nvim",
    config = function()
      require("qfc").setup({
        timeout = 3000, -- Timeout setting in milliseconds
        enabled = true, -- Enable/disable autoclose feature
      })
      -- ft = 'qf', -- for lazy load
      -- cmd = {'QFC'} -- for lazy load
    end,
  },
}
